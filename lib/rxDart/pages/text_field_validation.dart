import 'package:flutter/material.dart';

import '../rxBloc/textForm/text_field_bloc.dart';
import '../widgets/async_snapshot_builder.dart';

class TextFieldValidationPage extends StatefulWidget {
  const TextFieldValidationPage({super.key});

  @override
  State<TextFieldValidationPage> createState() => _TextFieldValidationPageState();
}

class _TextFieldValidationPageState extends State<TextFieldValidationPage> {
  late final TextFieldBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = TextFieldBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validate Text Field with RxDart')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: bloc.setFirstName.add,
              decoration: const InputDecoration(
                hintText: 'Enter first name here...',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: bloc.setLastName.add,
              decoration: const InputDecoration(
                hintText: 'Enter last name here...',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            AsyncSnapshotBuilder<String>(
              stream: bloc.fullName,
              onActive: (context, String? value) {
                return Text(value ?? '');
              },
            )
          ],
        ),
      ),
    );
  }
}
