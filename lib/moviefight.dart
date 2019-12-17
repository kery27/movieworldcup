import 'dart:math';
import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'titleview.dart';

import 'main.dart';

class MovieFightMain extends StatefulWidget {

  final height;
  const MovieFightMain({Key key, this.height}) : super(key: key);

  double get _height => height;

  @override
  _MovieFightMainState createState() => _MovieFightMainState();

}

class _MovieFightMainState extends State<MovieFightMain> {

  static List<String> movielist = [];
  static List<String> movielist2 = [];
  static List colorlist = [];


  //MovieFightMain.height;
  String movietitle1 = '';
  String movietitle2 = '';

  Color colorval1 = Colors.green[900] ;
  Color colorval2 = Colors.deepPurple;

  double _width  = 50;
  double _height1 ;
  double _height2 ;

  double fullheight = 0;
  double half_f_height = 0;

  Color  _color  = Colors.grey;

  int stagenumber = 0;
  int finalstage = 0;
  int stagelimit = 12;
  int foldtime = 600;
  int unfoldtime = 1200;

  final random_init = Random();

  bool first = true;

  bool enableTab = true;

  String last_str ='';

  String adid = 'ca-app-pub-3904256099942544~3347511713';//테스트
  //String adid = 'ca-app-pub-5577802402176197~9576163385';//진짜
  //

  //랜덤으로 문제내기
  //첫 화면 만들기
  //초기 값 세팅할때 랜덤으로 주기

  //결과값 따로 저장해두기

  //문제낼때 화면 정렬하기
  //제목의 영화 네이버 웹뷰로 연결?


  //화면이 생길떄? ok
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Admob.initialize(adid);
    print('initState');

    movielist = ['러브액츄얼리','그랜드 부다페스트 호텔','라라랜드','보헤미안 랩소디',
      '파이트클럽','다크나이트','범죄와의전쟁','타짜','위플래시','라이온킹','매트릭스',
      '아멜리에','이터널선샤인','매드맥스','식스센스','해리포터','악마는 프라다를 입는다',
      '노팅힐','타이타닉','그녀','겨울왕국','인터스텔라','레옹','조커','어밴져스','트루먼쇼','노트북'];

    colorlist = [Colors.red,Colors.orange,Colors.green[300],Colors.blue,Colors.deepOrange,
      Colors.pink,Colors.grey,Colors.brown,Colors.indigo,Colors.amber,Colors.red,Colors.orange,
      Colors.green[900],Colors.blue,Colors.deepOrange, Colors.pink,Colors.grey,Colors.brown];

    stagenumber = 0;
    finalstage = 0;

    int rndnum = random_init.nextInt(movielist.length-1);

    movietitle1 = movielist[rndnum];
    movielist.removeAt(rndnum);
    rndnum = random_init.nextInt(movielist.length-1);
    movietitle2 = movielist[rndnum];
    movielist.removeAt(rndnum);

  }

  //화면이 사라질때??? ok
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');

  }


  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    final orientation=mediaQuery.orientation;

    fullheight = mediaQuery.size.height;
    half_f_height = fullheight / 2;

    if (first){
      _height1 = half_f_height;
      _height2 = half_f_height;
      first = false;
    }


    //print(fullheight);

    return Scaffold(
        body: Container(
          //padding: const EdgeInsets.all(32),
          child: Stack(children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      AnimatedContainer(
                        width: _width,
                        height: _height1,
                        decoration: BoxDecoration(
                          color:colorval1,
                          //borderRadius: BorderRadius.circular(random1.nextInt(100).toDouble())
                        ),
                        duration: Duration(milliseconds: foldtime),
                        curve: Curves.fastOutSlowIn,
                        child: RaisedButton(
                            color: colorval1,
                            child: Container(
                              decoration: BoxDecoration(
                                //color: const Color(0xff7c94b6),
                                //image: const DecorationImage(
                                //image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                //fit: BoxFit.cover,
                                //),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),

                                //borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(movietitle1,textAlign:TextAlign.center,style: TextStyle(fontSize: 40,),),
                              padding: EdgeInsets.all(20.0),

                            ),
                            onPressed: _nextStep1),
                      ),
                      AnimatedContainer(
                        width: _width,
                        height: _height2,
                        decoration: BoxDecoration(
                          color:colorval2,
                          //borderRadius: BorderRadius.circular(random1.nextInt(100).toDouble())
                        ),
                        duration: Duration(milliseconds: foldtime),
                        curve: Curves.fastOutSlowIn,
                        child: RaisedButton(
                            color: colorval2,
                            child: Container(
                              decoration: BoxDecoration(
                                //color: const Color(0xff7c94b6),
                                //image: const DecorationImage(
                                //image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                //fit: BoxFit.cover,
                                //),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),

                                //borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(movietitle2,textAlign:TextAlign.center,style: TextStyle(fontSize: 40),),
                              padding: EdgeInsets.all(20.0),

                            ),
                            onPressed: _nextStep2),
                      ),
/*
                      Container(
                        //margin: EdgeInsets.only(top: 20.0),
                        child: AdmobBanner(
                            adUnitId: getBannerAdUnitId(),
                            adSize: AdmobBannerSize.FULL_BANNER,
                            listener: (AdmobAdEvent event, Map<String, dynamic> args){
                              //handleEvent(event,args,'Banner');
                            }
                        ),
                      ),
*/
                    ],
                  ),
                )
              ],
            ),
            Container(padding:EdgeInsets.only(bottom: 80),
                child: Center(
                    child: Text(last_str,textAlign:TextAlign.center,style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),)))
          ],)
        )
    );
  }



  void resizeheight1() async {

    var future = Future.delayed(Duration(milliseconds: unfoldtime), (){

    });

    // await은 Future의 결과를 기다린다
    var rslt = await future;
    setResize1();

    var future1 = Future.delayed(Duration(milliseconds: foldtime), (){
      enableTab = true;

    });

    if (stagenumber == stagelimit){
      last_str = 'Last';
    }
  }

  void resizeheight2() async {


    var future = Future.delayed(Duration(milliseconds: unfoldtime), (){

    });

    // await은 Future의 결과를 기다린다
    var rslt = await future;

    setResize2();

    var future1 = Future.delayed(Duration(milliseconds: foldtime), (){
      enableTab = true;
    });

    if (stagenumber == stagelimit){
      last_str = 'Last';
    }
  }

  void setResize1(){
    setState(() {


      final random = Random();
      if (stagenumber == 0){
        finalstage = movielist.length-1;
      }
      int indx = 0;

      stagenumber++;

      if (movielist.length-1 == 0){
        indx = 0;
      }else{
        indx = random.nextInt(movielist.length-1 >= 0 ? movielist.length-1 : 0);
      }

      movietitle2 = movielist[indx];
      movielist.removeAt(indx);

      colorval2 = colorlist[stagenumber];

      //print(movielist);
      //print(indx);
      //print('final $finalstage');

      _height2 = half_f_height;
      _height1 = half_f_height;
    });

  }

  void setResize2(){
    setState(() {

      final random = Random();
      int indx = 0;

      if (stagenumber == 0){
        finalstage = movielist.length-1;
      }

      stagenumber++;

      if (movielist.length-1 == 0){
        indx = 0;
      }else{
        indx = random.nextInt(movielist.length-1 >= 0 ? movielist.length-1 : 0);
      }
      movietitle1 = movielist[indx];
      movielist.removeAt(indx);
      colorval1 = colorlist[stagenumber];

      _height2 = half_f_height;
      _height1 = half_f_height;


      //print(movielist);
      //print(indx);
      //print('final $finalstage');

    });

  }

  void _nextStep1(){
    setState(() {
      //print('enableTab $enableTab');
      if (!enableTab){
        return;
      }
      enableTab = false;
      if (stagenumber == stagelimit){
        _finished(movietitle1);

      }else{
        _height2 = 0;
        _height1 = fullheight;

        resizeheight1();
      }

    });

  }

  void _nextStep2(){
    setState(() {
      //print('enableTab $enableTab');
      if (!enableTab){
        return;
      }
      enableTab = false;
      if (stagenumber == stagelimit){
        _finished(movietitle2);

      }else{
        _height1 = 0;
        _height2 = fullheight;

        resizeheight2();
      }

    });
  }

  void _finished(String winner) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          //print(context);
          //return FinishedPopup();
          return Scaffold(body:
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 30.0),
                      child: AdmobBanner(
                          adUnitId: getBannerAdUnitId(),
                          adSize: AdmobBannerSize.FULL_BANNER,
                          listener: (AdmobAdEvent event, Map<String, dynamic> args){
                            //handleEvent(event,args,'Banner');
                          }
                      ),
                    ),
                    SizedBox(height: 100,),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('당신의 인생영화는 ', style: TextStyle(fontSize: 30),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('$winner',textAlign: TextAlign.center, style: TextStyle(fontSize: 60,  fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),

                    ),Row(
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 100,
                          padding: EdgeInsets.fromLTRB(100, 0, 00, 0),
                          child: Material(
                            //color: Colors.white,
                            child: Center(
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.pink,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  color: Colors.white,
                                  onPressed: ()=> Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return MainGateView();
                                      })),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: 200,
                          height: 100,
                          padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                          child: Material(
                            //color: Colors.white,

                            child: Center(
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.blue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.info),
                                  color: Colors.white,
                                  onPressed: ()=> Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {

                                        //print(context);
                                        //return FinishedPopup();
                                        return Scaffold(body:
                                        Center(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(top: 32.0),
                                                child: AdmobBanner(
                                                    adUnitId: getBannerAdUnitId(),
                                                    adSize: AdmobBannerSize.FULL_BANNER,
                                                    listener: (AdmobAdEvent event, Map<String, dynamic> args){
                                                      //handleEvent(event,args,'Banner');
                                                    }
                                                ),
                                              ),
                                              SizedBox(height: 50,),
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Text('모두 부자되십쇼!!!', style: TextStyle(fontSize: 40),),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Text('App Version : 0.1.0', style: TextStyle(fontSize: 20),),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Text('이 App은 Flutter로 만들었습니다.', style: TextStyle(fontSize: 20),),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Text('만든이 kery027@gmail.com ', style: TextStyle(fontSize: 20),),
                                              ),
                                              SizedBox(height: 30,),
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Text('도움준사람들 : 백사장 돼보 .님', style: TextStyle(fontSize: 15),),
                                              ),
                                              SizedBox(height: 50,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 200,
                                                    height: 100,
                                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                    child: Material(
                                                      //color: Colors.white,
                                                      child: Center(
                                                        child: Ink(
                                                          decoration: const ShapeDecoration(
                                                            color: Colors.pink,
                                                            shape: CircleBorder(),
                                                          ),
                                                          child: IconButton(
                                                            icon: Icon(Icons.arrow_back),
                                                            color: Colors.white,
                                                            onPressed: ()=> Navigator.push(context,
                                                                MaterialPageRoute(builder: (context) {
                                                                  return MainGateView();
                                                                })),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )

                                            ],
                                          ),
                                        )
                                        );

                                      })),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              )
          );
        }));
  }


  String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
      //return 'ca-app-pub-5577802402176197/6177712532';//진짜
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
      //return 'ca-app-pub-5577802402176197/6054122287';//진짜

    }
    return null;
  }


}
