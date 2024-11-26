import 'package:powersync/sqlite3_common.dart' as sqlite;
import '../powersync.dart';

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

  factory Profile.fromRow(sqlite.Row row) {
    return Profile(
      id: row['id'],
      username: row['username'],
      createdAt: row['created_at'],
      birthday: row['birthday'],
      dayOfPuberty: row['day_of_puberty'],
      startDate: row['start_date'],
    );
  }

  static Future<Profile> findProfileById(String id) async {
    final result = await db.get('SELECT * FROM profiles where id = ?', [id]);
    return Profile.fromRow(result);
  }
}
