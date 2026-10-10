import 'package:aiem_project/services/localdb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn.instance;

bool _googleInitialized = false;

Future<void> _ensureGoogleInitialized() async {
  if (_googleInitialized) return;
  await googleSignIn.initialize(
    // Only needed if you get a "serverClientId must be provided" error.
    // Use the Web client ID from Firebase console > Auth > Google provider.
    // serverClientId: 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com',
  );
  _googleInitialized = true;
}

// SIGN IN KA Function
Future<User?> signInWithGoogle() async {
  try {
    await _ensureGoogleInitialized();

    // SIGNING IN WITH GOOGLE
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // CREATING CREDENTIAL FOR FIREBASE (idToken is enough)
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // SIGNING IN WITH CREDENTIAL & GETTING USER
    final userCredential = await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user == null) return null;

    // CHECKING IS ON
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(_auth.currentUser!.uid == user.uid);

    print(user);
    LocalDataSaver.saveLoginData(true);
    LocalDataSaver.saveName(user.displayName.toString());
    LocalDataSaver.saveMail(user.email.toString());
    LocalDataSaver.saveImg(user.photoURL.toString());

    return user;
  } on GoogleSignInException catch (e) {
    // user cancelled or Google sign-in failed
    print('Google sign-in error: ${e.code}');
    return null;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<String> signOut() async {
  await _ensureGoogleInitialized();
  await googleSignIn.signOut();
  await _auth.signOut();
  return "SUCCESS";
}