import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF000000),
          title: Text(
            "Swipe Card",
            textAlign: TextAlign.center,
          ),
        ),
        body: GwentCard(
          name: "Cirilla Fiona Elen Riannon",
          description:
              "\"Know when fairy tales cease to be tales? When people start believing in them.\"",
          power: "15",
          image_asset:  "assets/images/image1.jpg",
        ));
  }
}

class GwentCard extends StatelessWidget {
  final String name;
  final String description;
  final String power;
  final String image_asset;

  GwentCard({this.name, this.description, this.power, this.image_asset});

  List<Color> _colors = [Color(0xFF000000), Color(0xFF000000)];
  List<double> _stops = [0.0, 1.2];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: 350,
            height: 300,
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
          padding: const EdgeInsets.all(35.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _colors,
                stops: _stops,
              ),
//          color:  Color(0xFFFC9E18),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              //  border: Border.all(color: Color(0xFFFC9E18),width: 10),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 5.0),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                                  MediaQuery.of(context).size.height * 0.60 + 2,
                              fit: BoxFit.cover,
                              alignment: Alignment(-3.0, -1.0),
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
    );
  }
}
