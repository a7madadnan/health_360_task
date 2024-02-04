import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health_360_task/core/shared_providers/shared_preferences_provider.dart';
import 'package:health_360_task/features/notes/components/note_list_tile.dart';
import 'package:health_360_task/features/notes/create/create_note_page.dart';
import 'package:health_360_task/features/notes/providers/note_provider.dart';
import 'package:health_360_task/features/notes/view/note_details_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';

class NotesHomePage extends ConsumerStatefulWidget {
  const NotesHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends ConsumerState<NotesHomePage> {
  @override
  Widget build(BuildContext context) {
    ref.read(noteSharefPreferenceProvider).load();
    final notes = ref.watch(notesProvider);
    return Scaffold(
      floatingActionButton: IconButton(
        icon: const Icon(
          SolarIconsBold.addSquare,
          size: 80,
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CreateNotePage(),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "myNotes".tr(),
        ),
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[200],
      body: notes.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoteDetailsPage(notes[index]))),
                child: NoteListTile(
                  note: notes[index],
                  onDelete: () {
                    ref
                        .read(notesProvider.notifier)
                        .deleteNote(note: notes[index]);
                    ref.invalidate(notesProvider);
                  },
                ),
              ),
              itemCount: notes.length,
            )
          : const Center(
              child: Text('no Notes yet'),
            ),
    );
  }
}
