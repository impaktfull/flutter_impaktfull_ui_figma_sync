class ImpaktfullUiFigmaTextStyle {
  final String id;
  final String name;
  final String fontFamily;
  final int fontWeight;
  final double fontSize;

  const ImpaktfullUiFigmaTextStyle({
    required this.id,
    required this.name,
    required this.fontFamily,
    required this.fontWeight,
    required this.fontSize,
  });

  String get groupName {
    final parts = name.split('/');
    return parts.sublist(0, parts.length - 1).join('/');
  }

  String get styleName => name.split('/').last;
}
