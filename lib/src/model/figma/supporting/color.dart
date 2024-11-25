class FigmaColor {
  final double r;
  final double g;
  final double b;
  final double a;

  FigmaColor({
    required this.r,
    required this.g,
    required this.b,
    required this.a,
  });

  static FigmaColor fromJson(Map<String, dynamic> json) => FigmaColor(
        r: json['r'] as double,
        g: json['g'] as double,
        b: json['b'] as double,
        a: json['a'] as double,
      );

  static FigmaColor? fromJsonOptional(Map<String, dynamic>? json) {
    if (json == null) return null;
    return FigmaColor.fromJson(json);
  }

  String toHex() => '#${toHexWithoutHash()}';

  String toHexWithoutHash() {
    final rHex = (r * 255).round().toRadixString(16).padLeft(2, '0');
    final gHex = (g * 255).round().toRadixString(16).padLeft(2, '0');
    final bHex = (b * 255).round().toRadixString(16).padLeft(2, '0');
    final aHex = (a * 255).round().toRadixString(16).padLeft(2, '0');
    return '$aHex$rHex$gHex$bHex';
  }
}
