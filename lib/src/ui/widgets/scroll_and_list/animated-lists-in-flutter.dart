import 'package:flutter/material.dart';
import 'package:test_app_v2/src/utilities/images.dart';

class AnimatedListInFlutter extends StatefulWidget {
  @override
  _AnimatedListInFlutterState createState() => _AnimatedListInFlutterState();
}

class _AnimatedListInFlutterState extends State<AnimatedListInFlutter> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  List<String> imageUrls = [];

  void populateList() async {
    await for (final url in images()) {
      imageUrls.insert(0, url);
      _key.currentState?.insertItem(
        0,
        duration: Duration(milliseconds: 400),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    populateList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Lists in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedList(
          key: _key,
          initialItemCount: imageUrls.length,
          itemBuilder: (context, index, animation) {
            final imageUrl = imageUrls[index];
            return SizeTransition(
              sizeFactor: animation.drive(
                CurveTween(curve: Curves.elasticInOut),
              ),
              child: Column(
                children: [
                  NetworkImageCard(url: imageUrl),
                  SizedBox(height: 10.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Stream<String> images() {
  return Stream.periodic(
    Duration(seconds: 3),
    (index) {
      return index % imageUrls.length;
    },
  ).map((index) => imageUrls[index]);
}

class NetworkImageCard extends StatelessWidget {
  final String? url;
  const NetworkImageCard({
    Key? key,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: NetworkImage(
          url: url ?? 'https://placeimg.com/640/480/any',
        ),
      ),
    );
  }
}

class NetworkImage extends StatelessWidget {
  final String url;
  const NetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return LinearProgressIndicator(
            value: bytesLoaded / totalBytes,
          );
        } else {
          return child;
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Text('Error!');
      },
    );
  }
}
