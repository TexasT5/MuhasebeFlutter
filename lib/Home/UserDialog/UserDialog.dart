import 'package:flutter/material.dart';
import 'package:muhasebeflutter/Libs/DefaultWidgets.dart';
import 'package:muhasebeflutter/Model/User.dart';
import 'package:muhasebeflutter/SQLite/Database.dart';
import 'package:muhasebeflutter/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


final _formKey = GlobalKey<FormState>();
var _nameController = TextEditingController();
var _priceController = TextEditingController();
var _currencyController = TextEditingController();


ShowDilaog(context){
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: new Text("Bilgilerinizi Güncelleyin"),
            content: Form(
              key : _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  userForms(_nameController , _priceController , _currencyController)
                ],
              ),
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text("İptal"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Kaydet"),
                onPressed: () {
                  Databases().insert(User( id: 1 , name: _nameController.text , price:_priceController.text , currency: _currencyController.text ));
                  Databases().update(User( id: 1 , name: _nameController.text , price:_priceController.text , currency: _currencyController.text ));

                  print(_nameController.text);
                },
              )
            ],
          );
        },
      );
    },
  );
}