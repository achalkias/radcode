import 'package:flutter/material.dart';
import 'package:radcode/model/post.dart';

Widget _buildTags(List<String> tags) {
    List<Widget> chips = [];
    for (var i = 0; i < tags.length; i++) {
      final chip = Flexible(
       
        child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Chip(
          label: Text(tags[i]),
          backgroundColor: Colors.blueGrey,
          ),
      ),
      );
      chips.add(chip);
    }
    return Row(children: chips);
}

Widget buildPostCard(Post post) {
  return Card(
    child: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(fontSize: 18),
          ),
          _buildTags(post.tags)
        ],
      ),
    ),
  );
}
