import 'package:powersync/sqlite3_common.dart' as sqlite;
import '../powersync.dart';

class Profile {
  const Profile({
    this.id = '',
    this.username = '',
    this.createdAt = '',
  });

  /// User ID of the profile
  final String id;

  /// Username of the profile
  final String username;

  /// Date and time when the profile was created
  final String createdAt;

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        createdAt = map['created_at'];

  factory Profile.fromRow(sqlite.Row row) {
    return Profile(
      id: row['id'],
      username: row['username'],
      createdAt: row['created_at'],
    );
  }

  static Future<Profile> findProfileById(String id) async {
    final result = await db.get('SELECT * FROM profiles where id = ?', [id]);
    return Profile.fromRow(result);
  }
}
