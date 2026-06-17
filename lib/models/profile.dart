class Profile {
  const Profile({
    this.id = '',
    this.username = '',
    this.createdAt = '',
    this.birthday = '',
    this.dayOfPuberty = '',
    this.startDate = '',
  });

  final String id;
  final String username;
  final String createdAt;
  final String birthday;
  final String dayOfPuberty;
  final String startDate;

  Profile.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      username = map['username'],
      createdAt = map['created_at'],
      dayOfPuberty = map['day_of_puberty'],
      startDate = map['start_date'],
      birthday = map['birthday'];
}
