import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/reminder_state/reminder_state.dart';
import '../widgets/reminder_list_view_widget.dart';
import '../widgets/text_field_dialog.dart';

class MobxPage extends StatelessWidget {
  const MobxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ReminderState()..getReminders(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mobx'),
          actions: [
            Builder(builder: (builderContext) {
              return IconButton(
                onPressed: () async {
                  final reminderName = await showTextFieldDialog(
                    context,
                    title: "Add Reminder",
                    optionsBuilder: () => {
                      TextFieldDialogButtonType.cancel: "Cancel",
                      TextFieldDialogButtonType.confirm: "Confirm",
                    },
                  );
                  if (reminderName != null && builderContext.mounted) {
                    builderContext.read<ReminderState>().add(reminderName);
                  }
                },
                icon: const Icon(Icons.add_rounded),
              );
            }),
          ],
        ),
        body: const SafeArea(
          child: ReminderListViewWidget(),
        ),
      ),
    );
  }
}
