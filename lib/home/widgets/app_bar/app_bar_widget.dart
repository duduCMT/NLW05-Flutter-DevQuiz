import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: 'Olá, ', style: AppTextStyles.title),
                    TextSpan(text: 'Eduardo', style: AppTextStyles.titleBold),
                    TextSpan(text: '!', style: AppTextStyles.title)
                  ]),
                ),
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage('https://avatars.githubusercontent.com/u/38767339?v=4')
                    )
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.2),
            child: ScoreCardWidget()
          )
        ],
      ),
    ),
  );
  
}