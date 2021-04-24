import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int lenght;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.lenght,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão $currentQuestion', style: AppTextStyles.body,),
              Text('de $lenght',  style: AppTextStyles.body,)
            ],
          ),
          SizedBox(height: 16,),
          ProgressIndicatorWidget(value: currentQuestion / lenght,),
        ],
      ), 
    );
  }
}
