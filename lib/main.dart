import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartgn/Dialog_money.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

main()  {



  runApp(MyApp());
}

class MyApp extends StatelessWidget {



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
      home: MyHomePage(title: 'Giulianovars'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;






  @override
  _MyHomePageState createState() => _MyHomePageState();
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




  DatabaseReference _counterRef;
  DatabaseReference _messagesRef;
  String _kTestKey = 'Hello';
  String _kTestValue = 'world!';
  DatabaseError _error;

  Future<void> createRecord() async {


    final FirebaseApp app = await FirebaseApp.configure(
      name: 'db2',
      options: Platform.isIOS
          ? const FirebaseOptions(
        googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
        gcmSenderID: '297855924061',
        databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
      )
          : const FirebaseOptions(
        googleAppID: '1:916071383693:android:8d4565047a06cab0ed98c4',
        apiKey: 'AIzaSyCuSjNHGXocnZR_RRq1-PRS9zU8FGfnO_c',
        databaseURL: 'https://giulianovarssmart.firebaseio.com',
      ),
    );

    _counterRef = FirebaseDatabase.instance.reference().child('washer').child('openPercent').child('openPercent');
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    _messagesRef = database.reference().child('messages');
  //  database.reference().child('washer').child('openPercent').child('openPercent').once().then((DataSnapshot snapshot) {
 //     print('Connected to second database and read ${snapshot.value}');
  //  });

    // Increment counter in transaction.


    //изменяет данные
    final TransactionResult transactionResult =
    await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = 100;
      return mutableData;
    });

    if (transactionResult.committed) {
      /*
      _messagesRef.push().set(<String, String>{
        _kTestKey: '$_kTestValue ${transactionResult.dataSnapshot.value}'
      });
      */

    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }


  }
  Future<void> createRecord2() async {


    final FirebaseApp app = await FirebaseApp.configure(
      name: 'db2',
      options: Platform.isIOS
          ? const FirebaseOptions(
        googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
        gcmSenderID: '297855924061',
        databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
      )
          : const FirebaseOptions(
        googleAppID: '1:916071383693:android:8d4565047a06cab0ed98c4',
        apiKey: 'AIzaSyCuSjNHGXocnZR_RRq1-PRS9zU8FGfnO_c',
        databaseURL: 'https://giulianovarssmart.firebaseio.com',
      ),
    );

    _counterRef = FirebaseDatabase.instance.reference().child('washer').child('openPercent').child('openPercent');
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    _messagesRef = database.reference().child('messages');
    //  database.reference().child('washer').child('openPercent').child('openPercent').once().then((DataSnapshot snapshot) {
    //     print('Connected to second database and read ${snapshot.value}');
    //  });

    // Increment counter in transaction.


    //изменяет данные
    final TransactionResult transactionResult =
    await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = 0;
      return mutableData;
    });

    if (transactionResult.committed) {
      /*
      _messagesRef.push().set(<String, String>{
        _kTestKey: '$_kTestValue ${transactionResult.dataSnapshot.value}'
      });
      */

    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }


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

                                    createRecord2();


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
