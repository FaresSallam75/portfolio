import 'package:flutter/material.dart';
import 'package:portfolio/components/animated_counter.dart';
import 'package:portfolio/responsive.dart';

import '../../../constants.dart';
import 'heigh_light.dart';

class HighLightsInfo extends StatelessWidget {
  const HighLightsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child:
          Responsive.isMobileLarge(context)
              ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeighLight(
                        counter: AnimatedCounter(value: 20, text: "K+"),
                        label: "Subscribers",
                      ),
                      HeighLight(
                        counter: AnimatedCounter(value: 20, text: "+"),
                        label: "Videos",
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeighLight(
                        counter: AnimatedCounter(value: 20, text: "+"),
                        label: "GitHub Projects",
                      ),
                      HeighLight(
                        counter: AnimatedCounter(value: 5, text: "K+"),
                        label: "Stars",
                      ),
                    ],
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeighLight(
                    counter: AnimatedCounter(value: 20, text: "K+"),
                    label: "Subscribers",
                  ),
                  HeighLight(
                    counter: AnimatedCounter(value: 20, text: "+"),
                    label: "Videos",
                  ),
                  HeighLight(
                    counter: AnimatedCounter(value: 20, text: "+"),
                    label: "GitHub Projects",
                  ),
                  HeighLight(
                    counter: AnimatedCounter(value: 5, text: "K+"),
                    label: "Stars",
                  ),
                ],
              ),
    );
  }
}
