import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/cubit/news_cubit_cubit.dart';
import 'package:news/models/news_model.dart';

import '../repository/new_repo.dart';
import 'article_screen.dart';

late Future<TopBussinessModel> topNewsData;

class HomaPage extends StatefulWidget {
  HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  @override
  void initState() {
    super.initState();
    //TOOO:1 create cubit
    //TODO:2 creat fun at cubiy class to fetch data
    //TODO:3 intialize cubit fun get data
    topNewsData = TopBussinesNewsRepo().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: BlocBuilder<NewsCubitCubit, NewsCubitState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                topNewsData = TopBussinesNewsRepo().fetchData();
              });
            },
          child: ,
            //TODO":4 change future with bloc builder
          );
        },
      ),
    );
  }
}

/**
 * 
 * 
 * child: FutureBuilder(
          future: topNewsData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = snapshot.data!.articles[index];

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ArticleScreen(articleItem: item),
                      ));
                    },
                    title: Text(item.title),
                    subtitle: Text(
                      item.description ?? 'Empty Discription',
                      maxLines: 1,
                    ),
                    leading: Container(
                      height: 70,
                      width: 70,
                      child: Image.network(item.urlToImage ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLGSkWlsk5VbqptAvfmz8xoYia-_SsTb4epA&usqp=CAU'),
                    ),
                    // trailing: Icon(Icons.abc_outlined),
                  );
                },
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
 */
