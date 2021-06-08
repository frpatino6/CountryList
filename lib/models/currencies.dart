class Currencies {
  String? code;
  String? name;
  String? symbol;

  Currencies({
    this.code,
    this.name,
    this.symbol,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) {
    return Currencies(
      code: json['code'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'symbol': symbol,
    };
  }
}
