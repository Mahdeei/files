import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as Img;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stubbbb/Component/textformfield.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';


class EditData extends StatefulWidget {


  MyData profile;
  EditData({this.profile});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController usernameCont ,nameCont,moarefiCont;
  
  GlobalKey _formKeyOne = GlobalKey<FormState>();
  Map res;
  File _image;
  var picker = new ImagePicker();
  var rand;
  var fileName="";



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameCont = new TextEditingController(text: widget.profile.username);
    nameCont = new TextEditingController(text: widget.profile.name);
    moarefiCont = new TextEditingController(text: widget.profile.moarefiNameh);
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
    this.fileName = "image_${widget.profile.id}_${widget.profile.username}_Profile_$rand.jpg";
    var compressImg = new File("$path/$fileName")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg,quality: 85));

    setState((){
      this._image = compressImg;
    });
  }



  Future upload(File imageFile) async{

    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://192.168.1.2/Stub/CompleteProfile.php");

    var request = new http.MultipartRequest("POST", uri);

    var multiPartFile = new http.MultipartFile("image", stream, length,filename: basename(imageFile.path));


    // String sharayet = shrayet;
    // if (sharayet == 'شرایط') {
    //   sharayet = "";
    // }
    print(widget.profile.phoneNumber);
    print(widget.profile.type);
    print(usernameCont.text);
    print(nameCont.text);
    print(moarefiCont.text);
    print(fileName);

    request.fields['phonenumber'] = widget.profile.phoneNumber;
    request.fields['type'] = widget.profile.type;
    request.fields['username'] = usernameCont.text;
    request.fields['name'] = nameCont.text;
    request.fields['moarefiName'] = moarefiCont.text;
    request.fields['image'] = fileName;
    request.fields['address'] = "mashhad";


    request.files.add(multiPartFile);
    var response = await request.send();

//    print(stream);
//    print(length);
//    print(uri);
//    print(request);
    print(response.statusCode);


    await response.stream.transform(utf8.decoder).listen((value) {
      res = json.decode(value);
      print(res);
    });
    if(response.statusCode == 200) {
      print('upload seccess');
    }else{
      print('upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
  var phoneSize = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
            resizeToAvoidBottomInset: true,
            body: new ListView(
              children: [
                Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new FlatButton(
                            onPressed: ()async{
                              await upload(_image);
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
                            new GestureDetector(
                              onTap: (){
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
                              child: _image==null
                                ? new Stack(
                                children: [
                                  new Container(
                                    alignment: Alignment.center,
                                    child: new CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Colors.grey,
                                      child: new Icon(Icons.person,size: 60.0,color: Colors.white),
                                    ),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(left: 60.0,top: 70.0),
                                    alignment: Alignment.bottomCenter,
                                    child: new Icon(Icons.add,size: 40.0,),
                                  )
                                ],
                              )
                              : Center(
                                child: CircleAvatar(
                                    radius: 60.0,
                                    backgroundImage: FileImage(_image),
                                    backgroundColor: Colors.transparent,
                                ),
                              )
                            ),
                            _image==null
                                ?new SizedBox(height: 10.0,)
                                : new Container(),
                            _image==null
                                ? new  Align(
                              alignment: Alignment.center,
                              child: new Text("بارگذاری تصویر",style: TextStyle(color: R.color.banafshKamRang)),
                            )
                                : new Container(),

                            new Form(
                                key: _formKeyOne,
                                child: new Container(
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InputTextForm(
                                        controller: usernameCont,
                                        obscure: false,
                                        // onSaved: userOnsaved,
                                        color: Colors.black,
                                        lableColor: Colors.black,
                                        lable: 'نام کاربری',
                                        // validate: validateSignUp
                                      ),
                                      InputTextForm(
                                        controller: nameCont,
                                        // onSaved: passOnsaved,

                                        color: Colors.black,
                                        lableColor: Colors.black,
                                        lable: 'نام و نام خانوادگی',
                                        obscure: false,
                                        // validate: validateSignUpPas,
                                      ),
                                      InputTextForm(
                                          color: Colors.black,
                                          lableColor: Colors.black,
                                          lable: 'رشته دانشگاهی',
                                          obscure: true,
                                          validate: (String value) {
                                            // if (value != _controller.text) {
                                            //   return 'not true';
                                            // }
                                          }),
                                      InputTextForm(
                                        textColor: Colors.black,
                                        controller: moarefiCont,
                                        obscure: false,
                                        // onSaved: nameOnsaved,
                                        color: Colors.black,
                                        lableColor: Colors.black,
                                        lable: 'معرفی نامه',
                                        // validate: validateNameSignUp
                                      ),
                                      new SizedBox(height: 25.0,),
                                      new Align(
                                        // alignment: Alignment.center,
                                        child: new Text('مشخصات',textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
                                      ),
                                      InputTextForm(
                                        obscure: false,
                                        // onSaved: userOnsaved,
                                        color: Colors.black26,
                                        lableColor: Colors.black54,
                                        lable: 'سوابق کاری',
                                        // validate: validateSignUp
                                      ),
                                      InputTextForm(
                                        // onSaved: passOnsaved,
                                        color: Colors.black26,
                                        lableColor: Colors.black54,
                                        lable: 'سوابق تحصیلی',
                                        obscure: true,
                                        // validate: validateSignUpPas,
                                        // controller: _controller,
                                      ),
                                      InputTextForm(
                                          color: Colors.black26,
                                          lableColor: Colors.black54,
                                          lable: 'مدرک یا گواهیناممه های معتبر',
                                          obscure: true,
                                          validate: (String value) {
                                            // if (value != _controller.text) {
                                            //   return 'not true';
                                            // }
                                          }),
                                      InputTextForm(
                                        obscure: false,
                                        // onSaved: nameOnsaved,
                                        color: Colors.black26,
                                        lableColor: Colors.black54,
                                        lable: 'زبان های مسلط',
                                        // validate: validateNameSignUp
                                      ),
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
