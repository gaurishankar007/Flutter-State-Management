import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../states/reminder_state/reminder_state.dart';
import 'delete_reminder_dialog.dart';
import 'generic_dialog.dart';

class ReminderListViewWidget extends StatelessWidget {
  const ReminderListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) {
        return autorun((_) {
          final appState = context.read<ReminderState>();
          if (appState.message != null) {
            showGenericDialog(
              context,
              title: "New Reminder Added",
              description: appState.message,
            );
          }
        });
      },
      child: Observer(
        builder: (context) {
          final appState = context.read<ReminderState>();
          if (appState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: appState.sortedReminders.length,
            itemBuilder: (context, index) {
              final reminder = appState.sortedReminders[index];
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: reminder.isDone,
                onChanged: (value) {
                  context.read<ReminderState>().modify(
                        reminder,
                        isDone: value ?? false,
                      );
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(reminder.text),
                    IconButton(
                      onPressed: () async {
                        final shouldDeleteReminder =
                            await showDeleteReminderDialog(context);
                        if (context.mounted && shouldDeleteReminder == true) {
                          context.read<ReminderState>().delete(reminder);
                        }
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
