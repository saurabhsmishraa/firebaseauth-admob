class Team {
  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String full_name;
  final String name;

  Team({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.full_name,
    required this.name,
  });

  factory Team.fromMap(Map data) {
    return Team(
      id: data['id'],
      abbreviation: data['abbreviation'],
      city: data['city'],
      conference: data['conference'],
      division: data['division'],
      full_name: data['full_name'],
      name: data['name'],
    );
  }
}
