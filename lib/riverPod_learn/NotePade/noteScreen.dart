import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinguard/riverPod_learn/NotePade/noteProvider.dart';

class noteScreen extends ConsumerWidget {
  const noteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Pad"),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.watch(noteProvider.notifier).addItem(name: "Hello Samad");
        },
        child: Icon(Icons.add),
      ),

      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(noteProvider);
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: provider.length,

            itemBuilder: (context, index) {
              final item = provider[index];

              return ListTile(
                title: Text(item.name),
                leading: Text(item.id),
                trailing: SizedBox(
                  height: 40,
                  width: 80,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          ref
                              .watch(noteProvider.notifier)
                              .deleteItem(id: item.id);
                        },
                        child: Icon(Icons.delete, color: Colors.red),
                      ),

                      InkWell(
                        onTap: () {
                          ref
                              .watch(noteProvider.notifier)
                              .updateItem(id: item.id, name: "Hell Updated");
                        },
                        child: Icon(Icons.update, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
