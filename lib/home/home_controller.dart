import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
      name: 'Eduardo L. Costa', 
      photoUrl: 'https://avatars.githubusercontent.com/u/38767339?v=4',
    );

    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
        title: 'Título do Quiz :3',
        imagem: AppImages.blocks, 
        level: Level.facil, 
        questionsAwsored: 1,
        questions: [
          QuestionModel(
            title: 'E um pais da Europa, seu idioma é o Holandês:', 
            awnsers: [
              AwnserModel(titile: 'Itália'),
              AwnserModel(titile: 'França'),
              AwnserModel(titile: 'Roma'),
              AwnserModel(titile: 'Erou!', isRight: true),
            ]
          ),
          QuestionModel(
            title: 'E um pais da Europa, seu idioma é o Holandês:', 
            awnsers: [
              AwnserModel(titile: 'Itália'),
              AwnserModel(titile: 'França'),
              AwnserModel(titile: 'Roma'),
              AwnserModel(titile: 'Erou!', isRight: true),
            ]
          ),
        ], 
      ),
      QuizModel(
        title: 'Título do Quiz :3',
        imagem: AppImages.blocks, 
        level: Level.facil, 
        questions: [
          QuestionModel(
            title: 'E um pais da Europa, seu idioma é o Holandês:', 
            awnsers: [
              AwnserModel(titile: 'Itália'),
              AwnserModel(titile: 'França'),
              AwnserModel(titile: 'Roma'),
              AwnserModel(titile: 'Erou!', isRight: true),
            ]
          ),
        ], 
      )
    ];

    state = HomeState.sucess;
  }
}