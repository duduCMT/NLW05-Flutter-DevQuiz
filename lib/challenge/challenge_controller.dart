import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentQuentionNotifier = ValueNotifier<int>(1);
  int get currentQuestion => currentQuentionNotifier.value;
  set currentQuestion(int value) => currentQuentionNotifier.value = value;
}