import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel anwser;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AwnserWidget({
    Key? key,
    required this.anwser,
    required this.onTap,
    this.isSelected = false,
    this.disabled = false,
  }) : super(key: key);

  get title => anwser.title;
  get isRight => anwser.isRight;

  Color get _selectedColorIconRight => isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderIconRight => isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight => isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight => isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: (){
          onTap(isRight);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelected ? _selectedBorderCardRight : AppColors.border
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title, style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                  )
                ),
                Container(
                  width: 24, 
                  height: 24,
                  child: isSelected ? Icon(
                    _selectedIconRight, 
                    size: 16, 
                    color: AppColors.white,
                  ) : null,
                  decoration: BoxDecoration(
                    color: isSelected ? _selectedColorIconRight : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: isSelected ? _selectedBorderIconRight : AppColors.border
                      )
                    )
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
