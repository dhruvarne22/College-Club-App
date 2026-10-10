// Wipes and re-seeds Firestore for the AIEM app from seed.json.
// Also creates (or updates) the matching Firebase Auth users.
//
// Usage:
//   npm install firebase-admin
//   node seed.js            -> wipe + seed
//   node seed.js --no-wipe  -> seed only (overwrites users, appends others)
//
// Needs serviceAccountKey.json in the same folder.

const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
const { getAuth } = require("firebase-admin/auth");
const data = require("./seed.json");

initializeApp({ credential: cert(require("./serviceAccountKey.json")) });

const db = getFirestore();
const auth = getAuth();
const WIPE = !process.argv.includes("--no-wipe");

const COLLECTIONS = ["users", "events", "youtube_videos", "team_n_project"];

// Deletes a collection and all nested subcollections (e.g. users/*/credits_history)
async function wipe(name) {
  await db.recursiveDelete(db.collection(name));
  console.log(`  wiped: ${name}`);
}

async function upsertAuthUser({ email, password, name }) {
  try {
    const existing = await auth.getUserByEmail(email);
    await auth.updateUser(existing.uid, { password, displayName: name });
    console.log(`  auth updated: ${email}`);
  } catch (e) {
    if (e.code !== "auth/user-not-found") throw e;
    await auth.createUser({ email, password, displayName: name });
    console.log(`  auth created: ${email}`);
  }
}

async function seedUsers(users) {
  for (const u of users) {
    const { password, credits_history = [], ...profile } = u;
    profile.email = profile.email.toLowerCase();

    await upsertAuthUser({ email: profile.email, password, name: profile.name });

    // Doc ID = email, because profile.dart reads users/{email}/credits_history
    const userRef = db.collection("users").doc(profile.email);
    await userRef.set(profile);

    const batch = db.batch();
    credits_history.forEach((t) => batch.set(userRef.collection("credits_history").doc(), t));
    await batch.commit();

    console.log(`  users/${profile.email} (+${credits_history.length} credits_history)`);
  }
}

async function seedCollection(name, docs) {
  const batch = db.batch();
  docs.forEach((d) => batch.set(db.collection(name).doc(), d));
  await batch.commit();
  console.log(`  ${name}: ${docs.length} doc(s)`);
}

(async () => {
  if (WIPE) {
    console.log("Wiping old data...");
    for (const c of COLLECTIONS) await wipe(c);
  }

  console.log("Seeding...");
  await seedUsers(data.users);
  await seedCollection("events", data.events);
  await seedCollection("youtube_videos", data.youtube_videos);
  await seedCollection("team_n_project", data.team_n_project);

  console.log("\nDone. Logins:");
  data.users.forEach((u) => console.log(`  ${u.email} / ${u.password}`));
  process.exit(0);
})().catch((e) => {
  console.error(e);
  process.exit(1);
});