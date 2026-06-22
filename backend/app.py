from flask import Flask, request, jsonify
import librosa
import numpy as np
import joblib
import os

app = Flask(__name__)

# Load trained model
model = joblib.load("smartcry_model.pkl")

UPLOAD_FOLDER = "uploads"

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)


@app.route('/')
def home():
    return "SmartCry Backend Running"


@app.route('/predict', methods=['POST'])
def predict():

    if 'audio' not in request.files:
        return jsonify({"error": "No audio file uploaded"})

    file = request.files['audio']

    filepath = os.path.join(UPLOAD_FOLDER, file.filename)
    file.save(filepath)

    try:
        # Load audio
        audio, sr = librosa.load(
            filepath,
            sr=16000,
            mono=True
        )

        # Extract MFCC
        mfcc = librosa.feature.mfcc(
            y=audio,
            sr=sr,
            n_mfcc=13
        )

        mfcc_mean = np.mean(
            mfcc,
            axis=1
        ).reshape(1, -1)

        prediction = model.predict(mfcc_mean)

        if prediction[0] == 1:
            result = "Abnormal Cry Pattern Detected"
        else:
            result = "Normal Cry Pattern"

        return jsonify({
            "result": result
        })

    except Exception as e:
        print("ERROR OCCURRED:")
        print(e)

        return jsonify({
            "error": str(e)
        }), 500


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000,
        debug=False
    )