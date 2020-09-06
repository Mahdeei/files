import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:stubbbb/AgahiPage/AdvertisingsPage.dart';
import 'package:stubbbb/Models/AgahiModel.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/R.dart';

import 'Send_Req.dart';


class AddPostAgahi extends StatefulWidget {
  @override
  _AddPostAgahiState createState() => _AddPostAgahiState();
}

class _AddPostAgahiState extends State<AddPostAgahi> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: new Directionality(
            textDirection: TextDirection.rtl,
            child: new ListView(
              children: <Widget>[
                HeadersItems(),
              ],
            )
        )
    );
  }
}




class HeadersItems extends StatefulWidget {
  Advertising advertising;
  Profile profile;

  HeadersItems({this.advertising,this.profile});
  @override
  _HeadersItemsState createState() => _HeadersItemsState();
}

class _HeadersItemsState extends State<HeadersItems> {


  File imageFile;
  final _picker = ImagePicker();

  Future<Null> pickImageFromGallery() async {
    final PickedFile pickedFile =
    await _picker.getImage(source: ImageSource.gallery);
    setState(() => this.imageFile = File(pickedFile.path));
  }

  Future<Null> pickImageFromCamera() async {
    final PickedFile pickedFile =
    await _picker.getImage(source: ImageSource.camera);
    setState(() => this.imageFile = File(pickedFile.path));
  }
  @override
  Widget build(BuildContext context) {

    var phoneSize = MediaQuery.of(context).size;

    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new GestureDetector(
                onTap: () async => await pickImageFromCamera(),
                child: new Container(
                    height: phoneSize.height*0.25,
                    width: phoneSize.width * 0.45,
                    child:new Align(
                      alignment: Alignment.center,
                      child:  new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.add_a_photo,size: 70.0,),
                          new Text('اضافه کردن عکس',style: TextStyle(fontSize: 22.0),)
                        ],
                      ),
                    )
                ),
            ),
            new Container(
              height: phoneSize.height*0.25,
              width:phoneSize.width*0.55,
              color: R.color.banafshtire,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new IconButton(icon: Icon(Icons.arrow_forward,color: Colors.white,), onPressed: (){
                    // Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (ctx)=> new AdvertisingsPage()));
                  }),
                  new Align(alignment: Alignment.topRight,
                    child: new Padding(padding: const EdgeInsets.only(right: 5.0),
                      child: new Text('طراحی سایت',overflow: TextOverflow.ellipsis,maxLines: 1,
                        style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white),),),),
                  new Align(alignment: Alignment.topRight,
                      child: new Padding(padding: const EdgeInsets.only(right: 8.0),
                        child: new Text('تکنولوژی و فناوری اطلاعات',overflow: TextOverflow.ellipsis,maxLines: 1,
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Color(0xff44143E),),),)),
                  new SizedBox(height: phoneSize.height*0.04,),
                  new Align(alignment: Alignment.bottomCenter,
                    child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new GestureDetector(
                          child: new Container(decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            width: phoneSize.width*0.34,
                            child: new Text('شروع کار',
                              style:TextStyle(
                                  color: Color(0xff2D0827),fontWeight: FontWeight.bold,fontSize: 14.0),
                              textAlign: TextAlign.center,),
                          ),
                          onTap: (){
                            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new SendReq(advertising: widget.advertising,profile: widget.profile,)));
                          },
                        ),
                      ],
                    ),),
//                  Image.file(this._imageFile),
                ],),)
          ],
        )
      ],
    );
  }
}







