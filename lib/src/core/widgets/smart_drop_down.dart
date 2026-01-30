import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ButtonBuilder = Widget Function(
    BuildContext context, VoidCallback onTap, bool isOpen);
typedef MenuBuilder = Widget Function(
    BuildContext context, VoidCallback onTap, double? width);

class SmartDropdown extends StatefulWidget {
  final OverlayPortalController controller;
  final ButtonBuilder buttonBuilder;
  final MenuBuilder menuBuilder;
  final bool isStage;
  final int itemLength;
  final bool? isProf;
  final ScrollController? scrollController;

  const SmartDropdown(
      {super.key,
      required this.controller,
      required this.buttonBuilder,
      required this.menuBuilder,
      required this.isStage,
      required this.itemLength,
      this.scrollController,
      this.isProf});

  @override
  SmartDropdownState createState() => SmartDropdownState();
}

class SmartDropdownState extends State<SmartDropdown> {
  Size? buttonSize;
  Offset? buttonPosition;
  Offset? _tapPosition;
  bool _isButtonTapped = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getButtonSizeAndPosition();
    });
    widget.scrollController != null
        ? widget.scrollController!.addListener(_handleScroll)
        : '';
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController != null
        ? widget.scrollController!.removeListener(_handleScroll)
        : '';
    super.dispose();
  }

  void _handleScroll() {
    // Update position when scrolled
    _getButtonSizeAndPosition();
  }

  void _getButtonSizeAndPosition() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      buttonSize = renderBox.size;
      buttonPosition = renderBox.localToGlobal(Offset.zero);
    }
  }

  final LayerLink _layerLink = LayerLink();
  // double? _buttonWidth;
  final bool _isOpen = false;
  MenuPosition _menuPosition = MenuPosition.bottom;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: OverlayPortal(
        controller: widget.controller,
        overlayChildBuilder: (BuildContext context) {
          final screenHeight = MediaQuery.of(context).size.height;
          final availableSpaceBelow = screenHeight -
              (buttonPosition?.dy ?? 0) -
              (buttonSize?.height ?? 0);
          int itemsLength;
          widget.itemLength > 4
              ? itemsLength = 4
              : itemsLength = widget.itemLength;
          var dropdownHeight =
              widget.isStage ? 48.h * itemsLength : 52.h * itemsLength;
          widget.isProf != null && widget.isProf!
              ? dropdownHeight = 20.h
              : dropdownHeight;
          if (availableSpaceBelow < dropdownHeight) {
            _menuPosition = MenuPosition.top;
          } else {
            _menuPosition = MenuPosition.bottom;
          }

          return Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (TapDownDetails details) {
                  // Capture the tap position
                  _tapPosition = details.globalPosition;
                },
                onPanUpdate: (details) => _removeDropdown(),
                onTap: () {
                  _removeDropdown();
                  // Check if the tap is outside the button area before simulating
                  if (_tapPosition != null &&
                      !_isButtonTapped &&
                      !_isTapInsideButton(_tapPosition!)) {
                    // Simulate the tap after closing the dropdown
                    Future.delayed(const Duration(milliseconds: 100), () {
                      _simulateTap(_tapPosition!);
                    });
                  }
                },
                child: Container(color: Colors.transparent),
              ),
              Positioned.fill(
                child: CompositedTransformFollower(
                  link: _layerLink,
                  offset: _menuPosition == MenuPosition.bottom
                      ? Offset(
                          0,
                          (widget.isProf != null && widget.isProf!)
                              ? 54.h
                              : buttonSize!.height)
                      : Offset(0, -dropdownHeight),
                  showWhenUnlinked: false,
                  child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: widget.menuBuilder(
                          context, _toggleDropdown, buttonSize!.width)),
                ),
              ),
            ],
          );
        },
        child: widget.buttonBuilder(context, _toggleDropdown, _isOpen),
      ),
    );
  }

  void _toggleDropdown() {
    // _buttonWidth = context.size?.width;
    _getButtonSizeAndPosition();
    _isButtonTapped = true;
    widget.controller.toggle();

    // Reset the button tapped flag after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      _isButtonTapped = false;
    });

    // print(widget.controller.isShowing);
  }

  void _removeDropdown() {
    if (widget.controller.isShowing) {
      widget.controller.hide();
    }
  }

  // Simulate tap at the captured position
  void _simulateTap(Offset position) {
    // Dispatch a pointer down event
    final pointerDownEvent = PointerDownEvent(position: position);
    GestureBinding.instance.handlePointerEvent(pointerDownEvent);

    // Dispatch a pointer up event to simulate a full tap
    final pointerUpEvent = PointerUpEvent(position: position);
    GestureBinding.instance.handlePointerEvent(pointerUpEvent);

    // print("Simulated Tap at: $position");
  }

  // Check if the tap is inside the button area
  bool _isTapInsideButton(Offset tapPosition) {
    // print('is tap in?');
    if (buttonPosition == null || buttonSize == null) {
      // print('null');
      return false;
    }

    return tapPosition.dx >= buttonPosition!.dx &&
        tapPosition.dx <= buttonPosition!.dx + buttonSize!.width &&
        tapPosition.dy >= buttonPosition!.dy &&
        tapPosition.dy <= buttonPosition!.dy + buttonSize!.height;
  }
}

enum MenuPosition {
  top,
  bottom,
}


// typedef ButtonBuilder = Widget Function(
//     BuildContext context, VoidCallback onTap, bool isOpen);
// typedef MenuBuilder = Widget Function(
//     BuildContext context, VoidCallback onTap, double? width);

// class SmartDropdown extends StatefulWidget {
//   final OverlayPortalController controller;
//   final ButtonBuilder buttonBuilder;
//   final MenuBuilder menuBuilder;
//   final bool isStage;
//   final int itemLength;

//   const SmartDropdown({
//     super.key,
//     required this.controller,
//     required this.buttonBuilder,
//     required this.menuBuilder,
//     required this.isStage,
//     required this.itemLength,
//   });

//   @override
//   _SmartDropdownState createState() => _SmartDropdownState();
// }

// class _SmartDropdownState extends State<SmartDropdown> {
//   Size? buttonSize;
//   Offset? buttonPosition;
//   Offset? _tapPosition; // To store tap position for later simulation

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _getButtonSizeAndPosition();
//     });
//     super.initState();
//   }

//   void _getButtonSizeAndPosition() {
//     final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
//     if (renderBox != null) {
//       setState(() {
//         buttonSize = renderBox.size;
//         buttonPosition = renderBox.localToGlobal(Offset.zero);
//         print("Button Size: $buttonSize, Button Position: $buttonPosition");
//       });
//     }
//   }

//   final LayerLink _layerLink = LayerLink();
//   double? _buttonWidth;
//   bool _isOpen = false; // Mutable to track dropdown state
//   MenuPosition _menuPosition = MenuPosition.bottom;

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: OverlayPortal(
//         controller: widget.controller,
//         overlayChildBuilder: (BuildContext context) {
//           final screenHeight = MediaQuery.of(context).size.height;
//           final availableSpaceBelow = screenHeight -
//               (buttonPosition?.dy ?? 0) -
//               (buttonSize?.height ?? 0);
//           int itemsLength;
//           widget.itemLength > 4
//               ? itemsLength = 4
//               : itemsLength = widget.itemLength;
//           var dropdownHeight =
//               widget.isStage ? 48.h * itemsLength : 52.h * itemsLength;

//           if (availableSpaceBelow < dropdownHeight) {
//             _menuPosition = MenuPosition.top;
//           } else {
//             _menuPosition = MenuPosition.bottom;
//           }

//           return Stack(
//             children: [
//               GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTapDown: (TapDownDetails details) {
//                   // Capture the tap position
//                   _tapPosition = details.globalPosition;
//                 },
//                 onTap: () {
//                   _removeDropdown();
//                   Future.delayed(Duration(milliseconds: 100), () {
//                     _simulateTap(_tapPosition!);
//                   });
//                 },
//                 child: Container(
//                   color: Colors.transparent,
//                 ),
//               ),
//               Positioned.fill(
//                 child: CompositedTransformFollower(
//                   link: _layerLink,
//                   offset: _menuPosition == MenuPosition.bottom
//                       ? Offset(0, buttonSize!.height ?? 0)
//                       : Offset(0, -dropdownHeight),
//                   showWhenUnlinked: false,
//                   child: Align(
//                     alignment: AlignmentDirectional.topStart,
//                     child: widget.menuBuilder(
//                         context, _toggleDropdown, _buttonWidth),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//         child: widget.buttonBuilder(context, _toggleDropdown, _isOpen),
//       ),
//     );
//   }

//   void _toggleDropdown() {
//     _buttonWidth = context.size?.width;
//     widget.controller.toggle();
//     print(widget.controller.isShowing);
//   }

//   void _removeDropdown() {
//     if (widget.controller.isShowing) {
//       widget.controller.hide();
//     }
//   }

//   // Simulate tap at the captured position
//   void _simulateTap(Offset position) {
//     if (position != null) {
//       // Dispatch a pointer down event
//       final pointerDownEvent = PointerDownEvent(position: position);
//       GestureBinding.instance.handlePointerEvent(pointerDownEvent);

//       // Dispatch a pointer up event to simulate a full tap
//       final pointerUpEvent = PointerUpEvent(position: position);
//       GestureBinding.instance.handlePointerEvent(pointerUpEvent);

//       print("Simulated Tap at: $position");
//     }
//   }
// }

// enum MenuPosition {
//   top,
//   bottom,
// }

// typedef ButtonBuilder = Widget Function(
//     BuildContext context, VoidCallback onTap, bool isOpen);
// typedef MenuBuilder = Widget Function(
//     BuildContext context, VoidCallback onTap, double? width);

// class SmartDropdown extends StatefulWidget {
//   final OverlayPortalController controller;
//   final ButtonBuilder buttonBuilder;
//   final MenuBuilder menuBuilder;
//   final bool isStage;
//   final int itemLength;

//   const SmartDropdown({
//     super.key,
//     required this.controller,
//     required this.buttonBuilder,
//     required this.menuBuilder,
//     required this.isStage,
//     required this.itemLength,
//   });

//   @override
//   _SmartDropdownState createState() => _SmartDropdownState();
// }

// class _SmartDropdownState extends State<SmartDropdown> {
//   Size? buttonSize;
//   Offset? buttonPosition;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _getButtonSizeAndPosition();
//     });
//     super.initState();
//   }

//   void _getButtonSizeAndPosition() {
//     final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
//     if (renderBox != null) {
//       setState(() {
//         buttonSize = renderBox.size;
//         buttonPosition = renderBox.localToGlobal(Offset.zero);
//         print("Button Size: $buttonSize, Button Position: $buttonPosition");
//       });
//     }
//   }

//   final LayerLink _layerLink = LayerLink();
//   double? _buttonWidth;
//   bool _isOpen = false; // Made this mutable to track dropdown state
//   MenuPosition _menuPosition = MenuPosition.bottom;

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: OverlayPortal(
//         controller: widget.controller,
//         overlayChildBuilder: (BuildContext context) {
          
//           final screenHeight = MediaQuery.of(context).size.height;
//           final availableSpaceBelow = screenHeight -
//               (buttonPosition?.dy ?? 0) -
//               (buttonSize?.height ?? 0);
//           int itemsLength;
//           widget.itemLength > 4
//               ? itemsLength = 4
//               : itemsLength = widget.itemLength;
//           var dropdownHeight = widget.isStage
//               ? 48.h * itemsLength
//               : 52.h * itemsLength; 
          
//           if (availableSpaceBelow < dropdownHeight) {
//             _menuPosition = MenuPosition.top;
//           } else {
//             _menuPosition = MenuPosition.bottom;
//           }

//           return Stack(
//             children: [
//               GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTap: () {
                 
//                   _removeDropdown();
//                 },
//                 child: Container(
//                   color:
//                       Colors.transparent, 
//                 ),
//               ),
//               Positioned.fill(
//                 child: CompositedTransformFollower(
//                   link: _layerLink,
//                   offset: _menuPosition == MenuPosition.bottom
//                       ? Offset(0, buttonSize!.height ?? 0)
//                       : Offset(
//                           0,
//                           -dropdownHeight,
//                         ),
//                   showWhenUnlinked: false,
//                   child: Align(
//                     alignment: AlignmentDirectional.topStart,
//                     child: widget.menuBuilder(
//                         context, _toggleDropdown, _buttonWidth),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//         child: widget.buttonBuilder(context, _toggleDropdown, _isOpen),
//       ),
//     );
//   }

//   void _toggleDropdown() {
//     _buttonWidth = context.size?.width;
//     // setState(() {
//     //   _isOpen = !_isOpen; // Toggle the dropdown open state
//     // });
//     widget.controller.toggle();
//     print(widget.controller.isShowing);
//   }

//   void _removeDropdown() {
   
//     if (widget.controller.isShowing) {
//       // setState(() {
//       //   _isOpen = false;
//       // });
//       widget.controller.hide();
//     }
//   }
// }

// enum MenuPosition {
//   top,
//   bottom,
// }


// typedef ButtonBuilder = Widget Function(
//     BuildContext context, VoidCallback onTap, bool isOpen);
// typedef MenuBuilder = Widget Function(
//     BuildContext context, VoidCallback onTap, double? width);

// class SmartDropdown extends StatefulWidget {
//   final OverlayPortalController controller;
//   final ButtonBuilder buttonBuilder;
//   final MenuBuilder menuBuilder;
//   final bool isStage;
//   final int itemLength;

//   const SmartDropdown({
//     super.key,
//     required this.controller,
//     required this.buttonBuilder,
//     required this.menuBuilder,
//     required this.isStage,
//     required this.itemLength,
//   });

//   @override
//   _SmartDropdownState createState() => _SmartDropdownState();
// }

// class _SmartDropdownState extends State<SmartDropdown> {
//   Size? buttonSize;
//   Offset? buttonPosition;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _getButtonSizeAndPosition();
//     });
//     super.initState();
//   }

//   void _getButtonSizeAndPosition() {
//     final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
//     if (renderBox != null) {
//       setState(() {
//         buttonSize = renderBox.size;
//         buttonPosition = renderBox.localToGlobal(Offset.zero);
//         print("Button Size: $buttonSize, Button Position: $buttonPosition");
//       });
//     }
//   }

//   final LayerLink _layerLink = LayerLink();
//   double? _buttonWidth;
//   final bool _isOpen = false;
//   MenuPosition _menuPosition = MenuPosition.bottom;

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: OverlayPortal(
//         controller: widget.controller,
//         overlayChildBuilder: (BuildContext context) {
//           // Calculate available space above and below the button
//           final screenHeight = MediaQuery.of(context).size.height;
//           final availableSpaceBelow = screenHeight -
//               (buttonPosition?.dy ?? 0) -
//               (buttonSize?.height ?? 0);
//           int itemsLength;
//           widget.itemLength > 4
//               ? itemsLength = 4
//               : itemsLength = widget.itemLength;
//           var dropdownHeight = widget.isStage
//               ? 48.h * itemsLength
//               : 52.h * itemsLength; // Set your dropdown height here
//           // Decide whether to show dropdown upwards or downwards
//           if (availableSpaceBelow < dropdownHeight) {
//             _menuPosition = MenuPosition.top;
//           } else {
//             _menuPosition = MenuPosition.bottom;
//           }

//           return CompositedTransformFollower(
//             link: _layerLink,
//             offset: _menuPosition == MenuPosition.bottom
//                 ? Offset(0, buttonSize!.height ?? 0)
//                 : Offset(
//                     0,
//                     -dropdownHeight,
//                   ),
//             // (-buttonSize!.height* itemsLength)  +
//             //     (-10.h * itemsLength)),
//             showWhenUnlinked: false,
//             child: Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child:
//                     widget.menuBuilder(context, _toggleDropdown, _buttonWidth)),
//           );
//         },
//         child: widget.buttonBuilder(context, _toggleDropdown, _isOpen),
//       ),
//     );
//   }

//   void _toggleDropdown() {
//     _buttonWidth = context.size?.width;
//     // setState(() {
//     //   _isOpen = !_isOpen;
//     // });
//     widget.controller.toggle();
//     print(widget.controller.isShowing);
//   }
// }

// enum MenuPosition {
//   top,
//   bottom,
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// typedef ButtonBuilder = Widget Function(
//     BuildContext context, VoidCallback onTap, bool isOpen);
// typedef MenuBuilder = Widget Function(
//     BuildContext context, VoidCallback onTap, double? width);

// class SmartDropdown extends StatefulWidget {
//   final OverlayPortalController controller;
//   final ButtonBuilder buttonBuilder;
//   final MenuBuilder menuBuilder;
//   final bool isStage;
//   final int itemLength;

//   const SmartDropdown({
//     super.key,
//     required this.controller,
//     required this.buttonBuilder,
//     required this.menuBuilder,
//     required this.isStage,
//     required this.itemLength,
//   });

//   @override
//   _SmartDropdownState createState() => _SmartDropdownState();
// }

// class _SmartDropdownState extends State<SmartDropdown> {
//   Size? buttonSize;
//   Offset? buttonPosition;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _getButtonSizeAndPosition();
//     });
//     super.initState();
//   }

//   void _getButtonSizeAndPosition() {
//     final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
//     if (renderBox != null) {
//       setState(() {
//         buttonSize = renderBox.size;
//         buttonPosition = renderBox.localToGlobal(Offset.zero);
//         print("Button Size: $buttonSize, Button Position: $buttonPosition");
//       });
//     }
//   }

//   final LayerLink _layerLink = LayerLink();
//   double? _buttonWidth;
//   final bool _isOpen = false;
//   MenuPosition _menuPosition = MenuPosition.bottom;

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: OverlayPortal(
//         controller: widget.controller,
//         overlayChildBuilder: (BuildContext context) {
//           // Calculate available space above and below the button
//           final screenHeight = MediaQuery.of(context).size.height;
//           final availableSpaceBelow = screenHeight -
//               (buttonPosition?.dy ?? 0) -
//               (buttonSize?.height ?? 0);
//           var dropdownHeight = 
//               widget.isStage ? 300 : 200; // Set your dropdown height here
//           // Decide whether to show dropdown upwards or downwards
//           if (availableSpaceBelow < dropdownHeight) {
//             _menuPosition = MenuPosition.top;
//           } else {
//             _menuPosition = MenuPosition.bottom;
//           }
//           int itemsLength;
//           widget.itemLength > 4 ? itemsLength = 4 : itemsLength = widget.itemLength;
//           return CompositedTransformFollower(
//             link: _layerLink,
//             offset: _menuPosition == MenuPosition.bottom
//                 ? Offset(0, buttonSize!.height ?? 0)
//                 : Offset(
//                     0, -75.h * itemsLength + (10.h*(itemsLength*2)),),
//                     // (-buttonSize!.height* itemsLength)  +
//                     //     (-10.h * itemsLength)),
//             showWhenUnlinked: false,
//             child: Align(
//                 alignment: AlignmentDirectional.topStart,
//                 child:
//                     widget.menuBuilder(context, _toggleDropdown, _buttonWidth)),
//           );
//         },
//         child: widget.buttonBuilder(context, _toggleDropdown, _isOpen),
//       ),
//     );
//   }

//   void _toggleDropdown() {
//     _buttonWidth = context.size?.width;
//     // setState(() {
//     //   _isOpen = !_isOpen;
//     // });
//     widget.controller.toggle();
//     print(widget.controller.isShowing);
//   }
// }

// enum MenuPosition {
//   top,
//   bottom,
// }
