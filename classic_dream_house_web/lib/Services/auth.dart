import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future registerWithEmail(String email, String password, MockUser user) async {
    try {
      User registerUser = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password)).user;

      await DatabaseService(uid: user.uid).updateUserDataOnSignUp(user);
      return _userFromFirebaseUser(registerUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future singInWithEmail(String email, String password) async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
          email: email, password: password))
          .user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
 }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}*/