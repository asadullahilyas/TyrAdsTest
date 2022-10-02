import 'package:asadullah_tyrads_test/widgets/stepper_single_item.dart';
import 'package:flutter/cupertino.dart';

import '../models/stepper_data_item.dart';

class VerticalStepper extends StatefulWidget {
  const VerticalStepper({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<StepperDataItem> list;

  @override
  State<VerticalStepper> createState() => _VerticalStepperState();
}

class _VerticalStepperState extends State<VerticalStepper> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        final StepperDataItem item = widget.list[index];

        return StepperSingleItemWidget(
          isActive: item.isActive,
          stepNumber: index + 1,
          isDone: item.isDone,
          showVerticalLine: index < widget.list.length - 1,
          title: item.title,
          subtitle: item.subtitle,
          description: item.description,
          positiveButtonTitle:
              index < widget.list.length - 1 ? 'Continue' : 'Finish',
          positiveButtonAction: () {
            setState(() {
              widget.list[index].isActive = false;
              widget.list[index].isDone = true;

              bool nextExists = index < widget.list.length;
              if (nextExists) {
                widget.list[index + 1].isActive = true;
              }
            });
          },
          isPositiveButtonEnabled: true,
          negativeButtonTitle: 'Back',
          negativeButtonAction: () {
            setState(() {
              widget.list[index].isActive = false;
              widget.list[index].isDone = false;

              bool previousExists = index >= 0;
              if (previousExists) {
                widget.list[index - 1].isActive = true;
                widget.list[index - 1].isDone = false;
              }
            });
          },
          isNegativeButtonEnabled: index != 0,
        );
      },
    );
  }
}
