# AIEM Club App

The official mobile app of the **AIEM Club**. Members can track the credits they earn, see upcoming events, watch learning videos, and explore the club's best teams and projects, all in one place.

Built with **Flutter** and **Firebase**.

---

## Features

- **Secure login** with Firebase Authentication (email and password)
- **Credits dashboard** showing the total credits a member has earned
- **Upcoming events** with free or paid labels and fees
- **Info videos** in an auto-sliding carousel that opens YouTube
- **Best teams and projects** showcase
- **Member profiles** with position, department, bio, and full task history
- **Core team page** listing the club leadership with profile links
- **Notifications** for credit updates
- **Animated app bar** that changes color as you scroll

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| Authentication | Firebase Authentication |
| Database | Cloud Firestore |
| Android build | Gradle (Kotlin DSL), AGP 8.9, Kotlin 2.3 |
| Seeding | Node.js and Firebase Admin SDK |

**Key packages:** `firebase_core`, `firebase_auth`, `cloud_firestore`, `google_sign_in`, `carousel_slider`, `font_awesome_flutter`, `expandable_text`, `url_launcher`, `get`

---

## Project Structure

```
lib/
├── main.dart                         # App entry, Firebase init
├── services/
│   ├── auth.dart                     # Google sign-in and sign-out
│   └── localdb.dart                  # Local login/session storage
└── Views/
    ├── SplashScreen.dart             # Splash, then Login
    ├── Login.dart                    # Email/password login
    ├── home.dart                     # Dashboard
    ├── profile.dart                  # Logged-in user's profile
    ├── another_profile.dart          # Other member's profile (by userid)
    ├── AIEM_Core.dart                # Core team grid
    ├── AIEMnotification.dart         # Notifications
    ├── about_us.dart                 # About the club
    ├── CustomAppBar.dart             # Scroll-animated app bar
    ├── DrawerTextButtonContainer.dart
    ├── UpcomingEventsContainer.dart
    ├── TeamsAndProjectsContainer.dart
    ├── TeamDetailsPage.dart
    └── GetInTouchContainer.dart

seed/
├── seed.js                           # Wipes and re-seeds Firestore and Auth
└── seed.json                         # Demo data
```

---

## Getting Started

### Prerequisites

- Flutter SDK (stable channel)
- Android Studio or an Android emulator
- Node.js 18+ (only needed for seeding)
- A Firebase project

### 1. Clone and install

```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
flutter pub get
```

### 2. Connect your Firebase project

Firebase config files are **not** committed. Generate your own:

```bash
npm install -g firebase-tools
firebase login

dart pub global activate flutterfire_cli
flutterfire configure
```

This creates `lib/firebase_options.dart` and registers the Android app (`com.example.aiem_project`).

Then, in the Firebase console:

1. **Authentication**, then **Sign-in method**: enable **Email/Password** and **Google**.
2. **Firestore Database**: create the `(default)` database.
3. **Project settings**, then **Your apps**: add your debug **SHA-1** (needed for Google sign-in):

```bash
cd android
./gradlew signingReport
```

### 3. Seed demo data

1. In the Firebase console, open **Project settings**, then **Service accounts**, then **Generate new private key**.
2. Save the key as `seed/serviceAccountKey.json`. It is git-ignored; **never commit it**.
3. Run:

```bash
cd seed
npm install firebase-admin
node seed.js
```

This **wipes** `users`, `events`, `youtube_videos` and `team_n_project`, then recreates them from `seed.json`. Use `node seed.js --no-wipe` to add data without deleting anything.

**Demo logins:**

| Email | Password | Role |
|---|---|---|
| `demo@aiem.club` | `Demo@12345` | Member |
| `president@aiem.club` | `President@12345` | President |

### 4. Run the app

```bash
flutter run
```

---

## Firestore Data Model

### `users/{email}`

The document ID **must** be the user's email.

| Field | Type | Description |
|---|---|---|
| `email` | string | Lowercase login email |
| `userid` | string | Registration number, used by `another_profile` |
| `name` | string | Full name |
| `position` | string | Club role, e.g. President |
| `department` | string | Branch or course |
| `bio` | string | Short bio |
| `credit` | number | Total credits |
| `profile_pic` | string | Image URL |

### `users/{email}/credits_history/{auto-id}`

| Field | Type | Description |
|---|---|---|
| `task_name` | string | What the credits were for |
| `task_date` | string | `YYYY-MM-DD` (sorted newest first) |
| `credits` | number | Credits awarded |

### `events/{auto-id}`

| Field | Type | Description |
|---|---|---|
| `event_name` | string | Event title |
| `event_date_n_time` | string | Display date and time |
| `isPaid` | bool | Paid or free |
| `fees` | number | Fee in rupees (shown when `isPaid` is true) |

### `youtube_videos/{auto-id}`

| Field | Type | Description |
|---|---|---|
| `title` | string | Video title |
| `videolink` | string | YouTube URL |
| `video_thumb` | string | Thumbnail URL |

### `team_n_project/{auto-id}`

| Field | Type | Description |
|---|---|---|
| `name` | string | Team or project name |
| `thumb` | string | Thumbnail URL |
| `isProject` | bool | Project (true) or team (false) |

---

## Security

- `serviceAccountKey.json`, `google-services.json` and `firebase_options.dart` are git-ignored.
- **Do not deploy test-mode Firestore rules.** Use authenticated read-only rules at minimum:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read: if request.auth != null;
      allow write: if false;
    }
  }
}
```

The seed script uses the Admin SDK, which bypasses these rules.

---

## Troubleshooting

| Problem | Fix |
|---|---|
| `Failed to load FirebaseOptions from resource` | Run `flutterfire configure` |
| `type 'Null' is not a subtype of type 'String'` | A Firestore field is missing. Match it to the data model above |
| `RangeError` on login | No `users` doc with that email. Check the email is lowercase |
| Task history is empty | The user doc ID must be the email, not the UID |
| Google sign-in fails | Add your debug SHA-1 in Firebase project settings |
| Kotlin "incompatible version" error | Bump `org.jetbrains.kotlin.android` in `android/settings.gradle.kts` |
| Kotlin "different roots" error | Add `kotlin.incremental=false` to `android/gradle.properties` |

---

## Roadmap

- [ ] Real streak tracking (currently a placeholder)
- [ ] Live notifications from Firestore
- [ ] Dynamic core team page from the `users` collection
- [ ] Team and project detail pages backed by real data
- [ ] Event registration flow

---

## Contributing

1. Fork the repo.
2. Create a branch: `git checkout -b feature/your-feature`
3. Commit: `git commit -m "Add your feature"`
4. Push and open a Pull Request.

---

## About

Made with ❤️ by the **AIEM Club**.

Questions? Email **codewithdhruv22.gmail.com**.