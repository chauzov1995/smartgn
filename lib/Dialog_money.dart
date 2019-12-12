import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialog_money extends StatefulWidget {
  var money;

  Dialog_money(this.money);

  @override
  State<StatefulWidget> createState() => Dialog_moneyState(money);
}

class Dialog_moneyState extends State<Dialog_money>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  var money;

  Dialog_moneyState(this.money);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.ease);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: 250,
            height: 230,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Stack(
              children: <Widget>[
                Container(alignment: Alignment.topRight, child: CloseButton()),
                Positioned(
                  left: 20,
                  right: 0,
                  top: 15.0,
                  child: Text('Ретротоп',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontFamily: 'sfprodisplay_r')),
                ),
            Padding(
                padding: EdgeInsets.only(top:42, left: 8, right: 8),
              child: Divider(

                  color: Colors.black26,
                )),
                Positioned(
                    top: 80.0,
                    left: 30,
                    child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/down_noactiv.png",
                              height: 70,
                              width: 70,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Опустить'),
                            )
                          ],
                        ))),
                Positioned(
                    top: 80.0,
                    right: 30,
                    child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/up_activ.png",
                              height: 70,
                              width: 70,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Поднять'),
                            )
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
