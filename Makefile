mem:
	gunicorn -k flask_sockets.worker "app:build_app('mem')" -b 0.0.0.0:8000

pickle:
	gunicorn -k flask_sockets.worker "app:build_app('pickle')" -b 0.0.0.0:8000

doc:
	python -m pdoc gundb --html --output-dir docs/api --force

pyproject.lock: pyproject.toml
	poetry lock
	@ touch $@

requirements.txt: pyproject.lock
	poetry run pip freeze > $@

memgevent:
	python geventapp.py mem

clientall: clientdummy clientmem clientredis clientudb clientpickle

clientdummy:
	python testclient.py dummy

clientredis:
	python testclient.py redis

clientmem:
	python testclient.py memory

clientudb:
	python testclient.py udb

clientpickle:
	python testclient.py pickle
