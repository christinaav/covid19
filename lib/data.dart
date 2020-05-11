import 'package:covid19/countryData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'cards.dart';

class Terza extends StatefulWidget {
  CountryData country;

  Terza({Key key, this.country}) : super(key: key);

  @override
  _Terza createState() => _Terza();
}

class _Terza extends State<Terza> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(26, 103, 76, 1),
            title: Text(''),
          ),
          preferredSize: Size.fromHeight(40.0)),
      body: bodyWidget(context),
    );
  }

  // -------------------------------------------------- body widget-----------------------------------------
  bodyWidget(BuildContext context) => Container(
      color: Color.fromRGBO(26, 103, 76, 1),
      child: Column(
        children: <Widget>[
          // --------------------------------------------------------primo container--------------------------------------------------
          Container(
              color: Color.fromRGBO(26, 103, 76, 1),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            widget.country.countryInfo.flag,
                            height: 45,
                            width: 45,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(widget.country.country.toUpperCase(),
                              style: TextStyle(
                                fontSize: 28,
                                color: Color.fromRGBO(245, 245, 249, 1),
                                fontWeight: FontWeight.w500,
                              )),
                        ]),
                    Text(widget.country.cases.toString(),
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(245, 245, 249, 1),
                        )),
                    Text(
                      widget.country.continent,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(245, 245, 249, 1),
                      ),
                    )
                  ])),
          SizedBox(height: 10.5),

          // -------------------------------------------------------secondo container---------------------------------------------
          Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height / 3.99),
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
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    colorCard(
                        "Today Cases",
                        widget.country.todayCases.toString(),
                        context,
                        // Color(0xFF475c78),
                        Color.fromRGBO(249, 171, 110, 1),
                        "assets/sick.png"),
                    colorCard(
                        "Today Deaths",
                        widget.country.todayDeaths.toString(),
                        context,
                        // Color(0xFFff3f5e),
                        Color.fromRGBO(247, 146, 86, 1),
                        "assets/patient.png"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    colorCard(
                        "Recovered ",
                        widget.country.recovered.toString(),
                        context,
                        Color.fromRGBO(166, 52, 70, 1),
                        "assets/girl.png"),
                    colorCard(
                        "Deaths",
                        widget.country.deaths.toString(),
                        context,
                        Color.fromRGBO(193, 102, 117, 1),
                        "assets/grave.png"),
                  ],
                ),
                SizedBox(
                  height: 205,
                  width: 400,
                  child: Swiper(
                    viewportFraction: 0.9,
                    scale: 0.5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 25.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            switchCard(
                                "Active Cases",
                                widget.country.active.toString(),
                                context,
                                Color.fromRGBO(69, 133, 108, 1)),
                            switchCard(
                                "Critical Cases",
                                widget.country.critical.toString(),
                                context,
                                Color.fromRGBO(119, 179, 157, 1)),
                            switchCard("Tests", widget.country.tests.toString(),
                                context, Color.fromRGBO(69, 133, 108, 1)),
                            switchCard(
                                "Cases perOneMillion",
                                widget.country.casesPerOneMillion.toString(),
                                context,
                                Color.fromRGBO(26, 103, 76, 1)),
                            switchCard(
                                "Deaths perOneMillion",
                                widget.country.deathsPerOneMillion.toString(),
                                context,
                                Color.fromRGBO(102, 164, 140, 1)),
                            switchCard(
                                "Tests perOneMillion",
                                widget.country.testsPerOneMillion.toString(),
                                context,
                                Color.fromRGBO(69, 133, 108, 1)),
                          ],
                        ),
                      );
                    },
                    itemCount: 5,
                    // pagination: new SwiperPagination(),
                    control: new SwiperControl(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
