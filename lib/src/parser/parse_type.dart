enum ParseType {
  colors(value: 'figma_sync/colors'),
  textStyles(value: 'figma_sync/textstyles');

  final String value;

  const ParseType({required this.value});
}
