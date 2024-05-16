import 'package:cloud_firestore/cloud_firestore.dart';

class FireData {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future editPost({
    required String postId,
    required String status,
  }) async {
    await firestore.collection('posts').doc(postId).update({'status': status});
  }

  Future deletePost(String postId) async {
    await firestore.collection('posts').doc(postId).delete();
  }
}
