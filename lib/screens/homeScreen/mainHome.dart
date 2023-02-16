import 'dart:math';
import 'package:flutter/material.dart';

/// --------------------------------------------------------------------------------------------------------------------////
/// This code is not my(highcoder) original work I copied it from some linkedin post of someone don't remember the name
/// if you created it Dm and i will give the credits to you
/// --------------------------------------------------------------------------------------------------------------------////

const _kRadarSize = 360.0;
const _kRadarBorderSize = 50.0;
const _kRadarInnerCircleSpacing = 80.0;
const _kRadarInnerCircleSpacingStart = 86.0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final List<Offset> heartPositions = [];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() => setState(() {}))
          ..repeat();

    var random = Random();
    int minVal = _kRadarInnerCircleSpacing.toInt() - _kRadarBorderSize.toInt();
    for (int i = 0; i < 2; i++) {
      final xPos = random.nextInt(_kRadarSize.toInt() -
              minVal -
              _kRadarInnerCircleSpacing.toInt() -
              _kRadarBorderSize.toInt()) +
          minVal;
      final yPos = random.nextInt(_kRadarSize.toInt() -
              minVal -
              _kRadarInnerCircleSpacing.toInt() -
              _kRadarBorderSize.toInt()) +
          minVal;
      heartPositions.add(Offset(xPos.toDouble(), yPos.toDouble()));
      print(heartPositions);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          // Radar Border Background (for creating pinkish shade)
                          Container(
                            height: _kRadarSize + _kRadarBorderSize,
                            width: _kRadarSize + _kRadarBorderSize,
                            decoration: const BoxDecoration(
                              color: Colors.pinkAccent,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 20.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(-2, 2),
                                ),
                              ],
                            ),
                          ),
                          // Radar Border
                          Container(
                            height: _kRadarSize + _kRadarBorderSize,
                            width: _kRadarSize + _kRadarBorderSize,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.9),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Radar Sweep Background
                                  Container(
                                    height: _kRadarSize,
                                    width: _kRadarSize,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  // Radar Sweep Horizontal Line
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Divider(
                                      height: _kRadarSize,
                                      color: Colors.grey.withOpacity(0.2),
                                      thickness: 1,
                                    ),
                                  ),
                                  // Radar Sweep Vertical Line
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: VerticalDivider(
                                      width: _kRadarSize,
                                      color: Colors.grey.withOpacity(0.2),
                                      thickness: 1,
                                    ),
                                  ),
                                  // Radar Inner Circles
                                  for (double i =
                                          _kRadarInnerCircleSpacingStart;
                                      i < _kRadarSize;
                                      i = i + _kRadarInnerCircleSpacing)
                                    Container(
                                      height: i,
                                      width: i,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.2),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  for (int i = 0;
                                      i < heartPositions.length;
                                      i++)
                                    Positioned(
                                      top: heartPositions[i].dx,
                                      left: heartPositions[i].dy,
                                      child: Icon(
                                        Icons.favorite_border_rounded,
                                        size: 40,
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                    ),
                                  // Radar Sweep
                                  Container(
                                    height: _kRadarSize,
                                    width: _kRadarSize,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Colors.pinkAccent.withOpacity(0.2),
                                        width: 2,
                                      ),
                                      shape: BoxShape.circle,
                                      gradient: SweepGradient(
                                        startAngle: 4,
                                        center: FractionalOffset.center,
                                        transform: GradientRotation(
                                          _animationController.value * 6.283,
                                        ),
                                        colors: <Color>[
                                          Colors.black,
                                          Colors.pinkAccent.shade200
                                              .withOpacity(0.4),
                                          Colors.pinkAccent.shade100,
                                        ],
                                        stops: const [0, 0.90, 1.0],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
