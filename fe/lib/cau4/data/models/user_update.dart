class UserUpdate {
  final int id;
  final String name;
  final String email;
  final String username;
  final String phone;
  final String website;

  UserUpdate({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.website,
  });

  factory UserUpdate.fromJson(Map<String, dynamic> json) {
    return UserUpdate(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'phone': phone,
      'website': website,
    };
  }

  UserUpdate copyWith({
    int? id,
    String? name,
    String? email,
    String? username,
    String? phone,
    String? website,
  }) {
    return UserUpdate(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      website: website ?? this.website,
    );
  }
}
