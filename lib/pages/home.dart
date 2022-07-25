import 'package:flutter/material.dart';
import 'package:tech_newzz/backend/functions.dart';
import 'package:tech_newzz/components/newsbox.dart';
import 'package:tech_newzz/components/searchbar.dart';
import 'package:tech_newzz/utils/colors.dart';
import 'package:tech_newzz/utils/constants.dart';
import 'package:tech_newzz/utils/test.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: AppColors.black,
          elevation: 0,
          title: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Boldtext(text: 'News ', size: 20, color: AppColors.primary),
                Modifiedtext(
                    text: 'Buddy', size: 20, color: AppColors.lightwhite),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SearchBar(),
            Expanded(
              child: Container(
                width: w,
                child: FutureBuilder<List>(
                    future: fetchnews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl:
                                    snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : Constants.imageurl,
                                time: snapshot.data![index]['publishedAt'],
                                title: snapshot.data![index]['title'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
