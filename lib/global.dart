import 'dart:convert';
import 'package:covid19/globalData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'cards.dart';
import 'package:http/http.dart' as http;

class Global extends StatefulWidget {
  Global({Key key}) : super(key: key);

  @override
  _Global createState() => _Global();
}

class _Global extends State<Global> {
  Map worldData;
  int count = 0;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  hello() {
    print('ciao');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(247, 146, 86, 1),
            title: Text(''),
          ),
          preferredSize: Size.fromHeight(40.0)),
      body: bodyWidget(context),
    );
  }

  // -------------------------------------------------- body widget-----------------------------------------
  bodyWidget(BuildContext context) => Container(
      color: Color.fromRGBO(247, 146, 86, 1),
      child: Column(
        children: <Widget>[
          // --------------------------------------------------------primo container--------------------------------------------------
          Container(
              color: Color.fromRGBO(247, 146, 86, 1),
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Text('Global situation',
                              style: TextStyle(
                                fontSize: 28,
                                color: Color.fromRGBO(245, 245, 249, 1),
                                fontWeight: FontWeight.w500,
                              )),
                        ]),
                  ])),
          SizedBox(height: 10.5),

          // -------------------------------------------------------secondo container---------------------------------------------
          Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height / 4.81),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              color: Color.fromRGBO(245, 245, 249, 1),
            ),
            padding: const EdgeInsets.only(left: 3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 35),
                SizedBox(
                  height: 190,
                  width: 400,
                  child: Swiper.children(
                    index: count,
                    children: <Widget>[
                      cardSwip('assets/ecology-and-environment.png', 'Cases: ',
                          worldData['cases'].toString()),
                      cardSwip('assets/church.png', 'Deaths: ',
                          worldData['deaths'].toString()),
                      cardSwip('assets/healthcare-and-medical.png', 'Tests: ',
                          worldData['tests'].toString()),
                      cardSwip('assets/miscellaneous.png', 'Recovers: ',
                          worldData['recovered'].toString()),
                      cardSwip('assets/holding-hands.png', 'Affected countries: ',
                          worldData['affectedCountries'].toString()),
                    ],
                   
                    viewportFraction: 1.0,
                    scale: 0.9,
                    control: new SwiperControl(color: Colors.green),
                  ),

                ),
              
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    globalCard(
                        "Today Cases",
                        worldData['todayCases'].toString(),
                        context,
                        // Color(0xFF475c78),
                        Color.fromRGBO(69, 133, 108, 1)),
                    globalCard(
                        "Today Deaths",
                        worldData['todayDeaths'].toString(),
                        context,
                        // Color(0xFFff3f5e),
                        Color.fromRGBO(26, 103, 76, 1)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    globalCard(
                        "Recovered ",
                        worldData['recovered'].toString(),
                        context,
                        Color.fromRGBO(166, 52, 70, 1)),
                    globalCard("Deaths", worldData['deaths'].toString(), context,
                        Color.fromRGBO(193, 102, 117, 1),)
                  ],
                ),
  
              ],
            ),
          ),
        ],
      ));
}
