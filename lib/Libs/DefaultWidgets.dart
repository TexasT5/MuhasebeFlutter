import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors.dart';




Text defaultText(String text, Color colors){
 return Text(text , style: GoogleFonts.lato(color : colors),);
}

Form userForms(
    TextEditingController userNameController,
    TextEditingController userPriceController,
    TextEditingController userCurrencyType,


    ){
 var _keys = GlobalKey<FormState>();

 return Form(
  key: _keys,
  child: Column(
   children: [
    TextFormField(
     maxLength: 20,
     controller: userNameController,
     decoration: InputDecoration(
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3 , color : Colors.red)
      ),
      border: OutlineInputBorder(
       borderSide: BorderSide(width: 3)
      ),
      labelText: "Kullanıcı Adı"
     ),
     validator: (value) {
      if(value!.length <= 0) return "Lütfen isim giriniz";
      return null;
     },
     onChanged: (value) =>{
      _keys.currentState!.validate()
     },
    ),

    // 2nd Form
    TextFormField(
     maxLength: 20,
     controller: userPriceController,
     decoration: InputDecoration(
         errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
         focusedErrorBorder: OutlineInputBorder(
             borderSide: BorderSide(width: 3 , color : Colors.red)
         ),
         border: OutlineInputBorder(
             borderSide: BorderSide(width: 3)
         ),
         labelText: "Bakiye"
     ),
     validator: (value) {
      if(value!.length <= 0) return "Lütfen Bakiye giriniz";
      return null;
     },
     onChanged: (value) =>{
      _keys.currentState!.validate()
     },
    ),
    // 3rd Form
    TextFormField(
     maxLength: 20,
     controller: userCurrencyType,
     decoration: InputDecoration(
         errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
         focusedErrorBorder: OutlineInputBorder(
             borderSide: BorderSide(width: 3 , color : Colors.red)
         ),
         border: OutlineInputBorder(
             borderSide: BorderSide(width: 3)
         ),
         labelText: "Para Birimi"
     ),
     validator: (value) {
      if(value!.length <= 0) return "Lütfen Para Birimi giriniz";
      return null;
     },
     onChanged: (value) =>{
      _keys.currentState!.validate()
     },
    ),
   ],
  ),
 );
}



Container defaultCard(String textValue){
 return Container(
  height: 75,
  width: double.infinity,
  child:Card(
   child: Text(textValue),
  )
 );
}


