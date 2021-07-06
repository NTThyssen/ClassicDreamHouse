/*
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: email
      )) as UserCredential;
      return userCredential;
    } catch (e) {
      if (e == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    return null;
  }

  Future<UserCredential> singInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      )) as UserCredential;
      return userCredential;
    } catch (e) {
      if (e == 'user-not-found') {
        print('No user found for that email.');
      } else if (e == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }
 }
*/