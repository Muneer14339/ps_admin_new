// import 'dart:typed_data';
// import 'package:opencv_dart/opencv_dart.dart' as cv;
//
// class DetectedEllipse {
//   final cv.Point2f center;
//   final double angleDeg;       // rotation (deg)
//   final double major;          // diameter along major axis (px)
//   final double minor;          // diameter along minor axis (px)
//   DetectedEllipse(this.center, this.angleDeg, this.major, this.minor);
// }
//
// class EllipseDetectionResult {
//   final Uint8List annotatedPng;
//   final List<DetectedEllipse> ellipses;
//   EllipseDetectionResult(this.annotatedPng, this.ellipses);
// }
//
// /// Detect red concentric ellipses/circles.
// /// imageBytes: JPEG/PNG bytes (e.g., from ImagePicker or assets).
// Future<EllipseDetectionResult> detectRedEllipses(Uint8List imageBytes, {
//   int maxSide = 1600,           // keep detail for thin rings
//   // HSV red thresholds (two lobes in OpenCV HSV)
//   List<int> low1 = const [0, 120, 80],
//   List<int> high1 = const [10, 255, 255],
//   List<int> low2 = const [170, 120, 80],
//   List<int> high2 = const [180, 255, 255],
//   int blurK = 3,                // small blur to reduce speckle
//   int closeK = 3,               // morphological close kernel (odd)
//   double minArea = 200.0,       // tune to your image scale
//   double minPerimeter = 100.0,
//   double minAxis = 8.0,
//   double ratioMin = 0.85,       // near-circle rings
//   double ratioMax = 1.05,
// }) async {
//   final lower1 = cv.Mat.fromList(1, 1, cv.MatType.CV_8UC3, low1);
//   final upper1 = cv.Mat.fromList(1, 1, cv.MatType.CV_8UC3, high1);
//   final lower2 = cv.Mat.fromList(1, 1, cv.MatType.CV_8UC3, low2);
//   final upper2 = cv.Mat.fromList(1, 1, cv.MatType.CV_8UC3, high2);
//
//   // 1) Decode & optional downscale
//   cv.Mat bgr = cv.imdecode(imageBytes, cv.IMREAD_COLOR);
//   final int h = bgr.rows, w = bgr.cols;
//   final int maxWH = w > h ? w : h;
//   if (maxWH > maxSide) {
//     final double s = maxSide / maxWH;
//     bgr = cv.resize(bgr, ((w * s).round(), (h * s).round()), interpolation: cv.INTER_AREA);
//   }
//
//   // 2) HSV red segmentation
//   final hsv = cv.cvtColor(bgr, cv.COLOR_BGR2HSV);
//   final mask1 = cv.inRange(hsv, lower1, upper1);
//   final mask2 = cv.inRange(hsv, lower2, upper2);
//   final mask = cv.bitwiseOR(mask1, mask2);
//
//   // 3) Clean mask (slight blur + close to join broken arcs)
//   final mBlur = cv.gaussianBlur(mask, (blurK, blurK), 0);
//   final kernel = cv.getStructuringElement(cv.MORPH_ELLIPSE, (closeK, closeK));
//   final mClosed = cv.morphologyEx(mBlur, cv.MORPH_CLOSE, kernel);
//
//   // 4) Edges → contours
//   final edges = cv.canny(mClosed, 40, 120);
//   // final contours = cv.findContours(edges, cv.RETR_LIST, cv.CHAIN_APPROX_NONE);
//   final (contours, _) = cv.findContours(edges, cv.RETR_LIST, cv.CHAIN_APPROX_NONE);
//
//   // 5) Fit ellipses & filter
//   final ellipses = <DetectedEllipse>[];
//   for (final c in contours) {
//     final double area = cv.contourArea(c);
//     if (area < minArea) continue;
//
//     final double peri = cv.arcLength(c, true);
//     if (peri < minPerimeter) continue;
//
//     if (c.length < 5) continue; // fitEllipse needs ≥5 points
//
//     final cv.RotatedRect r = cv.fitEllipse(c);
//     // r.size.width/height are diameters
//     double major = r.size.width >= r.size.height ? r.size.width : r.size.height;
//     double minor = r.size.width >= r.size.height ? r.size.height : r.size.width;
//
//     if (minor < minAxis) continue;
//
//     final double ratio = minor / (major + 1e-6);
//     if (ratio < ratioMin || ratio > ratioMax) continue;
//
//     // (Optional) sanity: contour area vs ellipse area
//     final double ellipseArea = 0.25 * 3.141592653589793 * major * minor;
//     final double fill = area / (ellipseArea + 1e-6);
//     if (fill < 0.25 || fill > 1.35) continue;
//
//     ellipses.add(DetectedEllipse(r.center, r.angle, major, minor));
//
//     // Draw the ellipse on the image for visualization
//     // opencv_dart ellipse overload: use rotated-rect variant when available.
//     final center = cv.Point(r.center.x.round(), r.center.y.round());               // ints
//     final axes   = cv.Point((r.size.width / 2).round(), (r.size.height / 2).round()); // radii
//
//     bgr = cv.ellipse(
//       bgr,
//       center,
//       axes,
//       r.angle,        // degrees
//       0,
//       360,
//       cv.Scalar(0, 255, 0),
//       thickness: 2,
//       lineType: cv.LINE_AA,
//     );
//   }
//
//   // 6) Sort by size (largest outer ring first)
//   ellipses.sort((a, b) => b.major.compareTo(a.major));
//
//   final annotated = cv.imencode('.png', bgr);
//   final (ok, buf) = cv.imencode('.png', bgr);
//   if (!ok) {
//     throw Exception("Failed to encode PNG");
//   }
//   return EllipseDetectionResult(buf, ellipses);}
