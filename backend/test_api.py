import requests

url = "http://127.0.0.1:5000/predict"

audio_file = "uploads/fast_33.wav"

with open(audio_file, "rb") as f:

    files = {
        "audio": f
    }

    response = requests.post(
        url,
        files=files
    )

print(response.json())