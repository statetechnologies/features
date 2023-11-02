import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HStepper extends StatefulWidget {
  const HStepper({super.key});

  @override
  State<HStepper> createState() => _HStepperState();
}

class _HStepperState extends State<HStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final isLastStep = _currentStep == getSteps().length - 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('H Stepper'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: _currentStep,
        onStepTapped: (step){
          setState(() {
            _currentStep=step;
          });
        },
        onStepContinue: () {
          if (!isLastStep) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children:  [
              if(_currentStep==0)...[
                TextButton(
                  onPressed: details.onStepContinue,
                  child: Text('Next'),
                ),
              ] else...[
                if(isLastStep)...[
                  TextButton(
                    onPressed: details.onStepContinue,
                    child: Text('Complete'),
                  ),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: Text('Back to Step ${details.stepIndex}'),
                  ),
                ]else...[
                  TextButton(
                    onPressed: details.onStepContinue,
                    child: Text('Continue to Step ${details.stepIndex+1}'),
                  ),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: Text('Back to Step ${details.stepIndex}'),
                  ),
                ]


              ]

            ],
          );
        },
      ),
    );
  }

  List<Step> getSteps() => <Step>[
        Step(
            state:_currentStep >= 1?StepState.complete:StepState.indexed ,
            isActive: _currentStep >= 0,
            title: Text('Account'),
            content: Column(
              children: [],
            )),
        Step(
            state:_currentStep >= 2?StepState.complete:StepState.indexed ,
            isActive: _currentStep >= 1,
            title: Text('Address'),
            content: Column(
              children: [],
            )),
        Step(
          state:_currentStep >= 3?StepState.complete:StepState.indexed ,
            isActive: _currentStep >= 2,
            title: Text('BP'),
            content: Column(
              children: [],
            )),
        Step(

            isActive: _currentStep >= 3,
            title: Text('Complete'),
            content: Column(
              children: [],
            )),
      ];
}
