class Rain {
  final double? d3h;

  Rain({required this.d3h});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        d3h: json['3h'].toDouble(),
      );
}
