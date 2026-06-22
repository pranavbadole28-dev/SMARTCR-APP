import 'package:flutter/material.dart';
import 'result_screen.dart';

class AnalysisScreen extends StatefulWidget {
  final String result;

  const AnalysisScreen({
    super.key,
    required this.result,
  });

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                result: widget.result,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEF5),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Image.asset(
                  'assets/images/audio_waveform.png',
                  height: 120,
                ),

                const SizedBox(height: 25),

                const Text(
                  "Analyzing Cry Pattern",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "SmartCry AI is processing the audio and comparing cry characteristics with trained machine learning patterns.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF666666),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 35),

                Container(
                  width: double.infinity,
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

                  child: const Column(
                    children: [

                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Audio Received",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Feature Extraction Completed",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(
                            Icons.hourglass_top,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "AI Model Analysis Running",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                const CircularProgressIndicator(
                  color: Color(0xFFF48CA8),
                  strokeWidth: 4,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Processing...",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF555555),
                  ),
                ),

                const SizedBox(height: 25),

                Image.asset(
                  'assets/images/cloud_image.png',
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}