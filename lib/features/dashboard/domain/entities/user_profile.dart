/// The signed-in user shown in the sidebar profile card and top-bar avatar.
class UserProfile {
  const UserProfile({
    required this.name,
    required this.role,
    required this.avatarUrl,
  });

  final String name;
  final String role;
  final String avatarUrl;
}
