import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _currentStep = 0;

  List<Step> _steps = [
    Step(
      title: Text('Step 1'),
      content: Text('Enter your username.'),
      isActive: true,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('Enter your email.'),
      isActive: false,
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Enter your password.'),
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Column(
        children: [
          SizedBox(height: 16),
          StepProgressIndicator(
            totalSteps: _steps.length,
            currentStep: _currentStep,
            size: 10,
            selectedColor: Colors.blue,
            unselectedColor: Colors.grey,
          ),
          SizedBox(height: 16),
          Expanded(
            child: Stepper(
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep < _steps.length - 1) {
                  setState(() {
                    _currentStep++;
                  });
                }
              },
              onStepCancel: () {
                if (_currentStep > 0) {
                  setState(() {
                    _currentStep--;
                  });
                }
              },
              steps: _steps,
            ),
          ),
        ],
      ),
    );
  }
}

class StepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;

  const StepProgressIndicator({
    required this.totalSteps,
    required this.currentStep,
    this.size = 10,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size,
          color: unselectedColor,
          width: double.infinity,
        ),
        Container(
          height: size,
          color: selectedColor,
          width: (currentStep + 1) * (MediaQuery.of(context).size.width / totalSteps),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(totalSteps, (index) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index <= currentStep ? selectedColor : unselectedColor,
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

