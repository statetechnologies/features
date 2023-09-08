import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late List<TextEditingController> _controllers;
 late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (index) => TextEditingController());
    _focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Screen'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
                  (index) => Container(
                width: 50.0,
                height: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, letterSpacing: 10.0),
                  onChanged: (value) => _onTextChanged(index, value),
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: OTPScreen()));
