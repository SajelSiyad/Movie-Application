import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/providers/api_providers.dart';
import 'package:movieapp/providers/provider.dart';
import 'package:movieapp/utils/responsive.dart';
import 'package:movieapp/view/mainpages/review_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final carouselController = CarouselController();
  // int toggleindex = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
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
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            expandedHeight: MediaQuery.sizeOf(context).height * 0.24,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                    ).createShader(bounds),
                    blendMode: BlendMode.srcATop,
                    child: ref.watch(getUpComingMoviesProvider).when(
                      data: (data) {
                        if (data == null) {
                          return const Center(
                            child: Text("Coudn't retrieve data"),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: R.width(5, context),
                            ),
                            CarouselSlider.builder(
                              itemCount: data.results.length,
                              itemBuilder: (context, index, realIndex) =>
                                  InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReviewPage(
                                        moviereview: data.results[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      R.width(5, context),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w780${data.results[index].backdropPath}",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              options: CarouselOptions(
                                height: R.width(200, context),
                                viewportFraction: 1,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 100),
                                autoPlayInterval: const Duration(seconds: 3),
                              ),
                            ),
                          ],
                        );
                      },
                      error: (error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.error),
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: R.width(20, context),
                    left: R.width(20, context),
                    child: Row(
                      children: [
                        InkWell(
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const ReviewPage()));
                          // },
                          child: Container(
                            width: R.width(90, context),
                            height: R.width(35, context),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(208, 255, 207, 103),
                              borderRadius: BorderRadius.circular(
                                R.width(15, context),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: R.width(10, context),
                                ),
                                const Icon(Icons.play_arrow),
                                const Text(
                                  "Watch",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: R.width(10, context),
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: const Color.fromARGB(145, 255, 255, 255),
                          size: R.width(30, context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: R.width(20, context),
                ),
                ref.watch(getTrendingMoviesProviderWeek).when(
                      data: (data) {
                        if (data == null) {
                          return const Center(
                            child: Text("Coudn't retrieve data"),
                          );
                        }
                        return Column(
                          children: [
                            CarouselSlider.builder(
                              carouselController: carouselController,
                              itemCount: data.results.length,
                              itemBuilder: (context, index, realIndex) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReviewPage(
                                          moviereview: data.results[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: R.width(200, context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        R.width(15, context),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w780${data.results[index].posterPath}",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    ref.read(indicatorProvider.notifier).state =
                                        index;
                                  },
                                  height: R.width(300, context),
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 2),
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.6),
                            ),
                            SizedBox(
                              height: R.width(10, context),
                            ),
                            Center(
                              child: AnimatedSmoothIndicator(
                                activeIndex: ref.watch(indicatorProvider),
                                // PageController
                                count: data.results.length,
                                effect: ScrollingDotsEffect(
                                  activeDotColor: Colors.white,
                                  dotColor: Colors.white54,
                                  fixedCenter: true,
                                  dotHeight: R.height(6, context),
                                  dotWidth: R.width(6, context),
                                ), // your preferred effect
                                onDotClicked: (index2) {
                                  ref.read(indicatorProvider.notifier).state =
                                      index2;
                                  carouselController.animateToPage(
                                    index2,
                                    curve: Curves.linear,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                },
                              ),
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
                SizedBox(
                  height: R.width(10, context),
                ),
                SizedBox(
                  height: R.width(20, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                          fontFamily: "Trajan",
                          color: Colors.white,
                          fontSize: R.width(21, context),
                          fontWeight: FontWeight.w500),
                    ),
                    ToggleSwitch(
                      minWidth: 70,
                      minHeight: 35,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Color(0xffffce67)],
                        [Color(0xffffce67)],
                      ],
                      borderColor: [Colors.white],
                      borderWidth: R.width(0.5, context),
                      initialLabelIndex: ref.watch(toggleProvider),
                      inactiveBgColor: Colors.black,
                      totalSwitches: 2,
                      labels: const ['Day', 'Week'],
                      customTextStyles: [
                        TextStyle(
                            color: ref.watch(toggleProvider) == 0
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500),
                        TextStyle(
                          color: ref.watch(toggleProvider) == 1
                              ? Colors.black
                              : Colors.white,
                        ),
                      ],
                      radiusStyle: true,
                      onToggle: (value) {
                        ref.read(toggleProvider.notifier).state = value!;
                        // toggleindex = ref.read(toggleProvider.notifier).state;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: R.width(10, context),
                ),
                ref
                    .watch(ref.watch(toggleProvider) == 0
                        ? getTrendingMoviesProviderWeek
                        : getTrendingMoviesProviderDay)
                    .when(
                      data: (data) {
                        return SizedBox(
                          height: R.width(160, context),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: R.width(150, context),
                                  height: R.width(160, context),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        R.width(10, context),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w780${data!.results[index].backdropPath}"),
                                          fit: BoxFit.cover)),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    width: R.width(10, context),
                                  ),
                              itemCount: 10),
                        );
                      },
                      error: (error, stackTrace) => Text("error"),
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                SizedBox(
                  height: R.width(20, context),
                ),
                Text(
                  "Latest Releases",
                  style: TextStyle(
                      fontFamily: "Trajan",
                      color: Colors.white,
                      fontSize: R.width(21, context),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: R.width(5, context),
                ),
                ref.watch(getNowPlayingMoviesProvider).when(
                  data: (data) {
                    if (data == null) {
                      return const Center(
                        child: Text("Coudn't retrieve data"),
                      );
                    }
                    return SizedBox(
                      height: R.width(160, context),
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReviewPage(
                                    moviereview: data.results[index],
                                  ),
                                ),
                              );
                            },
                            child: data.results[index].posterPath == null
                                ? SizedBox(
                                    width: R.width(150, context),
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(
                                    height: R.width(180, context),
                                    width: R.width(150, context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        R.width(10, context),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w780${data.results[index].backdropPath ?? data.results[index].posterPath}",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: R.width(10, context),
                          );
                        },
                        itemCount: data.results.length,
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                SizedBox(
                  height: R.width(20, context),
                ),
                ref.watch(getTopRatedMoviesProvider).when(
                  data: (data) {
                    if (data == null) {
                      return const Center(
                        child: Text("Coudn't retrieve data"),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top 10 in India Today - Malayalam",
                          style: TextStyle(
                              fontFamily: "Trajan",
                              color: Colors.white,
                              fontSize: R.width(22, context),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: R.width(10, context),
                        ),
                        SizedBox(
                          height: R.width(160, context),
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReviewPage(
                                          moviereview: data.results[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: R.width(160, context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        R.width(10, context),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500${data.results[index].backdropPath}",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: R.width(10, context),
                                );
                              },
                              itemCount: data.results.length),
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
