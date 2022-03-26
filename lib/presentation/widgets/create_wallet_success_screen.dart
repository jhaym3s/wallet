import 'package:flutter/material.dart';
import 'package:hodl/configs/configs.dart';
import 'package:hodl/presentation/widgets/steps/step_1.dart';


class CreateWalletSuccessScreen extends StatelessWidget {
  const CreateWalletSuccessScreen({Key? key, required this.mnmonics})
      : super(key: key);
  final String mnmonics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: 
          SizedBox(
            width: kScreenWidth(context),
            child: Stepper(
              
              type: StepperType.horizontal,
              elevation: 0,
              steps: [
                Step(
                  title: const Text('Step 1 title'),
                  content: Step1(mnmonics: mnmonics)
                ),
                const Step(
                  title: Text('Step 2 title'),
                  content: Text('Content for Step 2'),
                ),
              ],
            ),
          ),
    ));
  }
}
