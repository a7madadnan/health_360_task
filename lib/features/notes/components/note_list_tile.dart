import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_360_task/core/extentions/date_time_extension.dart';
import 'package:health_360_task/features/notes/models/note_model.dart';
import 'package:health_360_task/features/notes/providers/note_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';

class NoteListTile extends ConsumerWidget {
  const NoteListTile( {
    super.key,
    required this.note,
    required this.onDelete
  });
  final Note note;
  final VoidCallback onDelete;

  @override
  Widget build(
    BuildContext context,
    ref,
  ) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        extentRatio: 0.27,
        motion: const ScrollMotion(),
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.redAccent.withOpacity(0.7)),
            onPressed: onDelete,

            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                SolarIconsOutline.trashBin2,
                size: 40,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title ?? '',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  note.description ?? '',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  note.createdAt?.format() ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
