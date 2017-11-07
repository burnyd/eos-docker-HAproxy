import socket
from flask import Flask, request

app = Flask(__name__)

@app.route("/hostname/")
def return_hostname():
    return "Web connection from {} to {}".format(socket.gethostname(), request.remote_addr)

if __name__ == "__main__":
    app.run(host='0.0.0.0')
