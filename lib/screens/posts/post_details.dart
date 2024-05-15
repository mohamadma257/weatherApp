import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_me_admin/firebase/fire_store.dart';
import 'package:find_me_admin/models/posts..dart';
import 'package:find_me_admin/models/users.dart';
import 'package:find_me_admin/screens/posts/photo_view.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key, required this.postModel});
  final PostModel postModel;

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  UserModel? userModel;
  String? catName;
  String myId = FirebaseAuth.instance.currentUser!.uid;
  getUserDetail() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.postModel.userID)
        .get()
        .then((value) {
      if (mounted) {
        setState(() {
          userModel = UserModel.fromJson(value.data()!);
        });
      }
    });
  }

  getCatName() async {
    await FirebaseFirestore.instance
        .collection('category')
        .doc(widget.postModel.catId)
        .get()
        .then((value) {
      if (mounted) {
        setState(() {
          catName = value.data()!['name'];
        });
      }
    });
  }

  @override
  void initState() {
    getUserDetail();
    getCatName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _launchInBrowserView(Uri url) async {
      if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
        throw Exception('Could not launch $url');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: userModel == null || catName == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(widget.postModel.title),
                              subtitle: Text(widget.postModel.description),
                              trailing: Badge(
                                backgroundColor: widget.postModel.isLost
                                    ? Colors.red
                                    : Colors.green,
                                largeSize: 30,
                                smallSize: 20,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                label: Text(!widget.postModel.isLost
                                    ? "Found"
                                    : "Lost"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: widget.postModel.image != ""
                                  ? GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PhotoScreen(
                                                image: widget.postModel.image),
                                          )),
                                      child: Container(
                                        child: Image.network(
                                          widget.postModel.image,
                                          fit: BoxFit.fill,
                                        ),
                                        padding: EdgeInsets.all(12),
                                        width: 120,
                                        height: 120,
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.all(12),
                                      width: 120,
                                      height: 120,
                                      child: SvgPicture.asset(
                                          colorFilter: ColorFilter.mode(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                              BlendMode.srcIn),
                                          'assets/svg/logo.svg'),
                                    ),
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text("Status"),
                        trailing: Badge(
                          largeSize: 20,
                          backgroundColor: widget.postModel.status == "approved"
                              ? Colors.green
                              : widget.postModel.status == "pending"
                                  ? Colors.amber
                                  : Colors.red,
                          label: Text(widget.postModel.status.toUpperCase()),
                        ),
                      ),
                      ListTile(
                        title: Text("Posted by:"),
                        subtitle:
                            Text(userModel != null ? userModel!.fname : ""),
                      ),
                      ListTile(
                        title: Text("address"),
                        subtitle: Text(widget.postModel.location),
                      ),
                      ListTile(
                        title: Text("Phone"),
                        subtitle: Text(userModel!.phone),
                      ),
                      ListTile(
                        title: Text("category"),
                        subtitle: Text(catName!),
                      ),
                      ListTile(
                        title: Text("reward"),
                        subtitle: Text(widget.postModel.reward),
                      ),
                      ListTile(
                        title: Text("date"),
                        subtitle: Text(DateFormat.yMMMEd().format(
                            DateTime.parse(widget.postModel.createdAt))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(children: [
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  onPressed: () {
                                    FireData().editPost(
                                        postId: widget.postModel.id,
                                        status: 'approved');
                                    setState(() {
                                      widget.postModel.status = 'approved';
                                    });
                                  },
                                  child: Text("Approve",
                                      style: TextStyle(color: Colors.white))),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  onPressed: () {
                                    FireData().editPost(
                                        postId: widget.postModel.id,
                                        status: 'rejected');
                                    setState(() {
                                      widget.postModel.status = 'rejected';
                                    });
                                  },
                                  child: Text(
                                    "Reject",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
