class JKT48Member {
  String name, dateOfBirth, bloodGroup, profilePicture;
  int height;

  JKT48Member({
    required this.name,
    required this.dateOfBirth,
    this.bloodGroup = "O",
    required this.height,
    required this.profilePicture,
  });
}