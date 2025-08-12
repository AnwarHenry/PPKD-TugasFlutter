import 'package:flutter/material.dart';
import 'package:day_night_switch/day_night_switch.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage>
    with SingleTickerProviderStateMixin {
  bool isDarkMode = false;
  late AnimationController _controller;
  late Animation<Color?> _bgColorAnimation;
  late Animation<Color?> _textColorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bgColorAnimation = ColorTween(
      begin: Colors.lightBlue.shade100,
      end: Colors.black87,
    ).animate(_controller);

    _textColorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
      if (isDarkMode) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _bgColorAnimation.value,
          body: Stack(
            children: [
              // Matahari
              Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width / 2 - 40,
                child: AnimatedOpacity(
                  opacity: isDarkMode ? 0 : 1,
                  duration: const Duration(milliseconds: 600),
                  child: AnimatedScale(
                    scale: isDarkMode ? 0.5 : 1,
                    duration: const Duration(milliseconds: 600),
                    child: Icon(
                      Icons.wb_sunny,
                      size: 80,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ),

              // Bintang
              ...List.generate(20, (index) {
                final double left =
                    (index * 20) % MediaQuery.of(context).size.width;
                final double top =
                    (index * 40) % MediaQuery.of(context).size.height / 2;
                return AnimatedOpacity(
                  opacity: isDarkMode ? 1 : 0,
                  duration: const Duration(milliseconds: 800),
                  child: Positioned(
                    left: left,
                    top: top,
                    child: Icon(Icons.star, size: 10, color: Colors.white),
                  ),
                );
              }),

              // Konten utama
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DayNightSwitch(
                      value: isDarkMode,
                      onChanged: toggleTheme,
                      sunColor: Colors.orange,
                      moonColor: const Color.fromARGB(255, 0, 140, 255),
                      nightColor: const Color.fromARGB(251, 6, 57, 145),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      isDarkMode ? "Mode Malam Aktif" : "Mode Siang Aktif",
                      style: TextStyle(
                        fontSize: 18,
                        color: _textColorAnimation.value,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
