class Team {
  final int id;
  final String name;
  final List<Member> members;

  Team({required this.id, required this.name, required this.members});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}

class Member {
  final int id;
  final String name;
  final String email;
  final bool isManager;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.isManager,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    isManager: json["is_manager"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "is_manager": isManager,
  };
}
