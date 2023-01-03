from flask import redirect, url_for
from flask_login import LoginManager
from init_app import app


login_manager = LoginManager(app)
login_manager.login_view = '/auth/login'


@login_manager.unauthorized_handler
def handle_needs_login():
    return redirect(url_for('auth_bp.login'))


