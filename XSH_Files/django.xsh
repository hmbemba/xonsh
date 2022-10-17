from make_dj_app import Settings, Urls, BaseHTML, CreateViewHTML, ListViewHTML,UpdateViewHTML, mkdirs

def _mkdjapp(args):
    if not args:
        return '''This command takes two positional arguments - a project name and an app name
        You must enter a project name and app name like so : "mkdjapp myproj myapp" 
        '''
    if len(args) == 1:
        return '''This command takes two positional arguments - a project name and an app name
        You must enter a project name and app name like so : "mkdjapp myproj myapp" 
        '''
    projectName = args[0] 
    appName = args[1] 
    _venv()
    pip install django gunicorn whitenoise black django-livereload-server
    pip freeze > requirements.txt
    subprocess.run([fr"{$pwd()}\venv\Scripts\django-admin.exe", "startproject",projectName])
    $projPath = Path($pwd()) / projectName
    $managePath =  $projPath / "manage.py"
    $appPath = $projPath / appName

    cd $projPath
    subprocess.run(["python.exe",str($managePath),"startapp",appName])

    mkdirs(str($appPath))
    
    Settings(projectName, appName).makeHere(str($projPath))
    Urls(projectName, appName).makeHere(str($projPath))
    BaseHTML(projectName, appName).makeHere(str($appPath / "templates"))
    CreateViewHTML(projectName, appName).makeHere(str($appPath / "templates"))
    ListViewHTML(projectName, appName).makeHere(str($appPath / "templates"))
    UpdateViewHTML(projectName, appName).makeHere(str($appPath / "templates"))


## Django
aliases['mkdjapp'] = _mkdjapp