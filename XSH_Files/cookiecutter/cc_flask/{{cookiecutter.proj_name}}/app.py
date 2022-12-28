from flask import Flask
import pprint
from blueprints.auth import auth_bp, google_auth_bp
import os

pp = pprint.PrettyPrinter(indent=6)

app = Flask(__name__)

app.config.update(dict(
    DEBUG = True,
    TEMPLATES_AUTO_RELOAD = True,
    
    SECRET_KEY = os.environ.get("FLASK_SECRET_KEY"),
    GOOGLE_OAUTH_CLIENT_ID = os.environ.get("GOOGLE_OAUTH_CLIENT_ID"),
    GOOGLE_OAUTH_CLIENT_SECRET = os.environ.get("GOOGLE_OAUTH_CLIENT_SECRET"),
    
))


@app.route("/")
def hello_world():
    return "Index" 

app.register_blueprint(auth_bp )
# app.register_blueprint(gkeep_bp )
app.register_blueprint(google_auth_bp, url_prefix="/login")










# app.register_blueprint(sdb_v3_bp, url_prefix='/sdb')
# app.register_blueprint(heldb_bp, url_prefix='/heldb')


# from db.Songdb.V2.Songdb_V2 import Song as old
# from db.Songdb.V3.Songdb_V3 import Song as new
# from db.PonyORM_Wrapper.migrate_model import migrate
# migrate(old, new)
