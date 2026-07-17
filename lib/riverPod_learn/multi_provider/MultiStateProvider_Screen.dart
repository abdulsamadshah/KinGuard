import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinguard/riverPod_learn/multi_provider/slider_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Slider")),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              print("build eye");
              final slider = ref.watch(
                sliderProvider.select((state) => state.showPassword),
              );
              return InkWell(
                onTap: () {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    showPassword: !slider,
                  );
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: slider
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.image),
                ),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(
                sliderProvider.select((state) => state.slider),
              );
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(slider),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(
                sliderProvider.select((state) => state.slider),
              );
              return Slider(
                value: slider,
                onChanged: (value) {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    slider: value,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
