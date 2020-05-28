import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'Gwent',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> list=new List();

  @override
  void initState() {

    list.add(GwentCard(
      name: "Cirilla Fiona Elen Riannon",
      description:
      "\"Know when fairy tales cease to be tales? When people start believing in them.\"",
      power: "12",
      image_asset:  "assets/images/image1.jpg",
      alignment:  Alignment(-3.0, -1.0),
    ));

    list.add(GwentCard(
      name: "Geralt of Rivia",
      description:
      "\"It that's it takes to save the world. it's better to let that world die.\"",
      power: "15",
      image_asset:  "assets/images/image2.jpg",
      alignment:  Alignment(-0.0, -1.0),
    ));

    list.add(GwentCard(
      name: "Impera Bridge Guard",
      description:
      "\"The brigade might be inspired by Praetorian Guard of Roman Empire.\"",
      power: "8",
      image_asset:  "assets/images/image3.png",
      alignment:  Alignment(-0.0, -1.0),
    ));

    list.add(GwentCard(
      name: "Assasin",
      description:
      "\"Know when fairy tales cease to be tales? When people start believing in them.\"",
      power: "8",
      image_asset:  "assets/images/image4.png",
      alignment:  Alignment(-0.0, -1.0),
    ));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    CardController controller;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF000000),
          title: Text(
            "Swipe Card",
            textAlign: TextAlign.center,
          ),
        ),
        body: Stack(
//              children: list,
            children: <Widget>[
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 800,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/backround_back.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                ),
//            Image.asset("assets/images/backround_back.jpg",fit: BoxFit.cover,
//            colorBlendMode: BlendMode.darken,),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(

                  color: Colors.transparent,
                    height: MediaQuery.of(context).size.height * 0.9,
                  child: new TinderSwapCard(

                      orientation: AmassOrientation.TOP,
                      totalNum: list.length,
                      stackNum: list.length,
                      swipeEdge: 4.0,
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: MediaQuery.of(context).size.height * 0.90,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      minHeight: MediaQuery.of(context).size.height * 0.8,
                      cardBuilder: (context, index) => Card(
                        child: list[index],
                      ),
                      cardController: controller = CardController(),
                      swipeUpdateCallback:
                          (DragUpdateDetails details, Alignment align) {
                        /// Get swiping card's alignment
                        if (align.x < 0) {
                          //Card is LEFT swiping
                        } else if (align.x > 0) {
                          //Card is RIGHT swiping
                        }
                      },
                      swipeCompleteCallback:
                          (CardSwipeOrientation orientation, int index) {
                        /// Get orientation & index of swiped card!
                      })),
            ),
//              GwentCard(
//                name: "Cirilla Fiona Elen Riannon",
//                description:
//                    "\"Know when fairy tales cease to be tales? When people start believing in them.\"",
//                power: "15",
//                image_asset:  "assets/images/image1.jpg",
//              ),
            ],


        ));
  }
}
class GwentCard extends StatelessWidget {
  final String name;
  final String description;
  final String power;
  final String image_asset;
  final Alignment alignment;

  GwentCard({this.name, this.description, this.power, this.image_asset, this.alignment});

  List<Color> _colors = [Color(0xFF000000), Color(0xFF000000)];
  List<double> _stops = [0.0, 1.2];

  @override
  Widget build(BuildContext context) {
    return  Container(

      child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(image_asset
                                 ,
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.60 + 4,
                                  fit: BoxFit.cover,
                                  alignment:alignment,
                                ),
                              ],
                            )),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  //border: Border( top:BorderSide(color: Color(0xFF000000),width: 1)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/background.jpg'),
                                      alignment: Alignment(0, -1.0),
                                      colorFilter: ColorFilter.mode(
                                          Color(0xffDAD3C7), BlendMode.colorBurn),
                                      fit: BoxFit.fitWidth)),
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Gwent",
                                            fontSize: 20.0,
                                            color: Color(0xff4E493E)),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Text(
                                        description,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            //  fontFamily: "Gwent",
                                            fontSize: 15.0,
                                            color: Color(0xff4E493E)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset("assets/images/token.png"),
            ),
            Positioned(
              left: 37,
              top: MediaQuery.of(context).size.height * 0.05,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff23201D).withOpacity(0.4)),
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  color: Color(0xffC88E66),
                  strokeWidth: 1,
                  child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      child: Text(
                        power,
                        style: TextStyle(
                            fontFamily: "Gwent", fontSize: 40, color: Colors.white),
                      )),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: MediaQuery.of(context).size.height * 0.28,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xffF6BC21),
                      Color(0xffF17915),
                    ],
                    stops: [0.2, 1.2],
                  ),
                  //border: Border.all(color: Color(0xFF000000),width: 2,style:  BorderStyle.none),
                ),
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  color: Color(0xffC88E66),
                  strokeWidth: 1,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      "assets/images/melee.png",
                      height: 35,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );

  }
}