import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhasebeflutter/Colors.dart';
import 'package:muhasebeflutter/Home/ProcessPage/ProcessPageForm.dart';
import 'package:muhasebeflutter/Libs/DefaultWidgets.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({Key? key}) : super(key: key);

  @override
  _ProcessPageState createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage>  with SingleTickerProviderStateMixin{
  var accountNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _floatClickable = false;
  double degress = 0;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    ColorScheme themeColors = Theme.of(context).colorScheme;
    TextEditingController productNameController = TextEditingController();


    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text("İşlem"),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () { setState(() {
              _floatClickable ? _floatClickable = false:_floatClickable = true;
              _floatClickable ? setState(() => { degress = 150 }) : setState(() => { degress = 0 });
            }); },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Transform.rotate(angle: degress , child: Icon(Icons.add),)
              )
            ),
          body: Column(
            children: [
              Spacer(),
              Column(
                children: [
                  _floatClickable ? Container(
                    width: _screenWidth,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40) , topRight: Radius.circular(40)),
                      color: themeColors.primary,
                    ),
                    child: Column(
                      children: [
                        Text("Merhaba 1"),
                        Text("Buradan ürün ekleyebilirsiniz"),
                      ],
                    ),
                  ) : Container()
                ],
              )
            ],
          ),
      )
    );
  }
}