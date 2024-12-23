from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hi juju, I miss you so much , you are so bootiful, i love you chellakuttteyy ,Good morning"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
