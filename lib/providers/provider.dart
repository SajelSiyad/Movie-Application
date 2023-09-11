import 'package:flutter_riverpod/flutter_riverpod.dart';

final visibleProvider = StateProvider<bool>((ref) {
  return true;
});

final carouselProvider = Provider<List<String>>((ref) {
  return [
    "https://i.pinimg.com/736x/0d/85/d5/0d85d5a61d012f3fc8afb79e20d8641d.jpg",
    "https://th.bing.com/th/id/OIP.jGSbFCcG4g6bzhTPPnjEqwHaLH?pid=ImgDet&w=720&h=1080&rs=1",
    "https://i.pinimg.com/originals/52/9d/19/529d19db94ef651d29e1bcbb3b97ab96.png",
    "https://i.pinimg.com/originals/fb/3d/c0/fb3dc031cb47e86b69a70ebbc7bc8d56.jpg",
    "https://i.pinimg.com/originals/21/52/43/215243d3ae52cbbfa1205a179c824e09.jpg",
    "https://pbs.twimg.com/media/DafC7jqU0AAkvi2.jpg",
    "https://th.bing.com/th/id/OIP.rUrbaMuq4TTxtQXh-V6KSQHaHa?pid=ImgDet&rs=1",
    "https://pbs.twimg.com/media/C9nFQsIVoAEit4O.jpg",
    "https://th.bing.com/th/id/OIP.H5GmVqY4FyDhKWASwdFksQHaK0?pid=ImgDet&rs=1",
    "https://m.media-amazon.com/images/M/MV5BN2M0NzZkZTQtMDVkMy00MjZhLWE2YmYtYTQ1NmIyMjI5YzI0XkEyXkFqcGdeQXVyMjMwODI3NDE@._V1_FMjpg_UX1000_.jpg",
  ];
});

final imageProvider = Provider<List<String>>((ref) {
  return [
    //"https://www.onlykollywood.com/wp-content/uploads/2023/08/jailer-movie-review.jpg",
    "https://i.ytimg.com/vi/Ds4xEmBNgC8/maxresdefault.jpg",
    // "https://i.ytimg.com/vi/p0VODo0PC8Y/maxresdefault.jpg",
    "https://img.etimg.com/thumb/width-1200,height-900,imgsize-140622,resizemode-75,msid-97203585/news/international/us/whats-new-to-watch-know-best-movies-set-to-release-on-theatres-in-february-2023.jpg",
    "https://en.janbharattimes.com/wp-content/uploads/2023/01/pathaan-movie.jpg",
    "https://cinebuds.com/wp-content/uploads/2023/03/Upcoming-Punjabi-Movies-on-OTT-Punjabi-OTT-Release-Dates.jpg",
    "https://movies.universalpictures.com/media/05-opp-dm-mainstage-mobile-banner-1080x793-now-pl-f01-071223-64bab94d5d684-1.jpg",
    "https://i0.wp.com/img.paisawapas.com/ovz3vew9pw/2022/09/11133239/Rectangle-1Disenchanted-Movie-.png?resize=547%2C286&ssl=1",
    "https://qqcdnpictest.mxplay.com/pic/9537dd447e7f30b8be53383e0201c74e/en/16x9/492x277.5/test_pic1685358015982.webp",
  ];
});
final btmProvider = StateProvider<int>((ref) {
  return 0;
});
final toggleProvider = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});

final indicatorProvider = StateProvider<int>((ref) {
  return 0;
});
