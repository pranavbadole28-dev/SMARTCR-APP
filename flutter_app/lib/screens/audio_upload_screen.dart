import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'analysis_screen.dart';

class AudioUploadScreen extends StatelessWidget {
  const AudioUploadScreen({super.key});

  Future<void> analyzeAudio(
    BuildContext context,
    String assetPath,
  ) async {
    try {
      final ByteData data =
          await rootBundle.load(assetPath);

      final Uint8List bytes =
          data.buffer.asUint8List();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          'http://10.0.2.2:5000/predict',
        ),
      );

      request.files.add(
        http.MultipartFile.fromBytes(
          'audio',
          bytes,
          filename: assetPath.split('/').last,
        ),
      );

      var response = await request.send();

      var responseBody =
          await response.stream.bytesToString();

      var jsonData =
          json.decode(responseBody);

      String result =
          jsonData["result"];

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AnalysisScreen(
              result: result,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
    }
  }

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
              'assets/images/audio_waveform.png',
              height: 110,
            ),

            const SizedBox(height: 20),

            const Text(
              "Cry Audio Analysis",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Select a cry sample and allow SmartCry AI to analyze the audio pattern.",
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

                  Image.asset(
                    'assets/images/crying_baby.png',
                    height: 140,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Choose Audio Sample",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "The selected audio will be processed using the SmartCry Machine Learning model.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 65,

              child: ElevatedButton.icon(
                onPressed: () {
                  analyzeAudio(
                    context,
                    'assets/audio/140c.wav',
                  );
                },

                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),

                label: const Text(
                  "Analyze Normal Cry",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5CB85C),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 65,

              child: ElevatedButton.icon(
                onPressed: () {
                  analyzeAudio(
                    context,
                    'assets/audio/fast_33.wav',
                  );
                },

                icon: const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.white,
                ),

                label: const Text(
                  "Analyze Abnormal Cry",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE57373),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Image.asset(
              'assets/images/cloud_image.png',
              height: 45,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}