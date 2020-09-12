import 'package:flutter/material.dart';


class AlertTextField{

  static Future<String> alertDialog( String title ,String iniText,BuildContext context) async {
    final key = new GlobalKey<FormFieldState>();
    TextEditingController _editingController = new TextEditingController(text: iniText==title ? null : iniText);
    String title2 = title;
    await showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) => new Directionality(
            textDirection: TextDirection.rtl,
            child: WillPopScope(
              onWillPop: (){
                title2 = iniText;
              Navigator.of(context).pop(false);
              },
              child: new AlertDialog(
                title: Text(title),
                content: TextFormField(
                  key: key,
                  onSaved: (value){
                    title2 = value;
                  },
                  validator: (value){
                    if(value.length == 0)
                      return 'نباید خالی باشد';
                  },
                  controller: _editingController,
                  maxLines: null,

                ),
                actions: [
                  new FlatButton(onPressed: (){
                      title2 = iniText;
                    Navigator.of(context).pop(false);

                  },
                      child: Text('لغو')),
                  new FlatButton(onPressed: (){
                    if(key.currentState.validate()){
                      key.currentState.save();
                      Navigator.of(context).pop();
                    }
                  },
                      child: Text('تایید')),
                ],
              ),
            )));
    return title2;

  }
}