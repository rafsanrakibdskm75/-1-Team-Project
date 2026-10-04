import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live_chating/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<UserModel> getUser(String userId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  Future<void> updateUserOnlineStatus(String userId, bool isOnline) async {
    try {
        DocumentSnapshot doc = await _firestore
        .collection('users')
        .doc(userId)
        .get();

      if (doc.exists) {
        await _firestore.collection('users').doc(userId).update({
          'isOnline': isOnline,
          'lastSeen': DateTime.now().millisecondsSinceEpoch,
        });
      }
    } catch (e) {
      throw Exception('Failed to update user online status: $e');
    }
  }

  Future<void> updateUserProfile(String userId, String displayName, String profileUrl) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'displayName': displayName,
        'profileUrl': profileUrl,
      });
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }
  
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

}