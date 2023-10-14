class JKT48Member {
  String name, dateOfBirth, bloodGroup, profilePicture;
  int height, gen;

  JKT48Member({
    required this.name,
    required this.dateOfBirth,
    this.bloodGroup = "O",
    required this.height,
    required this.gen,
    required this.profilePicture,
  });
}