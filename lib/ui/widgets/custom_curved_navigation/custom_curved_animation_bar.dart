import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

import 'custom_navigation_button.dart';

class CustomCurvedAnimationBar extends StatefulWidget {
  final List<Widget> items;
  final int index;
  final Color color;
  final Color? buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int>? onTap;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final bool isAnimatable;

  const CustomCurvedAnimationBar({
    Key? key,
    required this.items,
    this.index = 0,
    this.isAnimatable = true,
    this.color = AppColors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = AppColors.blue300,
    this.onTap,
    this.animationCurve = Curves.easeOutQuart,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = 115,
  })  : assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 115),
        super(key: key);

  @override
  CustomCurvedAnimationBarState createState() =>
      CustomCurvedAnimationBarState();
}

class CustomCurvedAnimationBarState extends State<CustomCurvedAnimationBar>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  int _endingIndex = 0;
  late double _pos;
  double _buttonHide = 0;
  late Widget _icon;
  late AnimationController _animationController;
  late int _length;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[widget.index];
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      if (widget.isAnimatable) {
        setState(() {
          _pos = _animationController.value;
          final endingPos = _endingIndex / widget.items.length ;
          final middle = (endingPos + _startingPos) / 2;
          if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
            _icon = widget.items[_endingIndex];
          }
          _buttonHide =
              (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
        });
      }
    });
  }

  @override
  void didUpdateWidget(CustomCurvedAnimationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: -50 - (70.0 - widget.height),
            left: Directionality.of(context) == TextDirection.rtl
                ? null
                : _pos * size.width,
            right: Directionality.of(context) == TextDirection.rtl
                ? _pos * size.width
                : null,
            width: size.width / _length,
            child: Center(
              child: Transform.translate(
                offset: Offset(
                  0,
                  -(1 - _buttonHide) * 80,
                ),
                child: Material(
                  color: widget.buttonBackgroundColor ?? widget.color,
                  type: MaterialType.circle,
                  child: _icon,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (80.0 - widget.height),
            child: SizedBox(
                height: 75,
                child: Row(
                    children: widget.items.map((item) {
                  return CustomNavigationButton(
                    onTap: _buttonTap,
                    position: _pos,
                    length: _length,
                    index: widget.items.indexOf(item),
                    child: Center(child: item),
                  );
                }).toList())),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    });
  }
}
