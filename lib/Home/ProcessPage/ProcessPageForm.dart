import 'package:flutter/material.dart';

class ProcessPageForm extends StatefulWidget {
  const ProcessPageForm({Key? key}) : super(key: key);
  @override
  _ProcessPageFormState createState() => _ProcessPageFormState();
}

class _ProcessPageFormState extends State<ProcessPageForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              Text("Merhaba !")
            ],
          ),
        )
      ],
    );
  }
}
