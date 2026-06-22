import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;

  const ResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    bool isAbnormal =
        result.contains("Abnormal");

    return Scaffold(
      backgroundColor: const Color(0xFFFCEEF5),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              const SizedBox(height: 20),

              Image.asset(
                isAbnormal
                    ? 'assets/images/medical_alert.png'
                    : 'assets/images/happy_mother.png',
                height: 180,
              ),

              const SizedBox(height: 25),

              const Text(
                "Analysis Report",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "SmartCry AI has completed the cry pattern assessment.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF666666),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),

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

                    Icon(
                      isAbnormal
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle,
                      size: 70,
                      color: isAbnormal
                          ? Colors.red
                          : Colors.green,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      result,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isAbnormal
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      isAbnormal
                          ? "The cry pattern shows characteristics that differ from the normal cry samples used during model training."
                          : "The cry pattern appears similar to normal cry samples used during model training.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF555555),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: isAbnormal
                      ? const Color(0xFFFFEBEE)
                      : const Color(0xFFE8F5E9),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [

                    Text(
                      isAbnormal
                          ? "Recommendation"
                          : "Observation",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isAbnormal
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      isAbnormal
                          ? "Consider consulting a pediatric specialist for further assessment. This result is only a screening indication and not a medical diagnosis."
                          : "No unusual cry characteristics were detected in this sample. Continue routine observation and care.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF555555),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Image.asset(
                'assets/images/baby_footprints.png',
                height: 50,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFF48CA8),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                  ),

                  child: const Text(
                    "Back To Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}