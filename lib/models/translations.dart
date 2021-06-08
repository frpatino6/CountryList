class Translations {
  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? br;
  String? pt;
  String? nl;
  String? hr;
  String? fa;

  Translations({
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.br,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
  });

  factory Translations.fromJson(Map<String, dynamic> json) {
    return Translations(
      de: json['de'] as String?,
      es: json['es'] as String?,
      fr: json['fr'] as String?,
      ja: json['ja'] as String?,
      it: json['it'] as String?,
      br: json['br'] as String?,
      pt: json['pt'] as String?,
      nl: json['nl'] as String?,
      hr: json['hr'] as String?,
      fa: json['fa'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'de': de,
      'es': es,
      'fr': fr,
      'ja': ja,
      'it': it,
      'br': br,
      'pt': pt,
      'nl': nl,
      'hr': hr,
      'fa': fa,
    };
  }
}
