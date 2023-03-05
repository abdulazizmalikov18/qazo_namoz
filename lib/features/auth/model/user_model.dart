class UserModel {
  String brtday;
  String firstNamaz;
  String extilam;
  String createdAt;
  String phoneNumber;
  String uid;

  UserModel({
    required this.brtday,
    required this.firstNamaz,
    required this.extilam,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      brtday: map['brtday'] ?? '',
      firstNamaz: map['firstNamaz'] ?? '',
      extilam: map['extilam'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "brtday": brtday,
      "firstNamaz": firstNamaz,
      "uid": uid,
      "extilam": extilam,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
    };
  }
}
