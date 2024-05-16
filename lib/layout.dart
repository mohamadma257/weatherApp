import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:find_me_admin/screens/posts/posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LayoutApp extends StatefulWidget {
  const LayoutApp({super.key});

  @override
  State<LayoutApp> createState() => _LayoutAppState();
}

class _LayoutAppState extends State<LayoutApp> {
  Future signout() async {
    await Future.delayed(const Duration(seconds: 5))
        .then((value) => FirebaseAuth.instance.signOut());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Me"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('admin').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> adminList =
                snapshot.data!.docs.map((e) => e.id).toList();
            if (adminList.contains(FirebaseAuth.instance.currentUser!.uid)) {
              return PostsScreen();
            } else {
              signout();
              return Center(
                child: Text("You're not an admin"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
