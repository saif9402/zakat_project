class MyUser {
  static const String collectionName = 'users';
  String id;
  String fName;
  String lName;
  String userName;
  String email;
  double total_zakat;

  MyUser(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.userName,
      required this.email,
      this.total_zakat = 0.0});

  MyUser.fomJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          fName: json['fName'] as String,
          lName: json['lName'] as String,
          userName: json['userName'] as String,
          email: json['email'] as String,
          total_zakat: json['total_zakat'] ?? 0,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fName': fName,
      'lName': lName,
      'userName': userName,
      'email': email,
      'total_zakat': total_zakat,
    };
  }
}
