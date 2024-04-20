import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../all_providers.dart';
import '../notifier/person_change_notifier.dart';

class PersonChangeNotifierProviderPage extends ConsumerWidget {
  PersonChangeNotifierProviderPage({super.key});

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Notifier Provider")),
      body: SafeArea(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                // Whenever the length of the persons is changed, then only it will be rebuilt
                final personLength = ref.watch(personChangeNotifierProvider
                    .select((personChangeNotifier) => personChangeNotifier.persons.length));
                log("Person length: $personLength");

                return Text("Total Persons: $personLength");
              },
            ),
            const SizedBox(height: 30),
            Consumer(
              builder: (context, ref, child) {
                final personNotifier = ref.watch(personChangeNotifierProvider);
                log("Persons");

                return Expanded(
                  child: ListView.separated(
                    itemCount: personNotifier.count,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final person = personNotifier.persons[index];

                      return ListTile(
                        onTap: () async {
                          final updatedPerson = await createOrUpdatePerson(context, person);
                          if (updatedPerson != null) personNotifier.update(updatedPerson);
                        },
                        title: Text(person.displayData),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final person = await createOrUpdatePerson(context);
          if (person != null) {
            final personNotifier = ref.watch(personChangeNotifierProvider);
            personNotifier.addPerson(person);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  createOrUpdatePerson(BuildContext context, [Person? existingPerson]) {
    nameController.text = existingPerson?.name ?? "";
    ageController.text = existingPerson?.age ?? "";

    return showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text("Create a person"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Enter namer here.."),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  label: Text("Enter age here.."),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isEmpty || ageController.text.isEmpty) {
                  return Navigator.pop(context);
                }

                late final Person newPerson;

                if (existingPerson != null) {
                  newPerson = existingPerson.update(
                    nameController.text,
                    ageController.text,
                  );
                } else {
                  newPerson = Person(name: nameController.text, age: ageController.text);
                }

                Navigator.pop(context, newPerson);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
