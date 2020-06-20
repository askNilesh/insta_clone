import 'package:flutter/material.dart';
import 'package:instaclone/widgets/tag_textview.dart';

class FeedItem extends StatefulWidget {
  @override
  _FeedItemState createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> with TickerProviderStateMixin {
  Animation controllerAnimation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    final CurvedAnimation curveBounceOut =
        CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controllerAnimation = Tween(begin: 0.0, end: 1.0).animate(curveBounceOut);

    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
      }
    });
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                child: Image.asset(
                  'assets/images/nilesh.jpg',
                  height: 40,
                  width: 40,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text(
                      'asknilesh_',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            ],
          ),
          SizedBox(height: 5),
          Stack(
            children: <Widget>[
              GestureDetector(
                onDoubleTap: () {
                  if (controller.isCompleted) {
                    controller.reset();
                  }
                  controller.forward();
                },
                child: Image.asset(
                  'assets/images/nilesh.jpg',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 10), //it is ignored
                  child: Icon(
                    Icons.favorite,
                    size: 80,
                    color: Colors.white,
                  ),
                  transitionBuilder: defaultTransitionBuilder,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.comment,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
              Expanded(child: Text('')),
              IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            ],
          ),
          SizedBox(height: 0),
          Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: <Widget>[
                  Text(
                    '2,472 likes,',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' 2000 comments, ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '4000 views, ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: RichText(
              softWrap: true,
              text: TextSpan(
                text: '',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: 'asknilesh_' + ' ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  _buildTextSpan(
                    text: 'Hi, this is an #example for #hashtag example #AskNilesh #Nilesh',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .merge(TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
                    tagStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .merge(TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.normal))
                        .copyWith(
                          color: Colors.blueAccent,
                        )
                        .merge(TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.normal)),
                    onOpen: (tag) {},
                    onTagClick: (tag) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget defaultTransitionBuilder(Widget child, Animation<double> animation) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, widget) {
        return Opacity(
          opacity: controllerAnimation.value,
          child: ScaleTransition(
            scale: controllerAnimation,
            child: widget,
          ),
        );
      },
      child: child,
    );
  }

  final _linkRegex = RegExp(
      r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)",
      caseSensitive: false);
  final _tagRegex = RegExp(r"\B#\w*[a-zA-Z]+\w*", caseSensitive: false);

  List<TagText> _smartify(String text) {
    final sentences = text.split('\n');
    List<TagText> span = [];
    sentences.forEach((sentence) {
      final words = sentence.split(' ');
      words.forEach((word) {
        if (_linkRegex.hasMatch(word)) {
          span.add(LinkElement(word));
        } else if (_tagRegex.hasMatch(word)) {
          span.add(HashTagElement(word));
        } else {
          span.add(TextElement(word));
        }
        span.add(TextElement(' '));
      });
      if (words.isNotEmpty) {
        span.removeLast();
      }
      span.add(TextElement('\n'));
    });
    if (sentences.isNotEmpty) {
      span.removeLast();
    }
    return span;
  }

  TextSpan _buildTextSpan(
      {String text,
      TextStyle style,
      TextStyle linkStyle,
      TextStyle tagStyle,
      StringCallback onOpen,
      StringCallback onTagClick}) {
    void _onOpen(String url) {
      if (onOpen != null) {
        onOpen(url);
      }
    }

    void _onTagClick(String url) {
      if (onTagClick != null) {
        onTagClick(url);
      }
    }

    final elements = _smartify(text);

    return TextSpan(
        children: elements.map<TextSpan>((element) {
      if (element is TextElement) {
        return TextSpan(
          text: element.text,
          style: style,
        );
      } else if (element is LinkElement) {
        return LinkTextSpan(
          text: element.url,
          style: linkStyle,
          onPressed: () => _onOpen(element.url),
        );
      } else if (element is HashTagElement) {
        return LinkTextSpan(
          text: element.tag,
          style: tagStyle,
          onPressed: () => _onTagClick(element.tag),
        );
      }
    }).toList());
  }
}
