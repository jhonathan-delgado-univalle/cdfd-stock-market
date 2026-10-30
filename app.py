from datetime import datetime

from flask import Flask

import read_value_yf

app = Flask(__name__)


@app.route("/")
def hello_world():
    return read_value_yf.test().to_html()


if __name__ == "__main__":
    print(f"{datetime.now()}")
    app.run(host="0.0.0.0")
