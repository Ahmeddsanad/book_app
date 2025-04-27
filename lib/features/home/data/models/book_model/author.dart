import 'dart:convert';

class Author {
  String name;
  int? birthYear;
  int? deathYear;

  Author({required this.name, this.birthYear, this.deathYear});

  // A factory constructor that creates an Author object from a Map.
  factory Author.fromMap(Map<String, dynamic> data) {
    return Author(
      name: data['name'] as String? ?? 'Unknown Author', // Default value for name
      birthYear: data['birth_year'] as int?,
      deathYear: data['death_year'] as int?,
    );
  }

  // A method that converts the Author object to a Map.
  Map<String, dynamic> toMap() => {'name': name, 'birth_year': birthYear, 'death_year': deathYear};

  // A factory constructor that creates an Author object from a JSON string.
  factory Author.fromJson(String data) {
    return Author.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  // A method that converts the Author object to a JSON string.
  String toJson() => json.encode(toMap());
}
