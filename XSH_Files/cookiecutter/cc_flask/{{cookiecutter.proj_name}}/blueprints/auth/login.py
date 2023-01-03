from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, EmailField
from wtforms.validators import DataRequired
from flask import render_template, request
from db.models.auth.UserModel import User
from flask_login import login_user
from hashlib import sha1
import datetime



class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    
def login():
    context  = {
        
    }
        
    if request.method == 'POST':
        uname = str(request.form['username'])
        password = request.form['password']
        user = User.getWhere(User,username=uname, password=sha1(password.encode()).hexdigest())
        if not user:
                return "User is not existing!"
        if not login_user(user):
            return "something went wrong!"
        User.updateById(User, user.id, last_login = datetime.datetime.now(), active = True)
        return "Signed in successfully!"
    else:
        return render_template('auth/LoginView/LoginView.html' , form= LoginForm())


    





