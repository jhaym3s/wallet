class User {
  String name;
  String age;
  String location;

  User({
    required this.name,
    required this.age,
    required this.location,
  }
  );

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        location = json['location'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'location': location,
      };
}
