import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/providers/api_providers.dart';
import 'package:movieapp/utils/responsive.dart';
import 'package:movieapp/view/mainpages/review_page.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Padding(
              padding: EdgeInsets.only(
                left: R.width(20, context),
                right: R.width(20, context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FilmFusion",
                    style: TextStyle(
                        color: const Color(0xffffce67),
                        fontFamily: "Film",
                        fontSize: R.width(25, context),
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: R.width(100, context),
                    height: R.width(30, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        R.width(5, context),
                      ),
                      border: Border.all(
                        width: R.width(0.5, context),
                        color: const Color(0xffffce67),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "SUBSCRIBE",
                        style: TextStyle(
                          color: const Color(0xffffce67),
                          fontSize: R.width(14, context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: R.width(25, context)),
                    isScrollable: true,
                    indicatorColor: Color.fromARGB(208, 255, 207, 103),
                    dividerColor: Colors.white12,
                    labelColor: Color.fromARGB(208, 255, 207, 103),
                    tabs: [
                      Tab(
                        text: "English",
                      ),
                      Tab(
                        text: "Malayalam",
                      ),
                      Tab(
                        text: "Tamil",
                      ),
                      Tab(
                        text: "Hindi",
                      )
                    ]),
                preferredSize: Size(double.infinity, R.width(50, context))),
          ),
          backgroundColor: Colors.black,
          body: TabBarView(
            children: [
              English(),
              Malayalam(),
              Tamil(),
              Hindi(),
            ],
          )),
    );
  }
}

//!------------------Malayalam--------------------//

class Malayalam extends ConsumerWidget {
  const Malayalam({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getMalayalamMovies).when(
          data: (data) {
            if (data == null) {
              return Text(
                "Not data found",
                style: TextStyle(color: Colors.white),
              );
            }
            return SizedBox(
              width: 300,
              height: MediaQuery.sizeOf(context).height,
              child: GridView.builder(
                itemCount: data.results.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return data.results[index].posterPath == null
                      ? SizedBox(
                          height: R.width(150, context),
                          width: R.width(150, context),
                          child: Icon(
                            Icons.movie,
                            color: Colors.white,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewPage(
                                          moviereview: data.results[index],
                                        )));
                          },
                          child: Container(
                            height: R.width(150, context),
                            width: R.width(150, context),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.circular(R.width(10, context)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w780${data.results[index].posterPath}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                },
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Icon(Icons.error),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}

//!------------------------------Tamil---------------------------------!//

class Tamil extends ConsumerWidget {
  const Tamil({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTamilMovies).when(
          data: (data) {
            if (data == null) {
              return Text(
                "Not data found",
                style: TextStyle(color: Colors.white),
              );
            }
            return SizedBox(
              width: 300,
              height: MediaQuery.sizeOf(context).height,
              child: GridView.builder(
                itemCount: data.results.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return data.results[index].posterPath == null
                      ? SizedBox(
                          height: R.width(150, context),
                          width: R.width(150, context),
                          child: Icon(
                            Icons.movie,
                            color: Colors.white,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewPage(
                                          moviereview: data.results[index],
                                        )));
                          },
                          child: Container(
                            height: R.width(150, context),
                            width: R.width(150, context),
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius:
                                  BorderRadius.circular(R.width(10, context)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w780${data.results[index].posterPath}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                },
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Icon(Icons.error),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}

//!------------------------------Hindi---------------------------------!//

class Hindi extends ConsumerWidget {
  const Hindi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getHindiMovies).when(
          data: (data) {
            if (data == null) {
              return Center(
                child: Text(
                  "Not data found",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return SizedBox(
              width: 300,
              height: MediaQuery.sizeOf(context).height,
              child: GridView.builder(
                itemCount: data.results.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return data.results[index].posterPath == null
                      ? SizedBox(
                          height: R.width(150, context),
                          width: R.width(150, context),
                          child: Icon(
                            Icons.movie,
                            color: Colors.white,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewPage(
                                          moviereview: data.results[index],
                                        )));
                          },
                          child: Container(
                            height: R.width(150, context),
                            width: R.width(150, context),
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius:
                                  BorderRadius.circular(R.width(10, context)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w780${data.results[index].posterPath}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                },
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Icon(Icons.error),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}

//!------------------------------English---------------------------------!//

class English extends ConsumerWidget {
  const English({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getEnglishMovies).when(
          data: (data) {
            if (data == null) {
              return Text(
                "Not data found",
                style: TextStyle(color: Colors.white),
              );
            }
            return SizedBox(
              width: 300,
              height: MediaQuery.sizeOf(context).height,
              child: GridView.builder(
                itemCount: data.results.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return data.results[index].posterPath == null
                      ? SizedBox(
                          height: R.width(150, context),
                          width: R.width(150, context),
                          child: Icon(
                            Icons.movie,
                            color: Colors.white,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewPage(
                                          moviereview: data.results[index],
                                        )));
                          },
                          child: Container(
                            height: R.width(150, context),
                            width: R.width(150, context),
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius:
                                  BorderRadius.circular(R.width(10, context)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w780${data.results[index].posterPath}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                },
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Icon(Icons.error),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
