import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentQuestion = pageController.page!.toInt() + 1;
    });
  }

  void nextPage(bool isRigth) {
    if(!controller.nextPageRunning){
      controller.nextPageRunning = true;

      if(isRigth){
        controller.qtdCurrectAnswers++;
      }

      if(controller.currentQuestion < widget.questions.length){
          pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.linear);
      }

      controller.nextPageRunning = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                    valueListenable: controller.currentQuentionNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                          currentQuestion: value,
                          lenght: widget.questions.length,
                        )),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: (isRigth) {
                    Future.delayed(Duration(milliseconds: 1500))
                        .then((value) => nextPage(isRigth));
                  },
                ))
            .toList(),
      ),

      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentQuentionNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (value < widget.questions.length) ?
                Expanded(
                  child: NextButtonWidget.white(
                    label: 'Pular',
                    onTap: (){
                      nextPage(false);
                    },
                  ),
                ) :
                Expanded(
                  child: NextButtonWidget.green(
                    label: 'Finalizar',
                    onTap: () {
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            title: widget.title,
                            length: widget.questions.length,
                            result: controller.qtdCurrectAnswers,
                          )
                        )
                      );
                    },
                  ),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
