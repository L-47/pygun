from gundb.server import app
from gundb.gunrequesthandler import GUNRequestHandler

SERVER_NAME = '127.0.0.1:8000'


def build_app(backend):
    app.config["handler"] = GUNRequestHandler(backend)
    app.config['SERVER_NAME'] = SERVER_NAME
    return app
