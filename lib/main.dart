import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartgn/Dialog_money.dart';
import 'package:firebase_database/firebase_database.dart';

main()  {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final databaseReference = FirebaseDatabase.instance.reference();

  //final databaseReference = FirebaseDatabase.instance.reference();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giulianovars',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Giulianovars', databaseReference: databaseReference),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.databaseReference}) : super(key: key);
  final databaseReference;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;






  @override
  _MyHomePageState createState() => _MyHomePageState(databaseReference);
}

class device{
  String name;
  String img;
int type;//ретротоп
bool sost;
bool up;
bool down;
  device(this.name, this.img, this.type );



}
class app{
  String name;
  String img;
  String url;
  app(this.name, this.img, this.url);



}



class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  List<device> devices = new List();
  List<app> apps = new List();

 final  databaseReference;
 _MyHomePageState(this.databaseReference);




  void createRecord(){
  //  final databaseReference = FirebaseDatabase.instance.reference();
    print("asdasdasdas");
    databaseReference.child("1").set({
      'title': 'Mastering EJB',
      'description': 'Programming Guide for J2EE'
    });
    databaseReference.child("2").set({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
  }


  @override
  Future initState() {
    super.initState();

    devices.add(device('Ретротоп','retrotop',2));
    devices.add(device('Светильник','svet1',1));
    devices.add(device('Светильник','svet2',1));


    apps.add( app("YouTube", "youtube", "com.google.android.youtube" ));
    apps.add( app("WhatsApp", "whatsup", "com.whatsapp" ));
    apps.add( app("Google Chrome", "googlechrom", "com.android.chrome" ));
    apps.add( app("Google Home", "googlehome", "com.google.android.apps.chromecast.app" ));
    apps.add( app("Google Ассистент", "assistant", "com.google.android.apps.googleassistant" ));






  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Устройства",
              ),
              Tab(
                text: "Приложения",
              ),
            ],
          ),
          title: Text('Giulia Novars Smart'),
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                      onTap: (){

                    showDialog(
                      context: context,
                      builder: (_) => Dialog_money(3),
                    );

                      },
                      child:



                    Card(
                      //  margin: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/${devices[position].img}.png",
                            width: 92,
                            height: 92,
                          ),
                          Positioned(
                            left: 102,
                            top: 10,
                            child: Text(
                              "${devices[position].name}",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'sfprodisplay_s',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 102,
                            top: 40,
                            child: Text(
                              "Кухня",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'sfprodisplay_s',
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 102,
                            top: 40,
                            child: Text(
                              "Кухня",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'sfprodisplay_s',
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10.0,
                              right: 2,
                              child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {

                                    createRecord();


                                  },
                                  child: Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        devices[position].type==2?
                                        "assets/images/up_activ.png":
                                        "assets/images/power_act.png",

                                        height: 50,
                                        width: 50,
                                      ),
                                    ],
                                  ))),
                          devices[position].type==2?
                          Positioned(
                              bottom: 10.0,
                              right: 72,
                              child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {




                                  },
                                  child: Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/down_noactiv.png",
                                        height: 50,
                                        width: 50,
                                      ),
                                    ],
                                  ))):Container(),
                        ],
                      )));
                },
              ),
            ),
            Container(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(apps.length, (index) {
                  return  GestureDetector(
                      onTap: (){
                     //   AppAvailability.launchApp(apps[index].url);

                      },
                      child:
                   Card(

                        //  margin: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 6,
                          ),
                          width: 119,
                          height: 146,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  "assets/images/${apps[index].img}.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),

                             Positioned(
                               left: 0,
                                      right: 0,
                                      bottom: 12,
                                      child:    Text(
                                        "${apps[index].name}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'sfprodisplay_s',
                                          color: Colors.black,

                                        ),
                                      )),
                            ],
                          ),
                        )),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
