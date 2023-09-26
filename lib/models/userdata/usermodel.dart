class UserModel {
  late String uid;
  late String email;
  late String fullname;
  late String idno;
  late String phoneno;
  late String profileImage;
  late String dob;
  late String county;
  late String maritalstatus;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullname,
    required this.idno,
    required this.phoneno,
    required this.profileImage,
    required this.dob,
    required this.county,
    required this.maritalstatus
  });

//receive data from server
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        fullname: map['fullname'],
        idno: map['idno'],
        phoneno: map['phoneno'],
        profileImage: map['profileImage'],
        dob: map['dob'],
        county: map['county'],
        maritalstatus: map['maritalstatus']
        );
  }

  //send data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': fullname,
      'lastname': idno,
      'phoneno': phoneno,
      'profileimage': profileImage,
      'dob': dob,
      'county': county,
      'maritalstatus': maritalstatus
    };
  }
}
