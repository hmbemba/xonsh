from init_app import app
from blueprints.auth.blueprints import auth_bp, google_auth_bp
from blueprints.index.index import index_bp
import fire


app.register_blueprint(index_bp)
app.register_blueprint(auth_bp)
app.register_blueprint(google_auth_bp, url_prefix="/auth")

print(app.url_map)





