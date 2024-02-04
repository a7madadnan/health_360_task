import 'package:health_360_task/core/local_storage/constants/shared_Preferences_keys.dart';
import 'package:health_360_task/features/notes/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotePreference {
  // shared pref instance
  static SharedPreferences? _prefs;

  Future<SharedPreferences> load() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> setData(List<Note> value) async {
    await _prefs?.setStringList(
        PreferencesKeys.note, value.map((e) => e.encode()).toList());
  }

  List<Note>? getData() {
    final value = _prefs?.getStringList(PreferencesKeys.note);
    return value?.map((e) => Note.decode(e)).toList();
  }

  Future<bool> remove(String key) async {
    await _prefs?.remove(key);
    return true;
  }

  Future<bool> clear() async {
    await _prefs?.clear();
    return true;
  }
}
