import 'package:flutter/material.dart';

class Insta_Layout extends StatelessWidget {
  const Insta_Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Stories (horizontal scroll)
        SliverAppBar(
          title: Text("Instagram"),
          pinned: true,
          backgroundColor: Colors.deepPurple,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder:
                  (context, index) => Container(
                    width: 80,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple[200],
                    ),
                    child: Center(child: Text("Story $index")),
                  ),
            ),
          ),
        ),

        // Posts (vertical scroll)
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Colors.deepPurple[100],
              child: Center(child: Text("Post $index")),
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
