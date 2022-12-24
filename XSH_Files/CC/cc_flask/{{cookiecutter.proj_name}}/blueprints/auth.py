from flask import Blueprint, render_template, redirect, url_for
from flask_dance.contrib.google import make_google_blueprint, google
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired

auth_bp = Blueprint('auth_bp', __name__, url_prefix='/auth')
google_auth_bp = make_google_blueprint(scope=["https://www.googleapis.com/auth/userinfo.profile", ])

'''
Login
'''
@auth_bp.route('/login')
def login():
    return render_template('auth/LoginView/LoginView.html')


'''
Google Auth Login
'''
@google_auth_bp.route("/auth/google")
def google_auth():
    if not google.authorized:
        return redirect(url_for("google.login"))
    resp = google.get("/oauth2/v1/userinfo")
    assert resp.ok, resp.text
    return resp.json() 


'''
Register
'''
class RegisterForm(FlaskForm):
    name = StringField('First Name', validators=[DataRequired()])
    pwd = PasswordField('Password', validators=[DataRequired()])

@auth_bp.route('/register', methods = ['GET', 'POST'])
def register():
        
    return render_template('auth/RegisterView/RegisterView.html', form= RegisterForm())
    





