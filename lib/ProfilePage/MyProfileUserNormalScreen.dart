import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stubbbb/Component/textformfield.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/http/Authenticate.dart';
import 'package:image/image.dart'as Img;



class MyProfileUserNormalScreen extends StatefulWidget {
  String id;
  MyData profile;
  MyProfileUserNormalScreen({this.id,this.profile});


  @override
  _MyProfileUserNormalScreenState createState() => _MyProfileUserNormalScreenState();
}

class _MyProfileUserNormalScreenState extends State<MyProfileUserNormalScreen> {
  GlobalKey _formKeyOne = GlobalKey<FormState>();
  // MyData profile;
  Map res;
  bool showImage=true;
  File _image;
  var picker = new ImagePicker();
  var rand;
  var fileName;
  bool isSaveData=false;
  String url ="http://stube.ir/CompleteProfile.php";
  // MyData newProfile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getMyData();
    // print(widget.profile.username);
    // print(widget.profile.username);
    // print(widget.profile.username);
    // print(widget.profile.username);
    fileName=getImg();
  }

  getImg(){
    return widget.profile.image;
  }
  // _getMyData()async{
  //   MyData body = await AuthenticateService.getMyData(widget.id);
  //   profile = body;
  // }


  Future pickImage(ImageSource imageSource) async {
    var imageFile = await picker.getImage(source: imageSource);
    if(imageFile!=null){
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
      this.fileName = "image_${widget.profile.id}_${widget.profile.username}_Profile_$rand.jpg";
      var compressImg = new File("$path/$fileName")
        ..writeAsBytesSync(Img.encodeJpg(smallerImg,quality: 85));

      setState((){
        this._image = compressImg;
        showImage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          backgroundColor: Color(0xffF5F0F0),
            resizeToAvoidBottomInset: false,
            body: new ListView(
              children: [
                Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new FlatButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: new Text('ذخیره',style: TextStyle(fontSize: 20.0,color: R.color.banafshKamRang),)
                        ),
                        new IconButton(
                            icon: Icon(Icons.arrow_forward,size: 30.0,),
                            onPressed: (){Navigator.of(context).pop();}
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children :[
                            fileName=="" || fileName==null || showImage==false
                              ? new GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                    new AlertDialog(
                                      title: new Text(
                                        "انتخاب عکس از",
                                        style: TextStyle(fontSize: 16.0),
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
                                                child: new Text("دوربین گوشی",textDirection: TextDirection.rtl,),
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
                                  alignment: Alignment.center,
                                  child: new CircleAvatar(
                                    radius:SizeConfig.heightMultiplier * 6.1,
                                    backgroundColor: R.color.banafshKamRang,
                                    child: new Text(
                                      widget.profile.username.toString().substring(0,1),
                                      style: TextStyle(fontSize: SizeConfig.textMultiplier*4,color: Colors.white),
                                    ),
                                  ),
                                ),
                            )
                            : GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                    new AlertDialog(
                                      title: new Text(
                                        "ویرایش عکس",
                                        style: TextStyle(fontSize: 16.0),
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
                                                child: new Text("دوربین گوشی",textDirection: TextDirection.rtl,),
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
                                onLongPress: (){
                                  return showDialog(context: context,builder: (ctx)=> new AlertDialog(
                                    title: Text("آیا میخواهید عکس را حذف کنید ؟"),
                                    actions: [
                                      new FlatButton(
                                          onPressed: (){
                                            // deleteImage(widget.profile.image);
                                            setState(() {
                                              fileName="";
                                              showImage=false;
                                              print(showImage);
                                              // _image=new File();
                                            });
                                            Navigator.of(context).pop(false);
                                          },
                                          child: Text("بله")),
                                      new FlatButton(
                                          onPressed: (){
                                            Navigator.of(context).pop(false);
                                          },
                                          child: Text("خیر")),
                                    ],
                                  ));

                                },
                                child: _image==null
                                    ? Center(
                                        child: CircleAvatar(
                                          radius: SizeConfig.heightMultiplier * 6.3,
                                          backgroundImage: NetworkImage("http://stube.ir/image/${widget.profile.image}"),
                                          backgroundColor: Colors.transparent,
                                        ),
                                      )
                                    : showImage
                                      ? Center(
                                          child: CircleAvatar(
                                            radius: 60.0,
                                            backgroundImage: FileImage(_image),
                                            backgroundColor: Colors.transparent,
                                          ),
                                        )
                                      : Center(
                                          child: new CircleAvatar(
                                            radius: SizeConfig.heightMultiplier * 6.3,
                                            backgroundColor: R.color.banafshKamRang,
                                            child: new Text(
                                              widget.profile.username.toString().substring(0,1),
                                              style: TextStyle(fontSize: 25.0,color: Colors.white),
                                            ),
                                          ),
                                        )
                            ),

                            new SizedBox(height: 10.0,),
                            new Align(
                              alignment: Alignment.center,
                              child: new Text(widget.profile.username,style: TextStyle(fontSize:SizeConfig.textMultiplier*3,color: R.color.banafshKamRang)),
                            ),
                            new Form(
                                key: _formKeyOne,
                                child: new Container(
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InputTextForm(
                                        obscure: false,
                                        // onSaved: userOnsaved,
                                        color: Colors.black26,
                                        lableColor: Colors.black54,
                                        lable: 'معرفی نامه',
                                        // validate: validateSignUp
                                      ),
                                      new SizedBox(height: 35.0,),
                                      new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          new Text('تعداد پروژه های ب اشتراک گذاشته شده : ',style: TextStyle(fontSize: 16.0),),
                                          new Text('5',style: TextStyle(fontSize: 16.0),),
                                        ],
                                      )
                                    ],

                                  ),
                                )),
                          ]
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
