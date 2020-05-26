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
        fontFamily: 'Gwent',
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> _colors = [Color(0xFF000000), Color(0xFF000000)];
    List<double> _stops = [0.0, 1.2];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        title: Text("Swipe Card", textAlign: TextAlign.center,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                      child: Image.asset(
                        "assets/images/image1.jpg",
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.60,
                        fit: BoxFit.cover,
                        alignment: Alignment(-3.0,-1.0),
                      )),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      child: Container(width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border( top:BorderSide(color: Color(0xFF000000),width: 1)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.jpg'),
                            alignment: Alignment(0, -1.0),

                              colorFilter: ColorFilter.mode(Color(0xffDAD3C7), BlendMode.colorBurn),
                            fit: BoxFit.fitWidth
                        )
                      ),
                  child: Text("Cirilla Fiona Elen Riannon", textAlign:TextAlign.center,style: TextStyle(
                    fontFamily: "Gwent"
                  ),),

                      )),
                )
              ],
            ),
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
