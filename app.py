import os
from gundb.server import app
from gundb.gunrequesthandler import GUNRequestHandler

HOST = os.getenv('HOST', '127.0.0.1')
PORT = os.getenv('PORT', '8000')


def build_app(backend):
    app.config["handler"] = GUNRequestHandler(backend)
    app.config['HOST'] = HOST
    app.config['PORT'] = PORT
    return app
