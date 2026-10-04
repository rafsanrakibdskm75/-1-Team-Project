class UserModel {
  final String? id;
  final String? email;
  final String? displayName;
  final String? profileUrl;
  final bool? isOnline;
  final DateTime? lastSeen;
  final DateTime? createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    this.profileUrl = "",
    this.isOnline = false,
    required this.lastSeen,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'profileUrl': profileUrl,
      'isOnline': isOnline,
      'lastSeen': lastSeen?.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      displayName: map['displayName'],
      profileUrl: map['profileUrl'] ?? "",
      isOnline: map['isOnline'] ?? false,
      lastSeen: map['lastSeen'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastSeen'])
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? profileUrl,
    bool? isOnline,
    DateTime? lastSeen,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      profileUrl: profileUrl ?? this.profileUrl,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
      createdAt: createdAt ?? this.createdAt,
    );
  }

}