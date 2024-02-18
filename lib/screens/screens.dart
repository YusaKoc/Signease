import 'package:go_router/go_router.dart';
import 'package:signease/StartScreen/StartScreen.dart';
import 'package:signease/StartScreen/dailyTalk.dart';
import 'package:signease/videos/videoPage1.dart';
import 'package:signease/videos/videoPage2.dart';
import 'package:signease/videos/videoPage3.dart';
final GoRouter router = GoRouter(initialLocation: "/StartScreen",routes: [
  GoRoute(path: '/StartScreen',builder: (context, index) => const StartScreen()),
  GoRoute(path: "/dailyTalk",builder: (context, index) =>  DailyTalk()),
  GoRoute(path: "/videoHello",builder: (context, index) => const VideoHello()),
  GoRoute(path: "/videoHrY",builder: (context, index) => const HowAreYou()),
  GoRoute(path: "/videoHearMe",builder: (context, index) => const HearMe()),






] );