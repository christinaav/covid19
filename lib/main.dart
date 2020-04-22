import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:undraw/undraw.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Covid-19'),
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
  int selectitem = 1;
  ScrollController _scrollController = new ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // flutter defined function
  _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Scegli il paese:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  new Expanded(
                      child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text('Gujarat, India'),
                            );
                          })),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 148, 46, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)),
                      ),
                      child: Text(
                        "Prosegui",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(14, 31, 154, 1.75),
            Color.fromRGBO(75, 94, 179, 1)
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UnDraw(
              illustration: UnDrawIllustration.medicine,
              color: Color.fromRGBO(252, 148, 46, 1),
              height: 180,
              width: 180,
            ),
            Text(
              'COVID - 19',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white,
                    height: 2.5,
                    fontSize: 40,
                    letterSpacing: 5),
              ),
            ),
            Text(
              'Monitora gli ultimi dati del tuo paese.',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white,
                    height: 3.5,
                    fontSize: 16,
                    letterSpacing: 0),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              child: RoundedButtonWithIcon(
                onPressed: () {
                  _showDialog();
                },
                icon: Icons.location_on,
                title: "Scegli paese",
                buttonColor: Colors.black,
              ),
              width: 300,
            ),
          ],
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
