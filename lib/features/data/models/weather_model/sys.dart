class Sys {
  final String? pod;

  Sys({required this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json['pod'],
      );
}
