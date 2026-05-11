from flask import Flask
import os

app = Flask(__name__)

@app.get("/")
def home():
    return {
        "message": "Hello from Docker!",
        "status": "Running in Kubernetes"
    }

if __name__ == "__main__":
    # Use port 5000 and set host to 0.0.0.0 so it's accessible outside the container
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)