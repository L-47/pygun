import os
from gundb.server import app
from gundb.gunrequesthandler import GUNRequestHandler

HOST = os.getenv('HOST', '0.0.0.0')
PORT = os.getenv('PORT', '8000')


def build_app(backend):
    app.config["handler"] = GUNRequestHandler(backend)
    app.config['SERVER_NAME'] = f'{HOST}:{PORT}'
    return app
