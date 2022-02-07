import 'package:flutter/material.dart';
import 'package:muhasebeflutter/HomePage/ProcessPage/ProcessPageForm.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({Key? key}) : super(key: key);

  @override
  _ProcessPageState createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  bool? _validate = false;
  var nameController = TextEditingController();
  get _errorText{
    if(_validate != false){
      return "Error! you don't enter account name";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("İşlem Yap"),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 30 , right:30 , top: 5),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.teal)
                      ),
                      labelText: "AccountName",
                      errorStyle: TextStyle(),
                      errorText: _validate ? 'Username Can\'t Be Empty' : null,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    enabled: true,
                    onChanged: (value) {
                      setState(() {
                        if (value.length >= 1) {
                          _validate = true;
                        } else {
                          _validate = false;
                        }
                      });
                    },
                  ),
                  _validate! ? Container(child: const ProcessPageForm(),) : Container()
                ],
              ),
            )
        )
    );
  }
}
