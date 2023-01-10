def _venv():
    commands = str(Path($XONSHRC[0]).parent / "commands.py")
    
    subprocess.run(["python.exe", commands, "make_venv"])
    vox enter "venv"
    subprocess.run(["python.exe", commands, "make_main_dot_py"])
    subprocess.run(["python.exe", commands, "make_vscode_folder"])
    subprocess.run(["python.exe", commands, "make_settings_dot_json"])
    subprocess.run(["python.exe", commands, "make_readme"])
    subprocess.run(["python.exe", commands, "make_gitignore"])
    item.mkfileNoOverwrite(".env")
    item.mkfileNoOverwrite(".dockerignore",'.',content='*/venv')
    item.mkfileNoOverwrite("dockerfile")
    
    pip install flake8 black pytest python-dotenv refurb icecream #pretty_errors cookiecutter
    pip freeze > requirements.txt
    
    git init
    git add . #// this will stage your files for thier first commit
    git status #//see all the files you have staged for commit
    git commit -m "First Commit" #//your first commit with a comment

    #print('Installed flake8 black pytest python-dotenv refurb pretty_errors')
    pip list

## Python
aliases['pf'] = "pip freeze > requirements.txt"
aliases['venv'] = _venv
aliases['acvenv'] = "vox enter venv"

########## MAIN ########################
aliases['main'] = r'python main.py'
aliases['mmain'] = r".\venv\Scripts\mypy.exe main.py" 
aliases['mmains'] = r".\venv\Scripts\mypy.exe --strict main.py"
aliases['mainr'] = r'refurb main.py'


aliases['mkvenv'] = 'python -m venv venv'
aliases['restartpip'] = 'python -m pip install --upgrade --force-reinstall pip'