import 'package:flutter/material.dart';
import 'package:radcode/model/post.dart';
import 'package:radcode/widgets/post_card.dart';

class PostList extends StatelessWidget {
  PostList() : super();

  // final posts = getPosts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: Post.fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
         return Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (BuildContext _context, int i) {
             
              if (i < snapshot.data.length) {
                return buildPostCard(snapshot.data[i]);
              }
            },
          ));
        } else if (snapshot.hasError) {
          throw Exception(snapshot.error);
        } else {
          return Expanded(child: Container(
            padding: EdgeInsets.all(15),
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 3,valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
              )
          ));
        }
      },
    );
  }
}
