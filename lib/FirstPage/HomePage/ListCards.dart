import 'package:flutter/material.dart';
import 'package:stubbbb/AgahiPage/AdvertisingsPage.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/StudentPerfect/StudentPerfectScreen.dart';
import '../../KarAmouziPage/KarAmouziPage.dart';
import '../../StudentPage/StudentScreen.dart';
import '../../Other/R.dart';

class ListCards extends StatefulWidget {
  MyData profile;
  ListCards({this.profile});

  @override
  _ListCardsState createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {




  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier *3,horizontal: SizeConfig.imageSizeMultiplier*4 ),
        child: new Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: new MenuItemWidget(
                      model: new ModelMenu(R.titr.daneshjo, R.images.daneshjoHa, R.color.red),
                      listener: goToStu,

                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: new MenuItemWidget(
                      model: new ModelMenu(R.titr.aagahi, R.images.projects, R.color.banafshmain),
                      listener: goToProjects,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: new MenuItemWidget(
                      model: new ModelMenu(R.titr.karamouzu , R.images.karAmouzi , R.color.blueTire),
                      listener: goToKarAmouozi,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: new MenuItemWidget(
                      model: new ModelMenu(R.titr.daneshjoyehefei , R.images.daneshjoyeHerfei , R.color.red),
                      listener: goToStudentPerfectScreen,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void goToStu() {
    Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilesPages(profile: widget.profile,)));
  }

  void goToProjects() {

    Navigator.push(context,MaterialPageRoute(builder: (context){
      return AdvertisingsPage(profile: widget.profile);
    }));
  }

  void goToKarAmouozi() {
    Navigator.push(context,MaterialPageRoute(builder: (context) => KarAmouziPage(profile: widget.profile,)));
  }

  void goToStudentPerfectScreen(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => StudentPerfectScreen(profile: widget.profile,)));
  }


}






