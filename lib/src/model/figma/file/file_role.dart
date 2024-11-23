enum FigmaFileRole {
  owner;

  static FigmaFileRole fromString(String role) {
    switch (role) {
      case 'owner':
        return FigmaFileRole.owner;
      default:
        throw Exception('Unknown Figma file role: $role');
    }
  }
}
