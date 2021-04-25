import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState((){});
    });
  }


  @override
  Widget build(BuildContext context) {
    if(controller.state == HomeState.sucess){
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!,),   
        body: Column(
          children: [ 
            SizedBox(height: 24,),
            Container(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 14),
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                    onTap: () => controller.getQuizzesByLvl(Level.facil),
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                    onTap: () => controller.getQuizzesByLvl(Level.medio),
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                    onTap: () => controller.getQuizzesByLvl(Level.dificil),
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                    onTap: () => controller.getQuizzesByLvl(Level.perito),
                  ),
                  LevelButtonWidget(
                    label: 'Todos',
                    onTap: () => controller.getQuizzes(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children:
                  controller.quizzes!.map((quiz) => QuizCardWidget(
                    title: quiz.title,
                    completed: quiz.questionsAwsored,
                    quantityQuestions: quiz.questions.length,
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ChallengePage(
                            title: quiz.title, 
                            questions: 
                            quiz.questions,
                          )
                        )
                      );
                    },
                  )).toList(),
              ),
            )
          ],
        )
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        )
      );
    }
  }
} 