import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE5B5B5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _navText(context, "Профіль", '/profile'),
                          _navText(context, "Головна", '/home', isActive: true),
                          _navText(context, "Дорами", '/dorama'),
                          _navText(context, "К-поп", '/kpop'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            "Ласкаво просимо на K-News — сайт, який відкриє для вас світ дорам та К-поп! Ми створені для справжніх фанатів корейської культури, які хочуть бути в курсі всіх новин та подій. У нас ви знайдете найсвіжіші статті про популярні гурти, аналітику музичних чартів, ексклюзивні інтерв'ю та огляди найочікуваніших дорам.\n\nЗалишайтеся з нами та будьте в епіцентрі подій разом із K-News!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweather(fontSize: 14, height: 1.5, color: Colors.black87),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
            _buildHeader(),
            Positioned(
              bottom: 0, left: 10, right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('assets/actors.png', height: 220),
                  Image.asset('assets/idol.png', height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: 40, left: 30, right: 30,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFD9A7A7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20),
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("K-Drama", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("NEWS", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("K-Pop", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _navText(BuildContext context, String text, String route, {bool isActive = false}) {
    return GestureDetector(
      onTap: () { if (!isActive) Navigator.pushNamed(context, route); },
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: Colors.black,
          decoration: isActive ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}