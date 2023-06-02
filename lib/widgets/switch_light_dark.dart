import 'package:flutter/material.dart';
import 'package:switch_light_dark/widgets/star_clipper.dart';

class SwitchLightDark extends StatefulWidget {
  final double width;
  final double height;
  final Function(bool value) onChanged;
  const SwitchLightDark({
    super.key,
    this.width = 240,
    this.height = 100,
    required this.onChanged,
  });

  @override
  State<SwitchLightDark> createState() => _SwitchLightDarkState();
}

class _SwitchLightDarkState extends State<SwitchLightDark> {
  final Duration _duration = const Duration(milliseconds: 300);
  bool _isNightMode = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isNightMode = !_isNightMode;
        });
        widget.onChanged(_isNightMode);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            widget.width / 2,
          ),
          boxShadow: _renderBoxShadow(),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            widget.width / 2,
          ),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: _isNightMode
                  ? const Color(0xFF202230)
                  : const Color(0xFF509AE0),
            ),
            child: Stack(
              children: [
                _renderCloud(
                  color: const Color(0xffAED0F1),
                  paddingBottom: 0,
                ),
                _renderCloud(
                  color: Colors.white,
                  paddingBottom: widget.height * 0.15,
                ),
                _renderCircleShadow(),
                _renderStar(),
                _renderIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<BoxShadow> _renderBoxShadow() {
    return [
      const BoxShadow(
        color: Colors.black,
        blurRadius: 2,
        spreadRadius: 1,
      ),
      const BoxShadow(
        color: Colors.white,
        blurRadius: 5,
        spreadRadius: 4,
      )
    ];
  }

  Widget _renderCloud({
    required Color color,
    required double paddingBottom,
  }) {
    return Stack(
      children: [
        AnimatedPositioned(
          right: -((widget.width * 0.1) + paddingBottom),
          bottom: _isNightMode
              ? -(widget.width * 0.33)
              : (widget.height * 0.15) - paddingBottom,
          duration: _duration,
          child: Container(
            height: widget.width * 0.33,
            width: widget.width * 0.33,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        AnimatedPositioned(
          right: widget.width * 0.1 - paddingBottom,
          bottom: _isNightMode
              ? -((widget.width * 0.25) + paddingBottom)
              : 0 - paddingBottom,
          duration: _duration,
          child: Container(
            height: widget.width * 0.25,
            width: widget.width * 0.25,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        AnimatedPositioned(
          right: widget.width * 0.23 - paddingBottom,
          bottom: _isNightMode
              ? -((widget.height * 1.25) + paddingBottom)
              : -((widget.height * 0.45) + paddingBottom),
          duration: _duration,
          child: Container(
            height: widget.width * 0.33,
            width: widget.width * 0.33,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        AnimatedPositioned(
          left: 0,
          right: 0,
          bottom: _isNightMode
              ? -(widget.height * 0.55 + paddingBottom)
              : -(widget.height * 0.15 + paddingBottom),
          duration: _duration,
          child: Container(
            height: widget.width * 0.16,
            width: widget.width * 0.16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        AnimatedPositioned(
          left: -((widget.width * 0.27) + paddingBottom),
          right: 0,
          bottom: _isNightMode
              ? -((widget.height * 1.3) + paddingBottom)
              : -((widget.height * 0.5) + paddingBottom),
          duration: _duration,
          child: Container(
            height: widget.width * 0.33,
            width: widget.width * 0.33,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        AnimatedPositioned(
          left: -25,
          bottom: _isNightMode
              ? -((widget.height * 2.05) + paddingBottom)
              : -((widget.height * 0.85) + paddingBottom),
          duration: _duration,
          child: Container(
            height: widget.width * 0.5,
            width: widget.width * 0.5,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderCircleShadow() {
    Color colorShadow = Colors.white.withOpacity(0.1);
    return Stack(
      children: [
        AnimatedPositioned(
          left: _isNightMode ? 0 : -(widget.width * 0.33),
          bottom: -(widget.width * 0.33),
          top: -(widget.width * 0.33),
          duration: _duration,
          child: Container(
            height: widget.width * 1.33,
            width: widget.width * 1.33,
            decoration: BoxDecoration(
              color: colorShadow,
              shape: BoxShape.circle,
            ),
          ),
        ),
        AnimatedPositioned(
          left: _isNightMode ? (widget.width * 0.25) : -(widget.width * 0.25),
          bottom: -(widget.width * 0.25),
          top: -(widget.width * 0.25),
          duration: _duration,
          child: Container(
            height: widget.width,
            width: widget.width,
            decoration: BoxDecoration(
              color: colorShadow,
              shape: BoxShape.circle,
            ),
          ),
        ),
        AnimatedPositioned(
          left: _isNightMode ? (widget.width * 0.5) : -(widget.width * 0.16),
          bottom: -(widget.width * 0.16),
          top: -(widget.width * 0.16),
          duration: _duration,
          child: Container(
            height: widget.width * 0.66,
            width: widget.width * 0.66,
            decoration: BoxDecoration(
              color: colorShadow,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderIndicator() {
    double padding = widget.height * 0.08;
    double diameter = widget.height - 2 * (padding);

    return AnimatedPositioned(
      left: _isNightMode ? widget.width - diameter - padding : padding,
      top: 0,
      bottom: 0,
      duration: _duration,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: _isNightMode
              ? const Color(
                  0xffCBCFD5,
                )
              : const Color(
                  0xffEFCD55,
                ),
          shape: BoxShape.circle,
          boxShadow: _renderBoxShadow(),
        ),
        child: _isNightMode
            ? Stack(
                children: [
                  Positioned(
                    left: diameter * 0.1,
                    top: diameter * 0.2,
                    bottom: 0,
                    child: Container(
                      height: diameter * 0.42,
                      width: diameter * 0.42,
                      decoration: const BoxDecoration(
                        color: Color(0xffA2A6B8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    right: diameter * 0.12,
                    top: diameter * 0.38,
                    child: Container(
                      height: diameter * 0.21,
                      width: diameter * 0.21,
                      decoration: const BoxDecoration(
                        color: Color(0xffA2A6B8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: diameter * 0.19,
                    child: Container(
                      height: diameter * 0.21,
                      width: diameter * 0.21,
                      decoration: const BoxDecoration(
                        color: Color(0xffA2A6B8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _renderStar() {
    return Stack(
      children: [
        AnimatedPositioned(
          top: _isNightMode ? 0 : -(widget.height * 0.84),
          right: widget.width * 0.35,
          duration: _duration,
          child: ClipPath(
            clipper: StarClipper(),
            child: Container(
              color: Colors.white,
              width: widget.width * 0.07,
              height: widget.width * 0.07,
            ),
          ),
        ),
        AnimatedPositioned(
          top: _isNightMode ? widget.height * 0.54 : -(widget.height * 0.54),
          right: widget.width * 0.44,
          duration: _duration,
          child: ClipPath(
            clipper: StarClipper(),
            child: Container(
              color: Colors.white,
              width: widget.width * 0.06,
              height: widget.width * 0.06,
            ),
          ),
        ),
        AnimatedPositioned(
          top: _isNightMode ? widget.width * 0.25 : -(widget.width * 0.25),
          right: widget.width * 0.5,
          duration: _duration,
          child: ClipPath(
            clipper: StarClipper(),
            child: Container(
              color: Colors.white,
              width: widget.width * 0.07,
              height: widget.width * 0.07,
            ),
          ),
        ),
        AnimatedPositioned(
          top: _isNightMode ? widget.height * 0.32 : -(widget.height * 0.32),
          right: widget.width * 0.5,
          duration: _duration,
          child: ClipPath(
            clipper: StarClipper(),
            child: Container(
              color: Colors.white,
              width: widget.width * 0.05,
              height: widget.width * 0.05,
            ),
          ),
        ),
        AnimatedPositioned(
          top: _isNightMode ? widget.height * 0.5 : -(widget.height * 0.5),
          right: widget.width * 0.83,
          duration: _duration,
          child: ClipPath(
            clipper: StarClipper(),
            child: Container(
              color: Colors.white,
              width: widget.width * 0.07,
              height: widget.width * 0.07,
            ),
          ),
        ),
        AnimatedPositioned(
          top: _isNightMode ? widget.height * 0.32 : -(widget.height * 0.32),
          right: widget.width * 0.6,
          duration: _duration,
          child: ClipPath(
            clipper: StarClipper(),
            child: Container(
              color: Colors.white,
              width: widget.width * 0.07,
              height: widget.width * 0.07,
            ),
          ),
        ),
        AnimatedPositioned(
          top: _isNightMode ? widget.height * 0.5 : -(widget.height * 0.5),
          right: widget.width * 0.83,
          duration: _duration,
          child: ClipPath(
            clipper: StarClipper(),
            child: Container(
              color: Colors.white,
              width: widget.width * 0.07,
              height: widget.width * 0.07,
            ),
          ),
        ),
      ],
    );
  }
}
