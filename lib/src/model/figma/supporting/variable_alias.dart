class FigmaVariableAlias {
  final String type;
  final String id;

  String get normalizedId => id.replaceFirst('VariableID:', '');

  const FigmaVariableAlias({
    required this.type,
    required this.id,
  });

  static FigmaVariableAlias fromJson(Map<String, dynamic> json) => FigmaVariableAlias(
        type: json['type'] as String,
        id: json['id'] as String,
      );
}
