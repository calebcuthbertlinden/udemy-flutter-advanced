
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<bool> signOut() async {
  await auth.signOut();
  return true;
}

Stream<User?> initialiseStateListener()  {
  return auth.authStateChanges();
}

Future<Null> ensureLoggedIn() async {
  User? user = auth.currentUser;
  assert(user != null);
  assert(user!.isAnonymous == true);
  print("User logged in!");
}

Future<bool> signInGoogle() async {
  GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  await auth.signInWithCredential(credential);
  return true;
}

Future<Null> signInAnonymous() async {
  await auth.signInAnonymously();
}