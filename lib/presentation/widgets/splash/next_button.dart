import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NextButton extends StatefulWidget {
  final VoidCallback onPressed;

  const NextButton({super.key, required this.onPressed});

  @override
  State<NextButton> createState() => _NextButtonState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed));
  }
}

class _NextButtonState extends State<NextButton> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 1,
      end: 1.08,
    ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (final context, final child) {
        return Transform.scale(scale: _pulseAnimation.value, child: child);
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF4A3C8C), // Purple color from the image
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Icon(Icons.arrow_forward, color: Colors.white, size: 28),
          ),
        ),
      ),
    );
  }
}
