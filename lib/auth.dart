import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage_screen.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseControllers {
  static signup(String email, String password, BuildContext context) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Exception: $e');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  static login(
      String userEmail, String userPassword, BuildContext context) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Exception: $e');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  static logout(BuildContext context) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signOut().then((value) => Navigator.of(context)
          .pushReplacement(
              MaterialPageRoute(builder: (context) => const Login())));
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  static addDatainFirestore(String title, String desc) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String uid = DateTime.now().millisecondsSinceEpoch.toString();
    await firebaseFirestore.collection('mylist').doc(uid).set({
      'id': uid,
      'title': title,
      'description': desc,
    });
  }

  static getDataFromFirebase() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var uid = firebaseAuth.currentUser!.uid;
      await firebaseFirestore.collection('mylist').doc(uid).get()
          as QuerySnapshot;
    } catch (e) {
      debugPrint('Error here: $e');
    }
  }

  static deleteDataFromFirebase() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var uid = firebaseAuth.currentUser!.uid;
      await firebaseFirestore.collection('mylist').doc(uid).delete()
          as QuerySnapshot;
    } catch (e) {
      debugPrint('Error here: $e');
    }
  }
}
