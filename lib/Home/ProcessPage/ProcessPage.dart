import 'package:flutter/material.dart';
import 'package:muhasebeflutter/HomePage/ProcessPage/ProcessPageForm.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({Key? key}) : super(key: key);

  @override
  _ProcessPageState createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  bool? _errorTextStatus = false;
  var accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffBB6464),
            appBar: AppBar(
              backgroundColor: Color(0xffCDB699),
              title: Text("Proccess"),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 30 , right:30 , top: 5),
              child: Column(
                children: [
                  TextField(
                    maxLength: 10,
                    controller: accountNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xffCDB699))
                      )
                    ),
                    onChanged: (value) =>{
                      setState(() {
                        if(value.length >= 1){
                          _errorTextStatus = true;
                        }else{
                          _errorTextStatus = false;
                        }
                      })
                    },
                  ),
                  _errorTextStatus! ? Container(child: const ProcessPageForm(),) : Container()
                ],
              ),
            )
        )
    );
  }
}
