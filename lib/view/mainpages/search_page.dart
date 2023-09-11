import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/providers/api_providers.dart';
import 'package:movieapp/utils/responsive.dart';
import 'package:movieapp/view/mainpages/review_page.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var item = ref.watch(searchmovieProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: R.width(10, context),
                ),
                SizedBox(
                  height: R.width(48, context),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: R.width(8, context),
                      right: R.width(8, context),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        ref.read(movienameProvider.notifier).state = value;
                      },
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 26, 36, 40),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            R.width(10, context),
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white54,
                        ),
                        hintText: "Movies, Shows and More",
                        hintStyle: const TextStyle(color: Colors.white30),
                        suffixIcon: const Icon(Icons.keyboard_voice_outlined,
                            color: Colors.white54),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: R.width(20, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: R.width(10, context),
                    ),
                    const Icon(
                      Icons.airline_stops_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: R.width(5, context),
                    ),
                    Text(
                      "POPULAR SEARCHES",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: R.width(0.5, context),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: R.width(10, context),
                ),
                item.when(
                  data: (data) {
                    if (data == null) {
                      Text("No data found");
                    }
                    return SizedBox(child: movieList(data, ref, context));
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text("error"),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox movieList(MovieModel? data, WidgetRef ref, BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.75,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReviewPage(
                              moviereview: data.results[index],
                            )));
              },
              leading: data.results[index].posterPath == null
                  ? SizedBox(
                      width: R.width(100, context),
                      height: R.width(50, context),
                      child: Icon(Icons.image))
                  : Container(
                      width: R.width(100, context),
                      height: R.width(50, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          R.width(7, context),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${data.results[index].posterPath}",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
              title: Text(
                data.results[index].title!,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: R.width(18, context),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: R.width(10, context),
            );
          },
          itemCount: data!.results.length),
    );
  }
}
