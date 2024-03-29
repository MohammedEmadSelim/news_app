import 'package:flutter/material.dart';

import '../models/news_model.dart';

class ArticleScreen extends StatelessWidget {
  final Article articleItem;
  const ArticleScreen({
    super.key,
    required this.articleItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Image.network(
              articleItem.urlToImage ??
                  'https://image.cnbcfm.com/api/v1/image/105490644-1538754174999cnbctv_tvlistinggraphic_bluesite_v001.png?v=1538754309&w=884&h=442&vtcrop=y',
              errorBuilder: (_, __, ___) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    image: DecorationImage(
                      image: NetworkImage(articleItem.url 
                          ),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(articleItem.title),
              subtitle: Text(articleItem.publishedAt.toString() ?? 'giyugiujh'),
            ),
            Text('Your Description Here' * 100),
          ],
        ),
      ),
    );
  }
}
