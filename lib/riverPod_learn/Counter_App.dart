import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final countDetail = StateProvider<int>((ref) {
  return 0;
});

class CountScreen extends ConsumerWidget {
  const CountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod", style: TextStyle(color: Colors.green)),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                var count = ref.watch(countDetail);
                return Text("Counting Values is : ${count}");
              },
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(countDetail.notifier).state++;
              },
              child: Icon(Icons.add, size: 35),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                ref.read(countDetail.notifier).state--;
              },
              child: Icon(Icons.remove, size: 35),
            ),
          ],
        ),
      ),
    );
  }
}
