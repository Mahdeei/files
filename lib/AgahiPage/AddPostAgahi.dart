import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:stubbbb/AgahiPage/TextAddPost.dart';
import 'package:stubbbb/Models/AgahiModel.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/http/AddAd.dart';

class AddPostAgahi extends StatefulWidget {
  Profile profile;
  AddPostAgahi({this.profile});
  @override
  _AddPostAgahiState createState() => _AddPostAgahiState();
}

class _AddPostAgahiState extends State<AddPostAgahi> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: new Directionality(
            textDirection: TextDirection.rtl,
            child:FieldsList(profile: widget.profile,)));
  }
}

class FieldsList extends StatefulWidget {
  FieldsList({this.profile});
  Profile profile;
  @override
  _FieldsListState createState() => _FieldsListState();
}

class _FieldsListState extends State<FieldsList> {

  final key = GlobalKey<ScaffoldState>();
  Map res;
  String tozihat = 'توضیحات',
      shrayet = 'شرایط',
      mohlat = 'مهلت',
      boodje = 'بودجه',
      adress = 'آدرس',
      onvan = 'عنوان آگهی';
  bool clr = false;
  bool clr1 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

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

  Color _color() {
    return clr ? Colors.red : Colors.black;
  }

  Text _text(double size, String data) {
    return new Text(
      data,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: false,
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Column(
              children: [
                new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () async => await pickImageFromCamera(),
                          child: new Container(
                              height: phoneSize.height * 0.25,
                              width: phoneSize.width * 0.45,
                              child: new Align(
                                alignment: Alignment.center,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.add_a_photo,
                                      size: 70.0,
                                    ),
                                    new Text(
                                      'اضافه کردن عکس',
                                      style: TextStyle(fontSize: 22.0),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        new Container(
                          height: phoneSize.height * 0.25,
                          width: phoneSize.width * 0.55,
                          color: R.color.banafshtire,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (ctx)=> new AdvertisingsPage()));
                                  }),
                              new SizedBox(
                                height: phoneSize.height * 0.03,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  onvan = await AlertTextField.alertDialog(
                                      'عنوان آگهی', onvan, context);
                                },
                                child: new Align(
                                  alignment: Alignment.topRight,
                                  child: new Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: new Text(
                                      onvan,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () async {
                              //     dste = await AlertTextField.alertDialog(
                              //         'انتحاب دسته بندی', dste, context);
                              //   },
                              //   child: new Align(
                              //       alignment: Alignment.topRight,
                              //       child: new Padding(
                              //         padding: const EdgeInsets.only(right: 8.0),
                              //         child: GestureDetector(
                              //           child: new Text(
                              //             dste,
                              //             overflow: TextOverflow.ellipsis,
                              //             maxLines: 1,
                              //             style: TextStyle(
                              //               fontSize: 16.0,
                              //               fontWeight: FontWeight.bold,
                              //               color: R.color.blueTire,
                              //             ),
                              //           ),
                              //         ),
                              //       )),
                              // ),

                              // new Align(
                              //   alignment: Alignment.bottomCenter,
                              //   child: new Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //     children: <Widget>[
                              //       // new GestureDetector(
                              //       //   child: new Container(
                              //       //     decoration: BoxDecoration(
                              //       //         color: Colors.white,
                              //       //         borderRadius:
                              //       //             BorderRadius.all(Radius.circular(20.0))),
                              //       //     width: phoneSize.width * 0.34,
                              //       //     child: new Text(
                              //       //       'شروع کار',
                              //       //       style: TextStyle(
                              //       //           color: Color(0xff2D0827),
                              //       //           fontWeight: FontWeight.bold,
                              //       //           fontSize: 14.0),
                              //       //       textAlign: TextAlign.center,
                              //       //     ),
                              //       //   ),
                              //       //   onTap: () {
                              //       //     Navigator.of(context).push(new MaterialPageRoute(
                              //       //         builder: (ctx) => new SendReq(
                              //       //               advertising: widget.advertising,
                              //       //               profile: widget.profile,
                              //       //             )));
                              //       //   },
                              //       // ),
                              //     ],
                              //   ),
                              // ),
//                  Image.file(this._imageFile),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                new Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new GestureDetector(
                              onTap: () async {
                                tozihat = await AlertTextField.alertDialog(
                                    'توضیحات', tozihat, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, tozihat))),
                          new Text(
                            tozihat == 'توضیحات' ? 'وارد نشده' : 'توضیحات',
                            style: TextStyle(
                                color: tozihat == 'توضیحات'
                                    ? _color()
                                    : Colors.black),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new GestureDetector(
                              onTap: () async {
                                shrayet = await AlertTextField.alertDialog(
                                    'شرایط', shrayet, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, shrayet))),
                          new Text(shrayet == 'شرایط' ? 'وارد نشده' : 'شرایط')
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new GestureDetector(
                              onTap: () async {
                                mohlat = await AlertTextField.alertDialog(
                                    'مهلت', mohlat, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, mohlat))),
                          new Text(mohlat == 'مهلت' ? 'وارد نشده' : 'مهلت',
                              style: TextStyle(
                                  color:
                                      mohlat == 'مهلت' ? _color() : Colors.black))
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new GestureDetector(
                              onTap: () async {
                                boodje = await AlertTextField.alertDialog(
                                    'بودجه', boodje, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, boodje))),
                          new Text(boodje == 'بودجه' ? 'وارد نشده' : 'بودجه',
                              style: TextStyle(
                                  color: boodje == 'بودجه'
                                      ? _color()
                                      : Colors.black))
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new GestureDetector(
                              onTap: () async {
                                adress = await AlertTextField.alertDialog(
                                    'آدرس', adress, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, adress))),
                          new Text(adress == 'آدرس' ? 'وارد نشده' : 'آدرس',
                              style: TextStyle(
                                  color:
                                      adress == 'آدرس' ? _color() : Colors.black))
                        ],
                      ),
                    ),
                    clr1
                        ? onvan == 'عنوان آگهی'
                            ? new Column(
                                children: [
                                  new Divider(),
                                  new Text('عنوان آگهی را سربرگ وارد کنید',
                                      style: TextStyle(color: Colors.red))
                                ],
                              )
                            : new SizedBox()
                        : new SizedBox(),
                  ],
                ),
              ],
            ),
            new GestureDetector(
              onTap: () async{
                if (onvan == 'عنوان آگهی') {
                  setState(() {
                    clr1 = true;
                  });
                } else {
                  setState(() {
                    clr1 = false;
                  });
                }
                if (tozihat == 'توضیحات' ||
                    mohlat == 'مهلت' ||
                    boodje == 'بودجه' ||
                    adress == 'آدرس' ||
                    onvan == 'عنوان آگهی') {
                  setState(() {
                    clr = true;
                  });
                } else {
                  await addAd();
                  if(res['status']=="added"){
                    key.currentState.showSnackBar(
                        new SnackBar(content: new Text("آگهی شما با موفقیت ارسال شد"))
                    );
                  }
                }
              },
              child: new Container(

                alignment: Alignment.center,
                width: phoneSize.width * 0.8,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
                    ],
                    color: R.color.banafshKamRang,
                    borderRadius: BorderRadius.circular(25)),
                child: new Text(
                  'آگهی کن',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            )
          ]),
    );
  }

  addAd()async{
    String sharayet = shrayet;
    if(sharayet=='شرایط'){
      sharayet="";
    }
    res =await AddAd.addAdv(
        {
          "user_id":widget.profile.id,
          "title":onvan,
          "description":tozihat,
          "date":"${DateTime.now()}",
          "price":boodje,
          "conditions":sharayet,
          "location":adress,
        });
  }
}
