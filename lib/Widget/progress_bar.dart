import 'package:flutter/material.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';
import 'package:saspri_mobile/helper/enum.dart';

class ProgressBar extends StatelessWidget {
  final List<String> steps;
  final int currentStep;
  final ProgressBarState state;

  const ProgressBar({
    super.key,
    required this.steps,
    required this.currentStep,
    this.state = ProgressBarState.normal,
  });

  Color get activeColor {
    switch (state) {
      case ProgressBarState.success:
        return ColorPallate.green;

      case ProgressBarState.danger:
        return ColorPallate.danger;

      case ProgressBarState.normal:
        return ColorPallate.buttonPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    const inactiveColor = Color(0xFFD9D9D9);

    const double circleSize = 32;
    const double lineHeight = 6;

    return SizedBox(
      height: state == ProgressBarState.danger ? 40 : 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(steps.length, (index) {
          final isActive = index <= currentStep;
          final isCurrent = index == currentStep;

          return Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    // LEFT LINE
                    if (index != 0)
                      Expanded(
                        child: Container(
                          height: lineHeight,
                          color:
                              index <= currentStep
                                  ? activeColor
                                  : inactiveColor,
                        ),
                      ),

                    // FIRST ITEM SPACER
                    if (index == 0)
                      const Spacer(),

                    // CIRCLE
                    Container(
                      width: circleSize,
                      height: circleSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isActive
                                ? activeColor
                                : inactiveColor,
                      ),
                    ),

                    // RIGHT LINE
                    if (index != steps.length - 1)
                      Expanded(
                        child: Container(
                          height: lineHeight,
                          color:
                              index < currentStep
                                  ? activeColor
                                  : inactiveColor,
                        ),
                      ),

                    // LAST ITEM SPACER
                    if (index == steps.length - 1)
                      const Spacer(),
                  ],
                ),

                // LABEL
                if (state != ProgressBarState.danger) ...[
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 36,
                    child: Text(
                      steps[index],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight:
                            isCurrent
                                ? FontWeight.w700
                                : FontWeight.w400,
                        color:
                            isActive
                                ? ColorPallate.black
                                : ColorPallate.grey,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          );
        }),
      ),
    );
  }
}