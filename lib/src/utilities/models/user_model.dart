import 'dart:convert';

class UserModle {
  int? id;
  String? name;
  String? photo;
  UserModle({
    this.id,
    this.name,
    this.photo,
  });

  UserModle copyWith({
    int? id,
    String? name,
    String? photo,
  }) {
    return UserModle(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
    };
  }

  factory UserModle.fromMap(Map<String, dynamic> map) {
    return UserModle(
      id: map['id']?.toInt(),
      name: map['name'],
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModle.fromJson(String source) => UserModle.fromMap(json.decode(source));

  @override
  String toString() => 'UserModle(id: $id, name: $name, photo: $photo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModle && other.id == id && other.name == name && other.photo == photo;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ photo.hashCode;
}
