import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/providers/api_providers.dart';
import 'package:movieapp/utils/responsive.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key, required this.moviereview});

  final Result moviereview;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: R.width(10, context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: R.width(5, context),
                  ),
                  ref
                      .watch(
                        getDetailsProvider(moviereview.id!),
                      )
                      .when(
                        data: (data) {
                          if (data == null) {
                            return const Center(
                              child: Text("Coudn't retrieve data"),
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: R.width(280, context),
                                    child: Image(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w780${moviereview.backdropPath ?? moviereview.posterPath}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: R.width(20, context),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: R.width(-30, context),
                                    left: R.width(10, context),
                                    child: Container(
                                      width: R.width(140, context),
                                      height: R.height(170, context),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          R.width(10, context),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w500${moviereview.posterPath}"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: R.width(40, context),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      data.title!,
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              208, 255, 207, 103),
                                          fontSize: R.width(20, context),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    width: R.width(30, context),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  Text(
                                    "${data.voteAverage}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: R.width(5, context),
                              ),
                              SizedBox(
                                height: R.width(30, context),
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Text(
                                          data.genres![index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: R.width(13, context),
                                          ),
                                        ),
                                    separatorBuilder: (context, index) => Text(
                                          "/",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: R.width(13, context),
                                          ),
                                        ),
                                    itemCount: data.genres!.length),
                              ),
                              Center(
                                child: Container(
                                  width: R.width(200, context),
                                  height: R.width(40, context),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      R.width(10, context),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Watch Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: R.width(20, context),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: R.width(10, context),
                                ),
                                child: Text(
                                  moviereview.overview!,
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                              SizedBox(
                                height: R.width(20, context),
                              ),
                              Text(
                                "Movie Budget",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: R.width(17, context),
                                ),
                              ),
                              Text(
                                "${data.budget} Cr",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: R.width(10, context),
                              ),
                              Text(
                                data.homepage!,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          );
                        },
                        error: (error, stackTrace) => const Center(
                          child: Icon(Icons.error),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                ],
              ),
            ),
            SizedBox(
              height: R.width(20, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.add,
                      color: const Color.fromARGB(226, 255, 255, 255),
                      size: R.width(30, context),
                    ),
                    SizedBox(
                      height: R.width(3, context),
                    ),
                    Text(
                      "Watchlist",
                      style: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: const Color.fromARGB(226, 255, 255, 255),
                    ),
                    SizedBox(
                      height: R.width(10, context),
                    ),
                    Text(
                      "Share",
                      style: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.download,
                      color: const Color.fromARGB(226, 255, 255, 255),
                    ),
                    SizedBox(
                      height: R.width(8, context),
                    ),
                    Text(
                      "Download",
                      style: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: R.width(20, context),
            ),
            ref
                .watch(
                  getCastProvider(moviereview.id!),
                )
                .when(
                  data: (data) {
                    if (data == null) {
                      return const Center(
                        child: Text("Coudn't retrieve data"),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.only(
                        left: R.width(10, context),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cast",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: R.width(17, context),
                            ),
                          ),
                          SizedBox(
                            height: R.width(15, context),
                          ),
                          SizedBox(
                            height: 180,
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  if (data.cast[index].profilePath == null) {
                                    return Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              221, 36, 35, 35),
                                          radius: R.width(40, context),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: R.width(30, context),
                                          ),
                                        ),
                                        SizedBox(
                                          height: R.width(5, context),
                                        ),
                                        data.cast[index].character == null
                                            ? Text(
                                                "Un_Known",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            : Text(
                                                "${data.cast[index].character}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        R.width(10, context),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                        SizedBox(
                                          height: R.width(5, context),
                                        ),
                                        Text(
                                          "${data.cast[index].originalName}",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  208, 255, 207, 103),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    );
                                  }
                                  return Column(
                                    children: [
                                      CircleAvatar(
                                        radius: R.width(40, context),
                                        backgroundImage: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500${data.cast[index].profilePath}"),
                                      ),
                                      SizedBox(
                                        height: R.width(5, context),
                                      ),
                                      Text(
                                        "${data.cast[index].character}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: R.width(10, context),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: R.width(5, context),
                                      ),
                                      Text(
                                        "${data.cast[index].originalName}",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                208, 255, 207, 103),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      width: R.width(10, context),
                                    ),
                                itemCount: data.cast.length),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (error, stackTrace) => const Center(
                    child: Icon(Icons.error),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
