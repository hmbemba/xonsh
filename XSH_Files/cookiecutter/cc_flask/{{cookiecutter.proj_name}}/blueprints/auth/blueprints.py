from flask import Blueprint
from flask_dance.contrib.google import make_google_blueprint
from .login import login
from .register import register
from .oauth import google_auth


auth_bp = Blueprint('auth_bp', __name__, url_prefix='/auth')
auth_bp.add_url_rule('/login', view_func=login,methods=['GET', 'POST'])
auth_bp.add_url_rule('/register', view_func=register,methods=['GET', 'POST'])


google_auth_bp = make_google_blueprint(scope=["https://www.googleapis.com/auth/userinfo.profile", ])
google_auth_bp.add_url_rule('/home', view_func=google_auth)







