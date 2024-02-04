import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:health_360_task/components/custom_text_field.dart';
import 'package:health_360_task/features/notes/models/note_model.dart';
import 'package:health_360_task/features/notes/providers/note_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';

class NoteDetailsPage extends StatefulHookConsumerWidget {
  const NoteDetailsPage(this.note, {super.key});
  final Note note;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends ConsumerState<NoteDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    titleController.text = widget.note.title ?? '';
    final descriptionController = useTextEditingController();
    descriptionController.text = widget.note.description ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "addNote".tr(),
        ),
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[200],
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                controller: titleController,
                label: "title".tr(),
              ),
              CustomTextFormField(
                controller: descriptionController,
                label: "description".tr(),
                maxLength: 80,
                validator: (value) {
                  return value!.isEmpty ? "pleaseFillThisForm".tr() : null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  final Note note = widget.note.copyWith(
                      title: titleController.text,
                      description: descriptionController.text,
                      createdAt: DateTime.now());
                  ref.read(notesProvider.notifier).editNote(note: note);
                  ref.read(notesProvider.notifier).setNotes();
                  Navigator.pop(context);
                },
                icon: const Icon(SolarIconsBold.documentAdd),
                label: Text(
                  "editNote".tr(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
