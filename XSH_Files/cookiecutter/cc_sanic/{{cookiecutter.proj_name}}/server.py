from blueprints.simple import bp as simple_bp
from blueprints.simple2 import bp as simple2_bp
from sanic import Sanic
from pathlib import Path
from jinja2.loaders import FileSystemLoader
from jinja2 import Environment

# Create Sanic App
app = Sanic("MyHelloWorldApp")

# Add Blueprints
'''
from blueprints.simple import bp as user_bp
from blueprints.medium import bp as medium_bp
'''
app.blueprint([simple_bp, simple2_bp])


# Set up template files
@app.before_server_start
def setup_template_env(app, _):
    app.ctx.env = Environment(
        loader=FileSystemLoader(Path(__file__).parent /"templates"),
        autoescape=True,
    )

# TODO
'''
@app.before_server_start
def startDB(app,_):
    
'''
   
# Run Sanic
r'''
    sanic server:app -p 7777 --debug --workers=2
    
    # Errors
    ## sanic error
    - If you get this error just uninstall then reinstall sanic from pip
    Fatal error in launcher: Unable to create process using '"C:\Users\...\venv\Scripts\python.exe"  "C:\Users\...\venv\Scripts\sanic.exe" -m server.app': The system cannot find the file specified.

    ## pip errors
    python -m pip install --upgrade --force-reinstall pip
'''
