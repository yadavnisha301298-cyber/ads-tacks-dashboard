/// A single entry in the "All Projects" list.
class Project {
  const Project({
    required this.id,
    required this.title,
    required this.projectNumber,
    required this.subtitle,
    required this.thumbnailUrl,
    this.isFeatured = false,
  });

  final String id;
  final String title;
  final String projectNumber;
  final String subtitle;
  final String thumbnailUrl;

  /// The featured project is rendered with the red highlight in the design.
  final bool isFeatured;
}
