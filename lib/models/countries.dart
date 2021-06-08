import 'currencies.dart';
import 'languages.dart';
import 'regional_blocs.dart';
import 'translations.dart';

class Countries {
  String? name;
  List<String>? topLevelDomain;
  String? alpha2Code;
  String? alpha3Code;
  List<String>? callingCodes;
  String? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  int? population;
  List<double>? latlng;
  String? demonym;
  double? area;
  double? gini;
  List<String>? timezones;
  List<String>? borders;
  String? nativeName;
  String? numericCode;
  List<Currencies>? currencies;
  List<Languages>? languages;
  Translations? translations;
  String? flag;
  List<RegionalBlocs>? regionalBlocs;
  String? cioc;

  Countries({
    this.name,
    this.topLevelDomain,
    this.alpha2Code,
    this.alpha3Code,
    this.callingCodes,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.population,
    this.latlng,
    this.demonym,
    this.area,
    this.gini,
    this.timezones,
    this.borders,
    this.nativeName,
    this.numericCode,
    this.currencies,
    this.languages,
    this.translations,
    this.flag,
    this.regionalBlocs,
    this.cioc,
  });

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      name: json['name'] as String?,
      topLevelDomain: json['topLevelDomain'].cast<String>(),
      alpha2Code: json['alpha2Code'] as String?,
      alpha3Code: json['alpha3Code'] as String?,
      callingCodes: json['callingCodes'].cast<String>(),
      capital: json['capital'] as String?,
      altSpellings: json['altSpellings'].cast<String>(),
      region: json['region'] as String?,
      subregion: json['subregion'] as String?,
      population: json['population'] ?? 0,
      latlng: json['latlng'].cast<double>(),
      demonym: json['demonym'] as String?,
      area: json['area'] as double?,
      gini: json['gini'] as double?,
      timezones: json['timezones'].cast<String>(),
      borders: json['borders'].cast<String>(),
      nativeName: json['nativeName'] as String?,
      numericCode: json['numericCode'] as String?,
      currencies: (json['currencies'] as List<dynamic>?)
          ?.map((e) => Currencies.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
      translations: json['translations'] == null
          ? null
          : Translations.fromJson(json['translations'] as Map<String, dynamic>),
      flag: json['flag'] as String?,
      regionalBlocs: (json['regionalBlocs'] as List<dynamic>?)
          ?.map((e) => RegionalBlocs.fromJson(e as Map<String, dynamic>))
          .toList(),
      cioc: json['cioc'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'topLevelDomain': topLevelDomain,
      'alpha2Code': alpha2Code,
      'alpha3Code': alpha3Code,
      'callingCodes': callingCodes,
      'capital': capital,
      'altSpellings': altSpellings,
      'region': region,
      'subregion': subregion,
      'population': population,
      'latlng': latlng,
      'demonym': demonym,
      'area': area,
      'gini': gini,
      'timezones': timezones,
      'borders': borders,
      'nativeName': nativeName,
      'numericCode': numericCode,
      'currencies': currencies?.map((e) => e.toJson()).toList(),
      'languages': languages?.map((e) => e.toJson()).toList(),
      'translations': translations?.toJson(),
      'flag': flag,
      'regionalBlocs': regionalBlocs?.map((e) => e.toJson()).toList(),
      'cioc': cioc,
    };
  }
}
