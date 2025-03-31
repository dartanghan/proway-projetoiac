from flask import Flask
from flask import request

app = Flask(__name__)

@app.route("/", methods=["GET"]) # http://localhost:5000/
@app.route("/<username>", methods=["GET"]) # http://localhost:5000/dartanghan
def get_main(username=None):
    if not username:
        return f"<p>Proway GET chamado sem path de {request.remote_addr}!</p>", 400
    return f"<p>Proway GET chamado com parametro {username}!</p>"

    
