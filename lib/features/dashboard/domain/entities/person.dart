/// A colleague featured in the Birthday / Anniversary cards.
class Person {
  const Person({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });

  final String id;
  final String name;
  final String avatarUrl;
}

/// A named collection of people, e.g. today's birthdays or anniversaries.
class CelebrationGroup {
  const CelebrationGroup({
    required this.title,
    required this.people,
  });

  final String title;
  final List<Person> people;

  int get total => people.length;
}
