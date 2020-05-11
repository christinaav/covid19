class GlobalData {
  var cases;
  var todayCases;
  var deaths;
  var todayDeaths;
  var recovered;
  var active;
  var critical;
  var tests;
  var affectedCountries;

  GlobalData(
      {this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.tests,
      this.affectedCountries});

  factory GlobalData.fromJson(Map<String, dynamic> json) {
    return GlobalData(
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        active: json['active'],
        critical: json['critical'],
        tests: json['tests'],
        affectedCountries: json['affectedCountries']);
  }
}
