# SMARTCRY

## AI Powered Infant Cry Analysis Using Machine Learning and Flutter

---

# 1. Project Overview

SmartCry is an AI-powered mobile application developed to analyze infant crying sounds and identify whether a cry pattern appears normal or abnormal using Machine Learning.

The motivation behind this project came from the observation that infants communicate primarily through crying. Certain medical conditions and developmental disorders can influence cry characteristics such as pitch, frequency, duration, and acoustic patterns. Early detection of abnormal cry patterns may assist parents and healthcare professionals in seeking further medical evaluation.

The objective of SmartCry is not to diagnose a disease directly but to act as an early screening and awareness tool.

The application allows users to:

* Enter baby details
* Upload or select cry audio samples
* Send audio to a Machine Learning backend
* Extract acoustic features
* Classify the cry pattern
* Display the result in a simple and parent-friendly interface

---

# 2. Problem Statement

Parents often struggle to determine whether an infant's crying pattern is normal or requires medical attention.

Current challenges include:

* Limited awareness of abnormal cry patterns
* Difficulty in accessing immediate pediatric consultation
* Lack of simple AI-powered screening tools
* Delayed recognition of possible developmental issues

SmartCry attempts to provide a preliminary AI-assisted cry analysis system.

---

# 3. Technology Stack

## Frontend

Flutter

Purpose:

* Cross-platform mobile development
* Android application creation
* Modern UI design

Why Flutter?

* Single codebase
* Fast development
* Beautiful UI widgets
* Strong community support

---

## Backend

Flask

Purpose:

* REST API development
* Machine Learning model hosting
* Audio processing

Why Flask?

* Lightweight
* Easy integration with ML models
* Simple deployment

---

## Machine Learning

Python

Libraries:

### Librosa

Used for:

* Audio loading
* Signal processing
* MFCC extraction

### NumPy

Used for:

* Feature calculations
* Matrix operations

### Scikit-Learn

Used for:

* Model training
* Prediction

### Joblib

Used for:

* Saving trained models
* Loading trained models

---

## Deployment

### GitHub

Used for:

* Source control
* Version management
* Project hosting

### Render

Used for:

* Flask backend deployment
* Public API hosting

---

# 4. Project Architecture

System Workflow:

```text
User
   │
   ▼
Flutter Mobile App
   │
   ▼
Audio Upload
   │
   ▼
Flask Backend API
   │
   ▼
MFCC Feature Extraction
   │
   ▼
Machine Learning Model
   │
   ▼
Prediction
   │
   ▼
Result Returned
   │
   ▼
Flutter Result Screen
```

---

# 5. Initial Development Setup

## Flutter Installation

Installed:

* Flutter SDK
* Android Studio
* Android Emulator
* VS Code

Required plugins:

* Flutter Extension
* Dart Extension

Verification:

```bash
flutter doctor
```

Purpose:

Check whether Flutter environment was correctly configured.

---

## Android Studio Setup

Created:

Pixel 7 Emulator

Android Version:

Android 13

Purpose:

Testing the application without requiring a physical device.

---

# 6. Building the Flutter Application

The application was divided into multiple screens.

---

## Home Screen

Purpose:

Landing page of the application.

Features:

* SmartCry branding
* Mother and baby illustration
* Project description
* Start Journey button

Challenges:

Initially the UI looked too white.

Solution:

Introduced:

* Baby pink theme
* Soft baby blue accents
* Card-based layout

Result:

More professional and child-friendly design.

---

## Baby Details Screen

Purpose:

Collect infant information.

Inputs:

* Baby Name
* Age
* Gender

Features:

* Gender selection cards
* Animated UI
* Soft color palette

Challenges:

Text appeared invisible because white text was displayed on white backgrounds.

Solution:

Changed text colors to dark gray and black.

---

## Audio Upload Screen

Purpose:

Select cry samples for analysis.

Features:

* Normal cry button
* Abnormal cry button
* Audio preview section

Challenges:

Connecting Flutter frontend with Flask backend.

---

## Analysis Screen

Purpose:

Display processing status.

Features:

* Loading animation
* AI processing message
* Automatic navigation

Purpose:

Improve user experience while waiting for prediction.

---

## Result Screen

Purpose:

Display final prediction.

Results:

* Normal Cry Pattern
* Abnormal Cry Pattern Detected

Features:

* Different colors for different outcomes
* Easy-to-understand messages

---

# 7. Machine Learning Development

---

## Dataset Collection

One of the biggest challenges of the project.

Sources:

* Public infant cry datasets
* Research datasets
* Sample recordings

Types:

### Normal Cry

Examples:

* Hunger
* Discomfort
* Sleepiness

### Abnormal Cry

Examples:

* Rare disorder-related cry patterns

---

## Data Preprocessing

Steps:

### Standardization

Converted audio to:

```text
16 kHz
Mono
WAV Format
```

---

### Noise Handling

Audio signals were normalized.

---

### Segmentation

Audio divided into smaller samples for consistency.

---

# 8. Feature Extraction

Instead of using raw audio directly, acoustic features were extracted.

Method Used:

MFCC

(Mel Frequency Cepstral Coefficients)

---

Why MFCC?

MFCCs are commonly used in:

* Speech Recognition
* Voice Analysis
* Audio Classification

They represent:

* Frequency characteristics
* Spectral information
* Human hearing perception

---

Extraction Process:

```python
mfcc = librosa.feature.mfcc(
    y=audio,
    sr=16000,
    n_mfcc=13
)
```

Then:

```python
np.mean(mfcc, axis=1)
```

Result:

13-dimensional feature vector

---

# 9. Model Training

Training pipeline:

```text
Audio
  │
  ▼
MFCC Extraction
  │
  ▼
Feature Vector
  │
  ▼
Model Training
  │
  ▼
Prediction
```

Model stored using:

```python
joblib.dump()
```

Loaded later using:

```python
joblib.load()
```

---

# 10. Flask Backend Development

Created:

```python
app.py
```

Routes:

---

## Home Route

```python
/
```

Purpose:

Verify backend availability.

Returns:

```text
SmartCry Backend Running
```

---

## Predict Route

```python
/ predict
```

Purpose:

Accept audio files.

Workflow:

1. Receive audio
2. Save file
3. Extract MFCC
4. Load model
5. Predict
6. Return result

---

Response Example:

```json
{
   "result":"Normal Cry Pattern"
}
```

or

```json
{
   "result":"Abnormal Cry Pattern Detected"
}
```

---

# 11. Local Testing

Backend Run:

```bash
python app.py
```

Flask Address:

```text
http://127.0.0.1:5000
```

Testing Tools:

* Browser
* Postman
* Flutter Emulator

---

# 12. Frontend Backend Integration

Initially:

```dart
http://10.0.2.2:5000/predict
```

Used because:

Android Emulator cannot directly access localhost.

10.0.2.2 acts as a bridge to the host machine.

---

# 13. Problems Faced

---

## Emulator Issues

Problem:

Pixel 7 emulator became stuck.

Symptoms:

* Could not close
* Appeared already running

Solution:

Killed emulator processes and restarted Android Studio.

---

## UI Visibility Issues

Problem:

White text on white cards.

Solution:

Updated typography colors.

---

## Git Setup Issues

Problem:

Git commit failed.

Error:

```text
Author identity unknown
```

Solution:

Configured:

```bash
git config --global user.name
git config --global user.email
```

---

## GitHub Push Issues

Problem:

Remote repository already contained files.

Solution:

Created fresh repository:

```text
SMARTCR-APP
```

Successfully pushed source code.

---

## Render Deployment Issues

Problem:

Backend deployment configuration.

Solution:

Configured:

* Build Command
* Start Command
* Requirements File

Successfully deployed Flask API.

---

## DNS / Host Lookup Issues

Problem:

Mobile app showed:

```text
Failed host lookup
```

Cause:

Missing internet permission.

Solution:

Added:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

---

## Render Sleep Issue

Problem:

Backend sometimes appeared unresponsive.

Cause:

Render Free Tier sleeps after inactivity.

Solution:

Wake backend by opening:

```text
https://smartcry-backend.onrender.com
```

before demonstration.

---

# 14. Deployment Process

---

## GitHub Deployment

Commands Used:

```bash
git init
git add .
git commit -m "Initial SmartCry Project"
git branch -M main
git push -u origin main
```

---

## Render Deployment

Connected:

GitHub Repository

Service Type:

```text
Python Web Service
```

Start Command:

```bash
gunicorn app:app
```

Result:

Public API URL generated.

Example:

```text
https://smartcry-backend.onrender.com
```

---

# 15. APK Generation

Command:

```bash
flutter build apk --release
```

Generated File:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Purpose:

Install SmartCry on Android devices.

---

# 16. Current System Status

Completed:

✅ Flutter Application

✅ Flask Backend

✅ Machine Learning Model

✅ GitHub Repository

✅ Render Deployment

✅ APK Generation

✅ Mobile Testing

---

# 17. Future Improvements

### Real Audio Recording

Allow parents to record live crying sounds.

---

### Expanded Dataset

Include:

* Cri Du Chat
* Autism indicators
* Neurological conditions

---

### Deep Learning Models

Upgrade to:

* CNN
* LSTM
* CNN-LSTM

---

### Cloud Database

Store:

* Baby profiles
* Analysis history

---

### Doctor Recommendation Module

Connect parents with nearby pediatricians.

---

### IoT Integration

Future version:

CryPal Smart Toy

Components:

* ESP32
* Microphone
* Buzzer

Purpose:

Real-time abnormal cry alerts.

---

# 18. Key Learning Outcomes

Through SmartCry, the following skills were developed:

### Mobile Development

* Flutter
* Android Studio
* UI/UX Design

### Backend Development

* Flask
* REST APIs

### Machine Learning

* Feature Engineering
* MFCC Extraction
* Audio Classification

### Deployment

* GitHub
* Render
* APK Generation

### Software Engineering

* Version Control
* Debugging
* Integration Testing
* Full Stack Development

---

# Conclusion

SmartCry successfully demonstrates the integration of Flutter, Flask, Machine Learning, Audio Signal Processing, Cloud Deployment, and Mobile Development into a single working application. The project serves as a proof-of-concept AI-assisted infant cry analysis system capable of detecting normal and abnormal cry patterns through MFCC-based feature extraction and machine learning classification while providing a user-friendly mobile experience for parents and caregivers.

---


