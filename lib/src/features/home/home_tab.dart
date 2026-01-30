import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../core/services/locator/locator.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/train_background.dart';

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../train/session/presentation/bloc/shoQ_data/sho_qdata_bloc.dart';

final shoQdataBloc = locator<ShoQdataBloc>();

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  void initState() {
    super.initState();
    // shoQdataBloc.add(const ShoQdataEvent.connect());
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'Home', hideBack: true),
        backgroundColor: Colors.transparent,
        // body: BlocProvider.value(
        //   value: shoQdataBloc,
        //   child: BlocListener<ShoQdataBloc, ShoQdataState>(
        //     listenWhen: (prev, curr) =>
        //         curr.maybeWhen(error: (_) => true, orElse: () => false),
        //     listener: (context, state) {
        //       state.maybeWhen(
        //         error: (msg) {
        //           showDialog(
        //             context: context,
        //             builder: (ctx) => AlertDialog(
        //               title: const Text("Connection issue"),
        //               content: Text(msg),
        //               actions: [
        //                 TextButton(
        //                   onPressed: () => Navigator.of(ctx).pop(),
        //                   child: const Text("OK"),
        //                 ),
        //                 TextButton(
        //                   onPressed: () {
        //                     Navigator.of(ctx).pop();
        //                     context.read<ShoQdataBloc>().add(const ShoQdataEvent.connect());
        //                   },
        //                   child: const Text("Retry"),
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //         orElse: () {},
        //       );
        //     },
        //     child: Column(
        //       children: [
        //         const SizedBox(height: 16),
        //         ElevatedButton(
        //           onPressed: () {
        //             final sessionData = {
        //                 "session_id": "PA_2025-08-02_19641",
        //                 "shooter": "DemoShooter01",
        //                 "total_shots": 8,
        //                 "shot_data": [
        //                   { "shot": 1, "score": 6, "split_time": 26.669, "direction": "W" },
        //                   { "shot": 2, "score": 0, "split_time": 42.413, "direction": "Miss" },
        //                   { "shot": 3, "score": 5, "split_time": 20.869, "direction": "W" },
        //                   { "shot": 4, "score": 7, "split_time": 18.475, "direction": "S" },
        //                   { "shot": 5, "score": 8, "split_time": 20.482, "direction": "SW" },
        //                   { "shot": 6, "score": 10, "split_time": 17.864, "direction": "S" },
        //                   { "shot": 7, "score": 6, "split_time": 19.382, "direction": "SW" },
        //                   { "shot": 8, "score": 7, "split_time": 37.498, "direction": "E" }
        //                 ]
        //               };
        //
        //             shoQdataBloc.add(ShoQdataEvent.sendData(sessionData));
        //           },
        //           child: const Text("Send Data"),
        //         ),
        //         const SizedBox(height: 12),
        //
        //         // Main content
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
        //             child: BlocBuilder<ShoQdataBloc, ShoQdataState>(
        //               builder: (context, state) {
        //                 return state.when(
        //                   initial: () => const AnalysisView(analysis: {}), // shimmer-only
        //                   connected: () => const AnalysisView(analysis: {}), // shimmer-only
        //                   loading: () => const AnalysisView(analysis: {}), // Instead of spinner
        //
        //                   success: (analysis) => AnalysisView(analysis: analysis),
        //                   error: (msg) => Center(child: Text("Error: $msg")),
        //                 );
        //               },
        //             ),
        //           ),
        //         ),
        //
        //         const SizedBox(height: 12),
        //       ],
        //     ),
        //   ),
        // ),
        body: Container(),
        // body: MovableRingOnImage(),
      ),
    );
  }
}


class AnalysisView extends StatelessWidget {
  final Map<String, dynamic> analysis;
  const AnalysisView({super.key, required this.analysis});

  String? _asString(String key) {
    final v = analysis[key];
    if (v == null) return null;
    return v is String ? v : v.toString();
  }

  @override
  Widget build(BuildContext context) {
    final shots = analysis["key_shot_analysis"];
    final List<dynamic>? shotList = (shots is List) ? shots : null;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldTile(label: "Rating", value: _asString("rating"), shimmerWidth: 80),
          FieldTile(
            label: "Consistency",
            value: analysis["shot_consistency"] != null
                ? "${analysis["shot_consistency"]}%"
                : null,
            shimmerWidth: 120,
          ),
          FieldTile(
            label: "Consistency Detail",
            value: _asString("shot_consistency_detail"),
            multiline: true,
          ),
          FieldTile(label: "Primary Focus", value: _asString("primary_focus"), shimmerWidth: 200),
          FieldTile(
            label: "Primary Focus Detail",
            value: _asString("primary_focus_detail"),
            multiline: true,
          ),
          FieldTile(label: "Key Insights", value: _asString("key_insights"), multiline: true),
          FieldTile(label: "Key Opportunity", value: _asString("key_opportunity"), multiline: true),
          FieldTile(label: "Next Drill", value: _asString("next_drill"), multiline: true),
          FieldTile(
            label: "Detailed Shot Analysis",
            value: _asString("detailed_shot_analysis"),
            multiline: true,
          ),

          const SizedBox(height: 10),
          Text("Key Shot Analysis", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),

          if (shotList != null)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: shotList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, i) {
                final m = shotList[i] as Map<String, dynamic>;
                final shot = m["shot"];
                final score = m["score"];
                final split = m["split_time"];
                final analysisText = m["analysis"];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shot $shot • Score $score • ${split}s"),
                      const SizedBox(height: 4),
                      Text(analysisText?.toString() ?? ""),
                    ],
                  ),
                );
              },
            )
          else
            shimmerList(items: 3),
        ],
      ),
    );
  }
}
class FieldTile extends StatelessWidget {
  final String label;
  final String? value;
  final bool multiline;
  final double shimmerWidth;

  const FieldTile({
    super.key,
    required this.label,
    required this.value,
    this.multiline = false,
    this.shimmerWidth = 240,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.bodyLarge),
          const SizedBox(height: 4),
          if (value != null && value!.isNotEmpty)
            Text(value!, style: theme.bodyMedium)
          else
            (multiline
                ? shimmerLines(lines: 3, width: shimmerWidth)
                : shimmerBox(width: shimmerWidth)),
        ],
      ),
    );
  }
}


Widget shimmerBox({
  double height = 16,
  double width = 160,
  double radius = 6,
}) {
  return Shimmer(
    duration: const Duration(seconds: 2),
    interval: const Duration(milliseconds: 0),
    color: Colors.grey[300]!,
    colorOpacity: 0.3,
    enabled: true,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}

Widget shimmerLines({int lines = 2, double width = 260}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(lines, (i) => Padding(
      padding: EdgeInsets.only(bottom: i == lines - 1 ? 0 : 6),
      child: shimmerBox(width: i == lines - 1 ? width * 0.6 : width),
    )),
  );
}

Widget shimmerList({int items = 3}) {
  return Column(
    children: List.generate(items, (i) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          shimmerBox(width: 50),
          const SizedBox(width: 12),
          Expanded(child: shimmerLines(lines: 2, width: 220)),
        ],
      ),
    )),
  );
}














class MovableRingOnImage extends StatefulWidget {
  const MovableRingOnImage({super.key});

  @override
  State<MovableRingOnImage> createState() => _MovableRingOnImageState();
}

class _MovableRingOnImageState extends State<MovableRingOnImage> {
  // --- Image canvas size (updated) ---
  static const double imageW = 800;
  static const double imageH = 600;

  // --- Ring visuals (small rings) ---
  static const double ringDiameter = 24;
  static const double ringBorder = 2;
  static const double ringRadius = ringDiameter / 2;

  // --- Trail recording knobs ---
  static const double trailSampleDistancePx = 2.0; // smaller -> more points
  static const int visitedQuantizePx = 2; // smaller -> more unique cells

  final List<_Ring> rings = [
    _Ring(initial: const Offset(100, 150)),
    _Ring(initial: const Offset(200, 250)),
  ];

  bool showTrail = true;
  int? draggingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Drag Red Rings"),
        actions: [
          IconButton(
            tooltip: showTrail ? "Hide trail" : "Show trail",
            onPressed: () => setState(() => showTrail = !showTrail),
            icon: Icon(showTrail ? Icons.route : Icons.route_outlined),
          ),
          IconButton(
            tooltip: "Copy JSON export",
            onPressed: _exportData,
            icon: const Icon(Icons.ios_share),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: imageW,
          height: imageH,
          child: Stack(
            children: [
              // Background image (replace with your asset path)
              Positioned.fill(
                child: Image.asset(
                  'assets/images/1.png',
                  width: imageW,
                  height: imageH,
                  fit: BoxFit.cover,
                ),
              ),

              // Optional: draw trails
              if (showTrail)
                Positioned.fill(
                  child: CustomPaint(
                    painter: _TrailPainter(rings: rings),
                  ),
                ),

              // Draggable rings
              ...rings.asMap().entries.map((entry) {
                final i = entry.key;
                final ring = entry.value;

                return Positioned(
                  left: ring.position.dx - ringRadius,
                  top: ring.position.dy - ringRadius,
                  child: GestureDetector(
                    onPanStart: (_) {
                      draggingIndex = i;
                      ring.record(ring.position,
                          sampleDistance: trailSampleDistancePx,
                          quantize: visitedQuantizePx);
                      setState(() {});
                    },
                    onPanUpdate: (details) {
                      final next = ring.position + details.delta;
                      final clamped = Offset(
                        next.dx.clamp(ringRadius, imageW - ringRadius),
                        next.dy.clamp(ringRadius, imageH - ringRadius),
                      );
                      ring.position = clamped;
                      ring.record(clamped,
                          sampleDistance: trailSampleDistancePx,
                          quantize: visitedQuantizePx);
                      setState(() {});
                    },
                    onPanEnd: (_) {
                      draggingIndex = null;
                      setState(() {});
                    },
                    child: Container(
                      width: ringDiameter,
                      height: ringDiameter,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.red, width: ringBorder),
                      ),
                    ),
                  ),
                );
              }),

              // HUD: live positions + path dimensions
              Positioned(
                left: 8,
                top: 8,
                child: _Hud(
                  imageW: imageW,
                  imageH: imageH,
                  rings: rings,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _exportData() async {
    final payload = {
      "image": {"width": imageW, "height": imageH},
      "rings": rings.asMap().entries.map((e) {
        final i = e.key;
        final r = e.value;
        final bbox = r.boundingBox;
        return {
          "id": i,
          "current": {
            "x": r.position.dx,
            "y": r.position.dy,
            "x_rel": r.position.dx / imageW,
            "y_rel": r.position.dy / imageH,
          },
          "trail_count": r.trail.length,
          "trail": r.trail.map((p) => {"x": p.dx, "y": p.dy}).toList(),
          "trail_rel": r.trail
              .map((p) => {"x": p.dx / imageW, "y": p.dy / imageH})
              .toList(),
          "visited_cells_count": r.visited.length,
          "visited_cells": r.visited
              .map((p) => {
                    "x": p.dx,
                    "y": p.dy,
                    "x_rel": p.dx / imageW,
                    "y_rel": p.dy / imageH
                  })
              .toList(),
          "path_bbox": {
            // bounding box of where the ring was dragged
            "x": bbox.left,
            "y": bbox.top,
            "w": bbox.width,
            "h": bbox.height,
          },
        };
      }).toList(),
    };

    final jsonStr = const JsonEncoder.withIndent('  ').convert(payload);
    debugPrint(jsonStr);
    await Clipboard.setData(ClipboardData(text: jsonStr));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Export copied to clipboard')),
      );
    }
  }
}

// ---------------- Models & Helpers ----------------

class _Ring {
  _Ring({required Offset initial}) : position = initial {
    record(initial, sampleDistance: 0, quantize: 1);
  }

  Offset position;
  final List<Offset> trail = [];
  final Set<_Cell> _visitedCells = {};

  Iterable<Offset> get visited =>
      _visitedCells.map((c) => Offset(c.x.toDouble(), c.y.toDouble()));

  void record(Offset p,
      {required double sampleDistance, required int quantize}) {
    if (trail.isEmpty ||
        (p - trail.last).distance >= max(0.0, sampleDistance)) {
      trail.add(p);
    }
    final qx = ((p.dx / quantize).round() * quantize).toInt();
    final qy = ((p.dy / quantize).round() * quantize).toInt();
    _visitedCells.add(_Cell(qx, qy));
  }

  /// Bounding box of the path covered (from trail). If no movement, box is a single point.
  Rect get boundingBox {
    if (trail.isEmpty) return Rect.fromLTWH(position.dx, position.dy, 0, 0);
    double minX = trail.first.dx, maxX = trail.first.dx;
    double minY = trail.first.dy, maxY = trail.first.dy;
    for (final p in trail) {
      if (p.dx < minX) minX = p.dx;
      if (p.dx > maxX) maxX = p.dx;
      if (p.dy < minY) minY = p.dy;
      if (p.dy > maxY) maxY = p.dy;
    }
    return Rect.fromLTRB(minX, minY, maxX, maxY);
  }
}

class _Cell {
  final int x, y;

  const _Cell(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is _Cell && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);
}

extension on Offset {
  double get distance => sqrt(dx * dx + dy * dy);
}

// ---------------- Painters & HUD ----------------

// class _TrailPainter extends CustomPainter {
//   _TrailPainter({required this.rings});
//   final List<_Ring> rings;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//
//     for (final ring in rings) {
//       // path line
//       if (ring.trail.length > 1) {
//         final path = Path()..moveTo(ring.trail.first.dx, ring.trail.first.dy);
//         for (int i = 1; i < ring.trail.length; i++) {
//           path.lineTo(ring.trail[i].dx, ring.trail[i].dy);
//         }
//         canvas.drawPath(path, paint);
//       }
//       // bounding box
//       final bbox = ring.boundingBox;
//       final rectPaint = Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 1;
//       canvas.drawRect(bbox, rectPaint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant _TrailPainter oldDelegate) =>
//       !identical(oldDelegate.rings, rings);
// }
class _TrailPainter extends CustomPainter {
  _TrailPainter({required this.rings});

  final List<_Ring> rings;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw bounding boxes only
    final rectPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black; // optional: change bbox color

    for (final ring in rings) {
      final bbox = ring.boundingBox;
      canvas.drawRect(bbox, rectPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _TrailPainter oldDelegate) =>
      !identical(oldDelegate.rings, rings);
}

class _Hud extends StatelessWidget {
  const _Hud({
    required this.imageW,
    required this.imageH,
    required this.rings,
  });

  final double imageW;
  final double imageH;
  final List<_Ring> rings;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxWidth: 360),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.55),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white, fontSize: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Image: ${imageW.toInt()} × ${imageH.toInt()}"),
            const SizedBox(height: 6),
            ...rings.asMap().entries.map((e) {
              final i = e.key;
              final r = e.value;
              final pos = r.position;
              final bbox = r.boundingBox;
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ring #$i"),
                    Text(
                        "  pos: x=${pos.dx.toStringAsFixed(1)}, y=${pos.dy.toStringAsFixed(1)}"
                        " | rel: (${(pos.dx / imageW).toStringAsFixed(3)}, ${(pos.dy / imageH).toStringAsFixed(3)})"),
                    Text(
                        "  trail points: ${r.trail.length} | visited cells: ${r.visited.length}"),
                    Text(
                        "  path bbox: x=${bbox.left.toStringAsFixed(1)}, y=${bbox.top.toStringAsFixed(1)}, "
                        "w=${bbox.width.toStringAsFixed(1)}, h=${bbox.height.toStringAsFixed(1)}"),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
