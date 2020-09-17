import 'dart:math';
import 'package:image/image.dart' as Img;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stubbbb/AgahiPage/TextAddPost.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/http/AddAd.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';



class AddInternPost extends StatefulWidget {
  MyData profile;
  AddInternPost({this.profile});
  @override
  _AddInternPostState createState() => _AddInternPostState();
}

class _AddInternPostState extends State<AddInternPost> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: new Directionality(
            textDirection: TextDirection.rtl,
            child:FieldsListIntern(profile: widget.profile,)));
  }
}

class FieldsListIntern extends StatefulWidget {
  FieldsListIntern({this.profile});
  MyData profile;
  @override
  _FieldsListInternState createState() => _FieldsListInternState();
}

class _FieldsListInternState extends State<FieldsListIntern> {
  var _listdrop=["کارآموزی","کارآموزی منجر به استخدام","استخدام"];
  final key = GlobalKey<ScaffoldState>();
  bool clr = false;
  bool clr1 = false;
  int group = 1,type=0;
  Map res;

  File _image;
  var picker = new ImagePicker();
  var rand;
  var fileName;


  String tozihat = 'توضیحات',
      shrayet = 'شرایط',
      numberPeople = 'تعداد افراد',
      timeWork = 'ساعت کاری',
      phone = 'شماره تلفن',
      address = 'آدرس',
      onvan = '+عنوان کار اموزی',
      company = '+نام شرکت',
      showType='نوع کارآموزی';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(type);
  }



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
    this.fileName = "image_${widget.profile.id}_${widget.profile.username}_${widget.profile.name}_Intern_$rand.jpg";
    var compressImg = new File("$path/$fileName")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg,quality: 85));

    setState((){
      this._image = compressImg;
    });
  }

  Future upload(File imageFile) async{
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://stube.ir/uploadAndAddIntern.php");

    var request = new http.MultipartRequest("POST", uri);

    var multiPartFile = new http.MultipartFile("image", stream, length,filename: basename(imageFile.path));


    String sharayet = shrayet;
    if (sharayet == 'شرایط') {
      sharayet = "";
    }

    request.fields['user_id'] = widget.profile.id;
    request.fields['title'] = onvan;
    request.fields['company'] = company;
    request.fields['date'] = "${DateTime.now()}";
    request.fields['numberinternship'] = numberPeople;
    request.fields['time_work'] = timeWork;
    request.fields['type'] = "$type";
    request.fields['description'] = tozihat;
    request.fields['image'] = this.fileName;
    request.fields['address'] = address;
    request.fields['phonenumber'] = phone;

    request.files.add(multiPartFile);
    var response = await request.send();
    // print(response);
    // print(json.decode(response.stream.toString()));
    // var responseBody = json.decode(response.headers);

//    print(stream);
//    print(length);
//    print(uri);
//    print(request);
    print(response.statusCode);


    await response.stream.transform(utf8.decoder).listen((value) {
      res = json.decode(value);
      print(res);
      print(res['status']);
    });
    if(response.statusCode == 200) {
      print('upload seccess');
    }else{
      print('upload failed');
    }
  }


  // addAd()async{
  //   String sharayet = shrayet;
  //   if(sharayet=='شرایط'){
  //     sharayet="";
  //   }
  //   res =await AddAd.addAdv(
  //       {
  //         "user_id":widget.profile.id,
  //         "title":onvan,
  //         "description":tozihat,
  //         "date":"${DateTime.now()}",
  //         "price":timeWork,
  //         "conditions":sharayet,
  //         "location":address,
  //       });
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
                        _image == null
                            ? new GestureDetector(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) => new AlertDialog(
                                title: new Text(
                                  "انتخاب فایل از",
                                  style: TextStyle(fontSize: 16.0),
                                  textDirection: TextDirection.rtl,
                                ),
                                actions: [
                                  Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: new MaterialButton(
                                          elevation: 0,
                                          color: Colors.white,
                                          child: new Text("گالری"),
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
                                          child: new Text("دوربین گوشی"),
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
                                      style: TextStyle(fontSize: 22.0),
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
                                      '+عنوان کار اموزی', onvan, context);
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
                              //         'نام شرکت', dste, context);
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10.0,top: 10.0),
                          child: DropdownButton<String>(
                            hint: Container(width: phoneSize.width*0.85,child: new Text(showType)),
                            items: _listdrop.map((String dropdownStringItem){
                              return DropdownMenuItem<String>(
                                value: dropdownStringItem,
                                onTap: (){

                                },
                                child: Align(alignment: Alignment.centerRight,child: Text(dropdownStringItem,textAlign: TextAlign.right,)),
                              );
                            }).toList(),
                            onChanged: (value){
                              setState(() {
                                showType=value;
                                if(value=="استخدام"){
                                  type=3;
                                }else if(value=="کارآموزی منجر به استخدام"){
                                  type=2;
                                }else if(value=="کارآموزی"){
                                  type=1;
                                }
                                print(type);
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    // new Text("نوع کارآموزی"),
                    // new Row(
                    //   children: [
                    //
                    //     new Radio(
                    //       value: 1,
                    //       groupValue: group,
                    //       onChanged: (T){
                    //         setState(() {
                    //           group = T;
                    //           print(group);
                    //         });
                    //       }
                    //     ),
                    //     new Radio(
                    //         value: 2,
                    //         groupValue: group,
                    //         onChanged: (T){
                    //           setState(() {
                    //             group = T;
                    //             print(group);
                    //           });
                    //         }
                    //     ),
                    //     new Radio(
                    //         value: 3,
                    //         groupValue: group,
                    //         onChanged: (T){
                    //           setState(() {
                    //             group = T;
                    //             print(group);
                    //           });
                    //         }
                    //     ),
                    //
                    //     // ListTile(
                    //     //   title: const Text('کارآموزی'),
                    //     //   leading: new Radio(
                    //     //       value: 'کارآموزی', groupValue: "a", onChanged: null),
                    //     // ),
                    //     // ListTile(
                    //     //   title: const Text('کارآموزی'),
                    //     //   leading: new Radio(
                    //     //       value: 'کارآموزی', groupValue: null, onChanged: null),
                    //     // ),
                    //     // ListTile(
                    //     //   title: const Text('کارآموزی'),
                    //     //   leading: new Radio(
                    //     //       value: 'کارآموزی', groupValue: null, onChanged: null),
                    //     // ),
                    //     //
                    //   ],
                    // ),
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
                                numberPeople = await AlertTextField.alertDialog(
                                    'تعداد افراد', numberPeople, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, numberPeople))),
                          new Text(numberPeople == 'تعداد افراد' ? 'وارد نشده' : 'تعداد افراد',
                              style: TextStyle(
                                  color:
                                  numberPeople == 'تعداد افراد' ? _color() : Colors.black))
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
                                timeWork = await AlertTextField.alertDialog(
                                    'ساعت کاری', timeWork, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, timeWork))),
                          new Text(timeWork == 'ساعت کاری' ? 'وارد نشده' : 'ساعت کاری',
                              style: TextStyle(
                                  color: timeWork == 'ساعت کاری'
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
                                phone = await AlertTextField.alertDialog(
                                    'شماره تلفن', phone, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, phone))),
                          new Text(phone == 'شماره تلفن' ? 'وارد نشده' : 'شماره تلفن',
                              style: TextStyle(
                                  color: phone == 'شماره تلفن'
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
                                address = await AlertTextField.alertDialog(
                                    'آدرس', address, context);
                                setState(() {});
                              },
                              child: Container(
                                  width: phoneSize.width * .78,
                                  child: _text(18, address))),
                          new Text(address == 'آدرس' ? 'وارد نشده' : 'آدرس',
                              style: TextStyle(
                                  color:
                                  address == 'آدرس' ? _color() : Colors.black))
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
                    timeWork == 'مهلت' ||
                    phone == 'بودجه' ||
                    address == 'آدرس' ||
                    onvan == 'عنوان آگهی') {
                  setState(() {
                    clr = true;
                  });
                } else {
                  await upload(_image);
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


}
