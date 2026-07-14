/// A row in the "Top Creators" table.
class Creator {
  const Creator({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.artworks,
    required this.rating,
  });

  final String id;
  final String username;
  final String avatarUrl;
  final int artworks;

  /// Normalised rating in the range `0.0 .. 1.0` (drives the progress bar).
  final double rating;
}
