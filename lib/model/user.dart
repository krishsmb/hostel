class User {
  final String name;
  final String image;
  final String date;

  User(this.name, this.image, this.date);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'date' : date,
      };
}
