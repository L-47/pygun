mem:
	gunicorn -k flask_sockets.worker "app:build_app('mem')" -b 0.0.0.0:8000

pickle:
    gunicorn -k flask_sockets.worker "app:build_app('pickle')" -b 0.0.0.0:8000

doc:
	python3 -m pdoc gundb --html --output-dir docs/api --force

pyproject.lock: pyproject.toml
	poetry lock
	@ touch $@

requirements.txt: pyproject.lock
	poetry run pip freeze > $@

rungevent:
	python3 geventapp.py $$GUNDB

clientall: clientdummy clientmem clientredis clientudb clientpickle

clientdummy:
	python3 testclient.py dummy

clientredis:
	python3 testclient.py redis

clientmem:
	python3 testclient.py memory

clientudb:
	python3 testclient.py udb

clientpickle:
	python3 testclient.py pickle
