import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                          _navText(context, "Профіль", '/profile', isActive: true),
                          _navText(context, "Головна", '/home'),
                          _navText(context, "Дорами", '/dorama'),
                          _navText(context, "К-поп", '/kpop'),
                        ],
                      ),
                      
                      const SizedBox(height: 30),

                      Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              image: const DecorationImage(
                                image: AssetImage('assets/profile_img.png'), 
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Фото профілю",
                            style: GoogleFonts.merriweather(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),
                      _buildProfileField("Ім’я:"),
                      const SizedBox(height: 25),
                      _buildProfileField("Електронна пошта:"),
                      
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),

            _buildHeader(),

            Positioned(
              bottom: 0,
              left: 10,
              right: 10,
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

  Widget _buildProfileField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.merriweather(fontSize: 16, color: Colors.black)),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none, 
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: 40,
      left: 30,
      right: 30,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFD9A7A7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
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
      onTap: () {
        if (!isActive) Navigator.pushNamed(context, route);
      },
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