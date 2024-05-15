import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_me_admin/firebase/fire_store.dart';
import 'package:find_me_admin/models/posts..dart';
import 'package:find_me_admin/screens/posts/post_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({
    super.key,
  });

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  TextEditingController searchCon = TextEditingController();
  String status = 'pending';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      status = 'Pending'.toLowerCase();
                    });
                  },
                  child: Text("Pending"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      status = 'Approved'.toLowerCase();
                    });
                  },
                  child: Text("Approved"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      status = 'Rejected'.toLowerCase();
                    });
                  },
                  child: Text("Rejected"),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .orderBy('created_at', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<PostModel> item = snapshot.data!.docs
                        .map((e) => PostModel.fromJson(e.data()))
                        .where((element) => element.status == status)
                        .toList();

                    if (item.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: item[index].image != ""
                                      ? Container(
                                          child: Image.network(
                                            item[index].image,
                                            fit: BoxFit.fill,
                                          ),
                                          padding: EdgeInsets.all(12),
                                          width: 100,
                                          height: 100,
                                        )
                                      : Container(
                                          padding: EdgeInsets.all(12),
                                          width: 100,
                                          height: 100,
                                          child: SvgPicture.asset(
                                              colorFilter: ColorFilter.mode(
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                                  BlendMode.srcIn),
                                              'assets/svg/logo.svg'),
                                        ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PostDetailsScreen(
                                                  postModel: item[index]),
                                        )),
                                    title: Text(item[index].title),
                                    subtitle: Text(item[index].description),
                                    trailing: Wrap(
                                      spacing: 12, // space between two icons
                                      children: <Widget>[
                                        IconButton(
                                          style: IconButton.styleFrom(
                                              backgroundColor: Colors.green),
                                          icon: Icon(Icons.check),
                                          onPressed: () {
                                            FireData().editPost(
                                                postId: item[index].id,
                                                status: 'approved');
                                          },
                                        ), // icon-1
                                        IconButton(
                                          style: IconButton.styleFrom(
                                              backgroundColor: Colors.red),
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            FireData().editPost(
                                                postId: item[index].id,
                                                status: 'rejected');
                                          },
                                        ), // icon-1
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: SingleChildScrollView(
                            child: Column(children: [
                          SvgPicture.asset('assets/svg/noposts.svg'),
                          Text("No Posts")
                        ])),
                      );
                    }
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}