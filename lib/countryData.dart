class CountryData {
  int id;
  String country;
  String continent;
  var cases;
  var todayCases;
  var deaths;
  var todayDeaths;
  var recovered;
  var active;
  var critical;
  var tests;
  CountryInfo countryInfo;

  CountryData(
      {this.id,
      this.country,
      this.continent,
      this.cases,
      this.todayCases,
      this.countryInfo,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.tests});

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
        id: json['id'],
        country: json['country'],
        continent: json['continent'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        active: json['active'],
        critical: json['critical'],
        tests: json['tests'],
        countryInfo: CountryInfo.fromJson(json['countryInfo']));
  }
}

class CountryInfo {
  String flag;

  CountryInfo({this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(flag: json["flag"] as String);
  }
}
