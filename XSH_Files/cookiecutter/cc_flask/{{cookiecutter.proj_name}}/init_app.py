from flask import Flask
import os
    
class DebugConfig:
    DEBUG = True
    TEMPLATES_AUTO_RELOAD = True,
    
    SECRET_KEY = os.environ.get("FLASK_SECRET_KEY"),
    GOOGLE_OAUTH_CLIENT_ID = os.environ.get("GOOGLE_OAUTH_CLIENT_ID"),
    GOOGLE_OAUTH_CLIENT_SECRET = os.environ.get("GOOGLE_OAUTH_CLIENT_SECRET"),

class ProductionConfig:
    DEBUG = False
    
app = Flask(__name__)
app.config.from_object(DebugConfig)



