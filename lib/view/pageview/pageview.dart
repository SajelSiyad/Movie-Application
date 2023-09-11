import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/providers/provider.dart';
import 'package:movieapp/utils/responsive.dart';
import 'package:movieapp/view/mainpages/downloads.dart';
import 'package:movieapp/view/mainpages/home_page.dart';
import 'package:movieapp/view/mainpages/search_page.dart';

class PgView extends ConsumerWidget {
  PgView({super.key});

  final _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.black,
      //   title: Padding(
      //     padding: EdgeInsets.only(
      //       left: R.width(20, context),
      //       right: R.width(20, context),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Text(
      //           "FilmFusion",
      //           style: TextStyle(
      //               color: const Color(0xffffce67),
      //               fontFamily: "Film",
      //               fontSize: R.width(25, context),
      //               fontWeight: FontWeight.w500),
      //         ),
      //         Container(
      //           width: R.width(100, context),
      //           height: R.width(30, context),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(
      //               R.width(5, context),
      //             ),
      //             border: Border.all(
      //               width: R.width(0.5, context),
      //               color: const Color(0xffffce67),
      //             ),
      //           ),
      //           child: Center(
      //             child: Text(
      //               "SUBSCRIBE",
      //               style: TextStyle(
      //                 color: const Color(0xffffce67),
      //                 fontSize: R.width(14, context),
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      endDrawer: Drawer(
        backgroundColor: ref.watch(switchProvider)
            ? Colors.white
            : const Color.fromARGB(255, 102, 87, 87),
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: R.width(200, context),
              color: const Color(0xffffce67),
              child: SafeArea(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: R.width(35, context),
                      backgroundImage: const NetworkImage(
                          "https://wallpapers.com/images/hd/cool-profile-picture-1ecoo30f26bkr14o.jpg"),
                    ),
                    SizedBox(
                      height: R.width(5, context),
                    ),
                    Text(
                      "SAJEL SIYAD",
                      style: TextStyle(
                          fontSize: R.width(16, context),
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "sajelsiyad3309@gmail.com",
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: ref.watch(switchProvider) ? Colors.black : Colors.white,
                size: R.width(30, context),
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: R.width(17, context),
                  color:
                      ref.watch(switchProvider) ? Colors.black : Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.download_for_offline_outlined,
                color: ref.watch(switchProvider) ? Colors.black : Colors.white,
                size: R.width(30, context),
              ),
              title: Text(
                "Downloads",
                style: TextStyle(
                  fontSize: R.width(17, context),
                  color:
                      ref.watch(switchProvider) ? Colors.black : Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_border,
                color: ref.watch(switchProvider) ? Colors.black : Colors.white,
                size: R.width(30, context),
              ),
              title: Text(
                "Favourites",
                style: TextStyle(
                  fontSize: R.width(17, context),
                  color:
                      ref.watch(switchProvider) ? Colors.black : Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.policy,
                color: ref.watch(switchProvider) ? Colors.black : Colors.white,
                size: R.width(30, context),
              ),
              title: Text(
                "Terms & Policy",
                style: TextStyle(
                  fontSize: R.width(17, context),
                  color:
                      ref.watch(switchProvider) ? Colors.black : Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.chat,
                color: ref.watch(switchProvider) ? Colors.black : Colors.white,
                size: R.width(30, context),
              ),
              title: Text(
                "Chat eith US",
                style: TextStyle(
                  fontSize: R.width(17, context),
                  color:
                      ref.watch(switchProvider) ? Colors.black : Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.contact_mail,
                color: ref.watch(switchProvider) ? Colors.black : Colors.white,
                size: R.width(30, context),
              ),
              title: Text(
                "Contact",
                style: TextStyle(
                  fontSize: R.width(17, context),
                  color:
                      ref.watch(switchProvider) ? Colors.black : Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.not_listed_location,
                color: ref.watch(switchProvider) ? Colors.black : Colors.white,
                size: R.width(30, context),
              ),
              title: Text(
                "About us",
                style: TextStyle(
                  fontSize: R.width(17, context),
                  color:
                      ref.watch(switchProvider) ? Colors.black : Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: ref.watch(switchProvider) ? Colors.black : Colors.white,
                size: R.width(30, context),
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: R.width(17, context),
                  color:
                      ref.watch(switchProvider) ? Colors.black : Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Switch(
                  value: ref.watch(switchProvider),
                  onChanged: (value) {
                    ref.read(switchProvider.notifier).state =
                        !ref.read(switchProvider.notifier).state;
                  },
                  inactiveTrackColor: Colors.white38,
                  inactiveThumbColor: const Color(0xffffce67),
                  activeColor: Colors.black,
                  activeTrackColor: Colors.black45,
                ),
                SizedBox(
                  width: R.width(12, context),
                ),
                Text("Light Mode",
                    style: TextStyle(
                      fontSize: R.width(17, context),
                      fontWeight: FontWeight.w500,
                      color: ref.watch(switchProvider)
                          ? Colors.black
                          : Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is OverscrollNotification) {
                if (_pageController.page == 3 - 1 &&
                    notification.overscroll > 0) {
                  // Overscrolling at the end (scrolling to the right)
                  Scaffold.of(context).openEndDrawer();
                }
              }
              return false; // Return false to allow the notification to continue propagating
            },
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                ref.read(btmProvider.notifier).state = value;
              },
              children: [
                HomePage(),
                SearchPage(),
                Downloads(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          return BottomNavigationBar(
            currentIndex: ref.watch(btmProvider),
            onTap: (index) {
              if (index == 3) {
                Scaffold.of(context).openEndDrawer();
              } else {
                ref.read(btmProvider.notifier).state = index;
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              }
            },
            selectedItemColor: const Color(0xffffce67),
            selectedIconTheme: const IconThemeData(
              size: 28,
              color: Color(0xffffce67),
            ),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 16, 33, 41),
            elevation: 30,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download_outlined), label: "Downloads"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Profile")
            ],
          );
        },
      ),
    );
  }
}
