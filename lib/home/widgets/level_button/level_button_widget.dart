import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  LevelButtonWidget({
    Key? key, required this.label, required this.onTap
  }) : assert(["Todos", "Fácil", "Médio", "Difícil", "Perito"].contains(label)), super(key: key);

  final config = {
    "Todos": {
      "color": AppColors.levelButtonTodos,
      "borderColor": AppColors.levelButtonBorderTodos,
      "fontColor": AppColors.levelButtonTextTodos
    },
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    }
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(28),
          color: color,
          border: Border.fromBorderSide(BorderSide(color: borderColor))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 6),
          child: Center(
            child: Text(
              label, 
              style: GoogleFonts.notoSans(
                color: fontColor,
                fontSize: 13,
              ),
            ),
          ),
        ),   
      ),
    );
  }
}