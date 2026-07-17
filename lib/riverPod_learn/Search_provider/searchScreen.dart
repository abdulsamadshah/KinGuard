import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinguard/riverPod_learn/Search_provider/search_provider.dart';

class Searchscreen extends ConsumerWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Search the Date")),
      body: Consumer(
        builder: (context, ref, child) {
          print("build");
          return Column(
            children: [
              TextField(
                enabled: search.isSearchOn,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).search(value);
                },
              ),

              SizedBox(height: 50),

              Text("Search Value is: ${search.searchValue}"),

              ElevatedButton(
                onPressed: () {
                  ref
                      .read(searchProvider.notifier)
                      .disableField(isValue: false);
                },
                child: Text("Disable"),
              ),

              ElevatedButton(
                onPressed: () {
                  ref.read(searchProvider.notifier).disableField(isValue: true);
                },
                child: Text("Enable"),
              ),
            ],
          );
        },
      ),
    );
  }
}
