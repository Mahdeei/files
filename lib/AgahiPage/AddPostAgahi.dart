import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:stubbbb/AgahiPage/TextAddPost.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'package:stubbbb/Other/SizeConfig.dart';

class AddPostAgahi extends StatefulWidget {
  MyData profile;

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
            child: FieldsList(
              profile: widget.profile,
            )));
  }
}

class FieldsList extends StatefulWidget {
  FieldsList({this.profile});

  MyData profile;

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
    // setState(() {});
  }

  File _image;
  var picker = new ImagePicker();
  var rand;
  var fileName;
  Future pickImage(ImageSource imageSource) async {
    var imageFile = await picker.getImage(source: imageSource);
    File file = File(imageFile.path);

    File croppedFile = await ImageCropper.cropImage(
      sourcePath: file.path,
      maxWidth : 512,
      maxHeight: 512,
      aspectRatio:  CropAspectRatio(ratioX: 1.0,ratioY: 1.0),
    );

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Img.Image image = Img.decodeImage(croppedFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image,width: 500);

    this.rand= new Random().nextInt(100000000).toString() + new Random().nextInt(10000000).toString() + new Random().nextInt(10000000).toString();
    this.fileName = "image_${widget.profile.id}_${widget.profile.username}_${widget.profile.name}_Advertising_$rand.jpg";
    var compressImg = new File("$path/$fileName")
    ..writeAsBytesSync(Img.encodeJpg(smallerImg,quality: 85));

    setState((){
      this._image = compressImg;
    });
  }

  // Future<Null> pickImageFromCamera() async {
  //   PickedFile pickedFile =await ImagePicker().getImage(source: ImageSource.camera);
  //   setState((){
  //     this._image = File(pickedFile.path);
  //   });
  // }

  Future upload(File imageFile) async{
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://stube.ir/uploadAndAddAd.php");

    var request = new http.MultipartRequest("POST", uri);

    var multiPartFile = new http.MultipartFile("image", stream, length,filename: basename(imageFile.path));


    String sharayet = shrayet;
    if (sharayet == 'شرایط') {
      sharayet = "";
    }



    request.fields['user_id'] = widget.profile.id;
    request.fields['title'] = onvan;
    request.fields['description'] = tozihat;
    request.fields['date'] = "${DateTime.now()}";
    request.fields['price'] = boodje;
    request.fields['conditions'] = sharayet;
    request.fields['location'] = adress;
    request.fields['image'] = this.fileName;

    request.files.add(multiPartFile);
    var response = await request.send();
    // var responseBody = json.decode(response.headers);



     await response.stream.transform(utf8.decoder).listen((value) {
      res = json.decode(value);
    });
    // if(response.statusCode == 200) {
    //   print('upload seccess');
    // }else{
    //   print('upload failed');
    // }
  }

  // addAd() async {
  //   String sharayet = shrayet;
  //   if (sharayet == 'شرایط') {
  //     sharayet = "";
  //   }
  //   res = await AddAd.addAdv({
  //     "user_id": widget.profile.id,
  //     "title": onvan,
  //     "description": tozihat,
  //     "date": "${DateTime.now()}",
  //     "price": boodje,
  //     "conditions": sharayet,
  //     "location": adress,
  //   });
  // }

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
        fontFamily: 'Vazir'
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
            Expanded(
              flex: 10,
              child: new Column(
                children: [
                  Expanded(
                    flex: 2,
                      child: new Row(
                          children: <Widget>[
                           Expanded(
                               flex: 4,
                               child:  _image == null
                                   ? new GestureDetector(
                                 onTap: () async {
                                   showDialog(
                                     context: context,
                                     builder: (context) => new AlertDialog(
                                       title: new Text(
                                         "انتخاب فایل از",
                                         style: TextStyle(fontSize: 16.0,fontFamily: 'Vazir'),
                                         textDirection: TextDirection.rtl,
                                       ),
                                       actions: [
                                         Column(
                                           children: [
                                             Container(
                                               width: MediaQuery.of(context).size.width,
                                               child: new RaisedButton(
                                                 elevation: 0,
                                                 color: Colors.white,
                                                 child: new Text("گالری",style: TextStyle(fontFamily: 'Vazir'),),
                                                 onPressed: () async{
                                                   Navigator.of(context).pop();
                                                   await pickImage(ImageSource.gallery);

                                                 },
                                               ),
                                             ),
                                             new Container(
                                               width: MediaQuery.of(context).size.width,
                                               child: new MaterialButton(
                                                 elevation: 0,
                                                 color: Colors.white,
                                                 child: new Text("دوربین گوشی",textDirection: TextDirection.rtl,style: TextStyle(fontFamily: 'Vazir'),),
                                                 onPressed: () async {
                                                   await pickImage(ImageSource.camera);
                                                   Navigator.of(context).pop();
                                                 },
                                               ),
                                             )
                                           ],
                                         ),
                                       ],
                                     ),
                                   );
                                 },
                                 child: new Container(
                                     height: phoneSize.height * 0.25,
                                     width: phoneSize.width * 0.45,
                                     child: new Align(
                                       alignment: Alignment.center,
                                       child: new Column(
                                         mainAxisAlignment:
                                         MainAxisAlignment.center,
                                         children: <Widget>[
                                           new Icon(
                                             Icons.add_a_photo,
                                             size: 70.0,
                                           ),
                                           new Text(
                                             'اضافه کردن عکس',
                                             style: TextStyle(fontSize: 22.0,fontFamily: 'Vazir'),
                                           )
                                         ],
                                       ),
                                     )),
                               )
                                   : new Container(
                                 height: phoneSize.height * 0.25,
                                 width: phoneSize.width * 0.45,
                                 decoration: BoxDecoration(
                                     image: DecorationImage(image: FileImage(_image),fit: BoxFit.cover)
                                 ),
                               ),),
                            Expanded(
                              flex: 5,
                              child: new Container(
                                height: phoneSize.height * 0.25,
                                width: phoneSize.width * 0.55,
                                color: R.color.banafshtire,
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: new IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            // Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (ctx)=> new AdvertisingsPage()));
                                          }),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:  EdgeInsets.only(top: SizeConfig.heightMultiplier*3,),
                                        child: GestureDetector(
                                          onTap: () async {
                                            onvan = await AlertTextField.alertDialog(
                                                'عنوان آگهی', onvan, context);
                                          },
                                          child: new Align(
                                            alignment: Alignment.topRight,
                                            child: new Padding(
                                              padding:  EdgeInsets.only(right: SizeConfig.imageSizeMultiplier*2),
                                              child: new Text(
                                                onvan,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: SizeConfig.textMultiplier*3,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontFamily: 'Vazir'
                                                ),
                                              ),
                                            ),
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
                              ),
                            )
                          ],
                        )

                  ),
                  Expanded(
                    flex: 5,
                    child: new Column(
                      children: [
                        Padding(
                          padding:
                               EdgeInsets.only(top: SizeConfig.heightMultiplier*1.3, left: SizeConfig.imageSizeMultiplier*3, right: SizeConfig.imageSizeMultiplier*3),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: new GestureDetector(
                                    onTap: () async {
                                      tozihat = await AlertTextField.alertDialog(
                                          'توضیحات', tozihat, context);
                                      setState(() {});
                                    },
                                    child: Container(
                                        width: phoneSize.width * .78,
                                        child: _text(SizeConfig.textMultiplier*2.5, tozihat))),
                              ),
                              Expanded(
                                flex: 1,
                                child: new Text(
                                  tozihat == 'توضیحات' ? 'وارد نشده' : 'توضیحات',
                                  style: TextStyle(fontSize: SizeConfig.textMultiplier*2,
                                      color: tozihat == 'توضیحات'
                                          ? _color()
                                          : Colors.black,
                                      fontFamily: 'Vazir'
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding:
                               EdgeInsets.only(top: SizeConfig.heightMultiplier*1.3, left: SizeConfig.imageSizeMultiplier*3, right: SizeConfig.imageSizeMultiplier*3),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: new GestureDetector(
                                    onTap: () async {
                                      shrayet = await AlertTextField.alertDialog(
                                          'شرایط', shrayet, context);
                                      setState(() {});
                                    },
                                    child: Container(
                                        width: phoneSize.width * .78,
                                        child: _text(SizeConfig.textMultiplier*2.5, shrayet))),
                              ),
                              Expanded(flex: 1,child: new Text(shrayet == 'شرایط' ? 'وارد نشده' : 'شرایط',style: TextStyle(fontSize: SizeConfig.textMultiplier*2,fontFamily: 'Vazir'),))
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding:
                               EdgeInsets.only(top: SizeConfig.heightMultiplier*1.3, left: SizeConfig.imageSizeMultiplier*3, right: SizeConfig.imageSizeMultiplier*3),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: new GestureDetector(
                                    onTap: () async {
                                      mohlat = await AlertTextField.alertDialog(
                                          'مهلت', mohlat, context);
                                      setState(() {});
                                    },
                                    child: Container(
                                        width: phoneSize.width * .78,
                                        child: _text(SizeConfig.textMultiplier*2.5, mohlat))),
                              ),
                              Expanded(
                                flex: 1,
                                child: new Text(mohlat == 'مهلت' ? 'وارد نشده' : 'مهلت',
                                    style: TextStyle(fontSize: SizeConfig.textMultiplier*2,
                                        color: mohlat == 'مهلت'
                                            ? _color()
                                            : Colors.black)),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding:
                               EdgeInsets.only(top: SizeConfig.heightMultiplier*1.3, left: SizeConfig.imageSizeMultiplier*3, right: SizeConfig.imageSizeMultiplier*3),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: new GestureDetector(
                                    onTap: () async {
                                      boodje = await AlertTextField.alertDialog(
                                          'بودجه', boodje, context);
                                      setState(() {});
                                    },
                                    child: Container(
                                        width: phoneSize.width * .78,
                                        child: _text(SizeConfig.textMultiplier*2.5, boodje))),
                              ),
                              Expanded(
                                flex: 1,
                                child: new Text(boodje == 'بودجه' ? 'وارد نشده' : 'بودجه',
                                    style: TextStyle(fontSize: SizeConfig.textMultiplier*2,
                                        color: boodje == 'بودجه'
                                            ? _color()
                                            : Colors.black)),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding:
                               EdgeInsets.only(top: SizeConfig.heightMultiplier*1.3, left: SizeConfig.imageSizeMultiplier*3, right: SizeConfig.imageSizeMultiplier*3),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: new GestureDetector(
                                    onTap: () async {
                                      adress = await AlertTextField.alertDialog(
                                          'آدرس', adress, context);
                                      setState(() {});
                                    },
                                    child: Container(
                                        width: phoneSize.width * .78,
                                        child: _text(SizeConfig.textMultiplier*2.5, adress))),
                              ),
                              Expanded(
                                flex: 1,
                                child: new Text(adress == 'آدرس' ? 'وارد نشده' : 'آدرس',
                                    style: TextStyle(fontSize: SizeConfig.textMultiplier*2,
                                        color: adress == 'آدرس'
                                            ? _color()
                                            : Colors.black,
                                        fontFamily: 'Vazir'
                                    )),
                              )
                            ],
                          ),
                        ),
                        clr1
                            ? onvan == 'عنوان آگهی'
                                ? new Column(
                                    children: [
                                      new Divider(),
                                      new Text('عنوان آگهی را سربرگ وارد کنید',
                                          style: TextStyle(color: Colors.red,fontSize: SizeConfig.textMultiplier*2,fontFamily: 'Vazir'))
                                    ],
                                  )
                                : new SizedBox()
                            : new SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: new GestureDetector(
                onTap: () async {
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

                    await upload(_image);
                    if (res['status'] == "added") {
                      key.currentState.showSnackBar(new SnackBar(
                          content: new Text("آگهی شما با موفقیت ارسال شد",style: TextStyle(fontFamily: 'Vazir'),)));
                    }
                  }
                },
                child: new Container(
                  alignment: Alignment.center,
                  width: phoneSize.width * 0.8,
                  margin:  EdgeInsets.only(bottom: SizeConfig.heightMultiplier*3),
                  padding:  EdgeInsets.symmetric(vertical: SizeConfig.imageSizeMultiplier*2),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ],
                      color: R.color.banafshKamRang,
                      borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier*3.5)),
                  child: new Text(
                    'آگهی کن',
                    style: TextStyle(color: Colors.white, fontSize: SizeConfig.heightMultiplier*2.5),
                  ),
                ),
              ),
            )
          ]),
    );
  }


}
