class RegionalBlocs {
  String? acronym;
  String? name;
  List<dynamic>? otherAcronyms;
  List<String>? otherNames;

  RegionalBlocs({
    this.acronym,
    this.name,
    this.otherAcronyms,
    this.otherNames,
  });

  factory RegionalBlocs.fromJson(Map<String, dynamic> json) {
    return RegionalBlocs(
      acronym: json['acronym'] as String?,
      name: json['name'] as String?,
      otherAcronyms: json['otherAcronyms'] as List<dynamic>?,
      otherNames: json['otherNames'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'acronym': acronym,
      'name': name,
      'otherAcronyms': otherAcronyms,
      'otherNames': otherNames,
    };
  }
}
