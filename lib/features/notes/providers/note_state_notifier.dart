import 'package:health_360_task/core/shared_providers/shared_preferences_provider.dart';
import 'package:health_360_task/features/notes/models/note_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier({required this.ref})
      : super(
          [],
        ) {
    setNotes();
  }
  final Ref ref;

  void setNotes() async {
    List<Note>? notes = ref.read(noteSharefPreferenceProvider).getData();
    if (notes != null) {
      state = notes;
    }
  }

  void editNote({required Note note}) {
    final updatedNote =
        state.firstWhere((element) => element.id == note.id).copyWith(
              title: note.title,
              description: note.description,
            );

    state = [
      for (int i = 0; i < state.length; i++)
        if (state[i].id == note.id) updatedNote else state[i]
    ];

    ref.read(noteSharefPreferenceProvider).setData(state);
  }

  void addNote({required Note note}) {
    state.add(note);

    ref.read(noteSharefPreferenceProvider).setData(state);
  }

  void deleteNote({required Note note}) {
    state.remove(note);
    ref.read(noteSharefPreferenceProvider).setData(state);
  }
}
