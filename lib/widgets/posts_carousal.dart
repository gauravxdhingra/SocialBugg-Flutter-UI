import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/post_model.dart';

class PostCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  const PostCarousel({this.pageController, this.title, this.posts});

  _buildPost(BuildContext context, int i) {
    Post post = posts[i];

    return Stack(
      children: <Widget>[
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage(post.imageUrl),
              height: 400,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          right: 10,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  post.location,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          post.likes.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.comment,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          post.comments.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            padding: EdgeInsets.all(12),
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        Container(
          height: 400,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (context, i) {
              return _buildPost(context, i);
            },
          ),
        ),
      ],
    );
  }
}
