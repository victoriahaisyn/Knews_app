import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KpopPage extends StatelessWidget {
  const KpopPage({super.key});

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
                width: double.infinity,
                decoration: BoxDecoration(color: const Color(0xFFE5B5B5), borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _navText(context, "Профіль", '/profile'),
                          _navText(context, "Головна", '/home'),
                          _navText(context, "Дорами", '/dorama'),
                          _navText(context, "К-поп", '/kpop', isActive: true),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        children: [
                          _buildNewsItem('assets/kpop1.png', 'Кліп BTS встановив новий рекорд на YouTube'),
                          _buildNewsItem('assets/kpop2.png', 'K-pop айдоли зняли кліп із кіберспортсменами T1'),
                          _buildNewsItem('assets/kpop3.png', 'Гурт Weki Meki офіційно розформовано'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildHeader(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(String imagePath, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(40), child: Image.asset(imagePath, width: double.infinity, height: 180, fit: BoxFit.cover)),
          const SizedBox(height: 10),
          Text(description, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
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