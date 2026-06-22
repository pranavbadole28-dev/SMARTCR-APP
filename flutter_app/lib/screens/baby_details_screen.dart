import 'audio_upload_screen.dart';
import 'package:flutter/material.dart';

class BabyDetailsScreen extends StatefulWidget {
  const BabyDetailsScreen({super.key});

  @override
  State<BabyDetailsScreen> createState() => _BabyDetailsScreenState();
}

class _BabyDetailsScreenState extends State<BabyDetailsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEF5),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF444444),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            Image.asset(
              'assets/images/sleeping_baby.png',
              height: 150,
            ),

            const SizedBox(height: 20),

            const Text(
              "Baby Information",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Provide your baby's details to personalize the SmartCry experience.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF666666),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                children: [

                  TextField(
                    controller: nameController,

                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),

                    decoration: InputDecoration(
                      labelText: "Baby Name",

                      labelStyle: const TextStyle(
                        color: Colors.black54,
                      ),

                      prefixIcon: const Icon(
                        Icons.child_care,
                        color: Color(0xFFF48CA8),
                      ),

                      filled: true,
                      fillColor: const Color(0xFFF9F9F9),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,

                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),

                    decoration: InputDecoration(
                      labelText: "Age (Months)",

                      labelStyle: const TextStyle(
                        color: Colors.black54,
                      ),

                      prefixIcon: const Icon(
                        Icons.cake,
                        color: Color(0xFFF48CA8),
                      ),

                      filled: true,
                      fillColor: const Color(0xFFF9F9F9),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(
                  'assets/images/soft_heart.png',
                  height: 28,
                ),

                const SizedBox(width: 10),

                const Text(
                  "Select Gender",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = "Boy";
                      });
                    },

                    child: Container(
                      height: 85,

                      decoration: BoxDecoration(
                        color: selectedGender == "Boy"
                            ? const Color(0xFFD7EBFF)
                            : Colors.white,

                        borderRadius: BorderRadius.circular(20),

                        border: Border.all(
                          color: selectedGender == "Boy"
                              ? Colors.blue
                              : Colors.blue.shade100,
                          width: 2,
                        ),
                      ),

                      child: const Center(
                        child: Text(
                          "👦 Boy",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = "Girl";
                      });
                    },

                    child: Container(
                      height: 85,

                      decoration: BoxDecoration(
                        color: selectedGender == "Girl"
                            ? const Color(0xFFFFDCE8)
                            : Colors.white,

                        borderRadius: BorderRadius.circular(20),

                        border: Border.all(
                          color: selectedGender == "Girl"
                              ? Colors.pink
                              : Colors.pink.shade100,
                          width: 2,
                        ),
                      ),

                      child: const Center(
                        child: Text(
                          "👧 Girl",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Image.asset(
              'assets/images/baby_footprints.png',
              height: 45,
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
                          const AudioUploadScreen(),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF48CA8),

                  elevation: 4,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}