import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({Key? key, required this.title, required this.length, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding:  EdgeInsets.symmetric(vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
            Image.asset(AppImages.trophy),
            SizedBox(height: 10,),
            Column(
              children: [
                Text(
                  'Parabéns', 
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16,),
                Text.rich(
                  TextSpan(
                    text: 'Você concluiu o',
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: '\n$title',
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: '\ncom $result de $length acertos.',
                        style: AppTextStyles.body,  
                      ),
                    ] 
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
             
            SizedBox(height: 40,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [ 
                      Expanded(
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar', 
                          onTap: (){},
                        )
                      )
                    ]
                  ),
                ),

                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [ 
                      Expanded(
                        child: NextButtonWidget.transparent(
                          label: 'Voltar ao início', 
                          onTap: () => Navigator.pop(context),
                        )
                      )
                    ]
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}