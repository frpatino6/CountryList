class Languages {
  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  Languages({
    this.iso6391,
    this.iso6392,
    this.name,
    this.nativeName,
  });

  factory Languages.fromJson(Map<String, dynamic> json) {
    return Languages(
      iso6391: json['iso639_1'] as String?,
      iso6392: json['iso639_2'] as String?,
      name: json['name'] as String?,
      nativeName: json['nativeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso639_1': iso6391,
      'iso639_2': iso6392,
      'name': name,
      'nativeName': nativeName,
    };
  }
}
