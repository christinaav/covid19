import 'dart:convert';
import 'package:covid19/data.dart';
import 'package:flutter/foundation.dart';
import 'countryData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:undraw/undraw.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://corona.lmao.ninja/v2/countries/";

class API {
  static Future getCountry() {
    var url = baseUrl;
    return http.get(url);
  }
}

// ------------------------------------------------

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Covid-19'),
    );
  }
}

void main() => runApp(MyApp());

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int _selectedIndex = 0;
  var countryData = List<CountryData>();
  var state, temp;

  _getCountry() {
    API.getCountry().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        countryData = list.map((model) => CountryData.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getCountry();
  }

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

// pop up con la lista dei paesi
  _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                // ----------
                return Container(
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
                              itemBuilder: (context, index) => Container(
                                    color: _selectedIndex != null &&
                                            _selectedIndex == index
                                        ? Colors.orange[100]
                                        : Colors.white,
                                    child: ListTile(
                                        title: Text(countryData[index].country),
                                        onTap: () {
                                          setState(() {
                                            _onSelected(index);
                                            temp = countryData[index].country;
                                            state = countryData[index];

                                            print(countryData[index].country);
                                            print(countryData[index]
                                                .countryInfo
                                                .flag);
                                          });
                                        }),
                                  ))),
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
                        onTap: () {
                          print(temp);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Terza(country: state)),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }));
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
