.PHONY: build test package clean

PYTHON ?= python
POETRY ?= $(PYTHON) -m poetry
PYINSTALLER ?= $(PYTHON) -m PyInstaller

build:
	$(POETRY) install

test:
	$(POETRY) run aw-watcher-afk --help  # Ensures that it at least starts
	make typecheck

typecheck:
	$(POETRY) run mypy aw_watcher_afk --ignore-missing-imports

package:
	$(PYINSTALLER) aw-watcher-afk.spec --clean --noconfirm

clean:
	rm -rf build dist
	rm -rf aw_watcher_afk/__pycache__
