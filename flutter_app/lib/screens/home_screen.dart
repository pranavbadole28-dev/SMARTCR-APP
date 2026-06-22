import 'package:flutter/material.dart';
import 'baby_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEF2),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),

            child: Column(
              children: [

                // Top Decoration
                SizedBox(
                  height: 70,
                  child: Image.asset(
                    "assets/images/cloud_image.png",
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "SmartCry",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "AI Powered Infant Cry Analysis",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 25),

                // Main Illustration
                Container(
                  height: 260,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/images/baby_mother.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Helping Parents Understand Infant Cry Patterns Through Intelligent Audio Analysis",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 25),

                // Feature Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                      ),
                    ],
                  ),

                  child: const Column(
                    children: [

                      Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            color: Color(0xFFFF8FAB),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Non-Invasive Screening",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(
                            Icons.graphic_eq,
                            color: Color(0xFFFF8FAB),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "AI Based Cry Analysis",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(
                            Icons.health_and_safety_outlined,
                            color: Color(0xFFFF8FAB),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Early Detection Support",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BabyDetailsScreen(),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFFF8FAB),

                      elevation: 4,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20),
                      ),
                    ),

                    child: const Text(
                      "Start Journey",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  height: 50,
                  child: Image.asset(
                    "assets/images/baby_footprints.png",
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}