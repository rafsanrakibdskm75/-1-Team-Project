
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_chating/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live_chating/services/firestore_service.dart';


class AuthService {
   final FirebaseAuth _auth = FirebaseAuth.instance;
   final FirestoreService _firestoreService = FirestoreService();

   User? get currentUser => _auth.currentUser;
   String? get currentUserId => _auth.currentUser?.uid;

   Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserModel?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if(user != null){
        await _firestoreService.updateUserOnlineStatus(user.uid, true);
        return await _firestoreService.getUser(user.uid);
      } return null;
        }catch (e) {
          throw Exception('Failed to sign in: $e');
        };
  }

  Future<UserModel?> registerWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if(user != null){
        await user.updateDisplayName(displayName);
        final userModel =   UserModel(
          id: user.uid,
          email: email,
          displayName: displayName,
          profileUrl: "",
          isOnline: true,


          lastSeen: DateTime.now(),
          createdAt: DateTime.now(),
        );
        await _firestoreService.createUser(userModel);
        return userModel;
      } return null;
        }catch (e) {
          throw Exception('Failed to register: $e');
        };
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to send password reset email: $e');
    }
  }

  Future<void> signOut() async {
    try {
      if (currentUser != null) {
        await _firestoreService.updateUserOnlineStatus(currentUserId!, false);
      }
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  Future<void> deleteAccount() async {
    try {
      if (currentUser != null) {
        await _firestoreService.updateUserOnlineStatus(currentUserId!, false);
        await _firestoreService.deleteUser(currentUserId!);
        await currentUser!.delete();
      }
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }


}