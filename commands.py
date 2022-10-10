
import subprocess
from dataclasses import dataclass
from typing import Callable
from FFO.item_class import item
from FFO.file_class import File
from abc import ABCMeta, abstractmethod
import fire
import sys, inspect
from pathlib import Path


@dataclass
class Command(metaclass=ABCMeta):
    commandToPerform: str

    @abstractmethod
    def do(self):
        ...

    def run(self):
        try:
            self.do()
            print("Success :", self.commandToPerform)
        except Exception as e:
            print("Failure: ", self.commandToPerform)
            print("- Reason: ", e)


@dataclass
class make_main_dot_py(Command):
    commandToPerform: str = "make main.py"
    content:str = '''
from dataclasses import dataclass, field
from typing import Any, List
from abc import ABCMeta, abstractmethod
from dotenv import load_dotenv
# import os

load_dotenv()


# client_id = os.environ['SPOTIPY_CLIENT_ID']

@dataclass
class xx(metaclass=ABCMeta):
    _: List = field(default_factory=lambda: [])

    @abstractmethod
	def foo(self):
		pass

@dataclass
class xx:
    _: List = field(default_factory=lambda: [])
    '''

    def do(self):
        item.mkfileNoOverwrite("main.py", ".",content=self.content)


@dataclass
class acvenv(Command):
    commandToPerform: str = "Activate Virtual Environment"

    def do(self):
        if item.FileExists("./venv/Scripts/activate"):
            subprocess.run(["powershell.exe", "./venv/Scripts/activate"])
        else:
            raise Exception("Can't find venv folder")


@dataclass
class make_venv(Command):
    commandToPerform: str = "make Virtual Environment"

    def do(self):
        if item.FolderExists("./venv"):
            raise Exception("venv folder already exists")
        else:
            subprocess.run(["powershell.exe", "python -m venv venv;"])


@dataclass
class make_vscode_folder(Command):
    commandToPerform: str = "make .vscode folder"

    def do(self):
        if item.FolderExists(".vscode"):
            raise Exception(".vscode folder already exists")
        else:
            item.mkdir(dirName=".vscode", dst=".")


@dataclass
class make_settings_dot_json(Command):
    commandToPerform: str = "make settings.json in .vscode folder"
    content: str = """
{
    "python.formatting.provider": "black"
}
    """

    def do(self):
        if not item.FolderExists(".vscode"):
            raise Exception("Can't find .vscode folder")

        item.mkfileNoOverwrite(
            fileNameWithExt="settings.json", dst=".vscode", content=self.content
        )


@dataclass
class make_gitignore(Command):
    commandToPerform: str = "make .gitignore file"
    content: str = """
#Mine
.vscode/

# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
.pybuilder/
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
#   For a library or package, you might want to ignore these files since the code is
#   intended to run in multiple environments; otherwise, check them in:
# .python-version

# pipenv
#   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.
#   However, in case of collaboration, if having platform-specific dependencies or dependencies
#   having no cross-platform support, pipenv may install dependencies that don't work, or not
#   install all needed dependencies.
#Pipfile.lock

# poetry
#   Similar to Pipfile.lock, it is generally recommended to include poetry.lock in version control.
#   This is especially recommended for binary packages to ensure reproducibility, and is more
#   commonly ignored for libraries.
#   https://python-poetry.org/docs/basic-usage/#commit-your-poetrylock-file-to-version-control
#poetry.lock

# pdm
#   Similar to Pipfile.lock, it is generally recommended to include pdm.lock in version control.
#pdm.lock
#   pdm stores project-wide configurations in .pdm.toml, but it is recommended to not include it
#   in version control.
#   https://pdm.fming.dev/#use-with-ide
.pdm.toml

# PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# pytype static type analyzer
.pytype/

# Cython debug symbols
cython_debug/

# PyCharm
#  JetBrains specific template is maintained in a separate JetBrains.gitignore that can
#  be found at https://github.com/github/gitignore/blob/main/Global/JetBrains.gitignore
#  and can be added to the global gitignore or merged into this file.  For a more nuclear
#  option (not recommended) you can uncomment the following to ignore the entire idea folder.
#.idea/
    """

    def do(self):
        item.mkfileNoOverwrite(
            fileNameWithExt=".gitignore", dst=".", content=self.content
        )


@dataclass
class make_readme(Command):
    commandToPerform: str = "make README.md"

    def do(self):
        item.mkfileNoOverwrite(fileNameWithExt="README.md", dst=".")


def getCommandsList():
    clsmembers = inspect.getmembers(sys.modules[__name__], inspect.isclass)
    commands = [
        item[0]
        for item in clsmembers
        if item[0] not in ["Command", "File", "Folder", "item", "ABCMeta"]
    ]
    for command in commands:
        print(f"'{command}':{command}().run,")

def getCommandsListForPs():
    clsmembers = inspect.getmembers(sys.modules[__name__], inspect.isclass)
    commands = [
        item[0]
        for item in clsmembers
        if item[0] not in ["Command", "File", "Folder", "item", "ABCMeta"]
    ]
    for command in commands:
        print(fr'''
function {command} {{
    python "C:\Users\hmbem\Documents\WindowsPowerShell\MyModules\Code\commands.py" {command}
}}
              ''')


    

if __name__ == "__main__":
    fire.Fire(
        {
            "acvenv": acvenv().run,
            "make_gitignore": make_gitignore().run,
            "make_main_dot_py": make_main_dot_py().run,
            "make_readme": make_readme().run,
            "make_settings_dot_json": make_settings_dot_json().run,
            "make_venv": make_venv().run,
            "make_vscode_folder": make_vscode_folder().run,
        }
    )
