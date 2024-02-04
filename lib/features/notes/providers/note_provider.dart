import 'package:health_360_task/features/notes/models/note_model.dart';
import 'package:health_360_task/features/notes/providers/note_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  return NotesNotifier(ref: ref);
});
