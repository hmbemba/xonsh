from flask import render_template, request
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, EmailField
from wtforms.validators import DataRequired, Email
from db.models.auth.UserModel import User
import datetime
from hashlib import sha1

class RegisterForm(FlaskForm):
    firstName = StringField('First Name', validators=[DataRequired()])
    lastName = StringField('Last Name', validators=[DataRequired()])
    email =  EmailField('Email', validators=[DataRequired(), Email()])
    username = PasswordField('Password', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    


def attributeExists(attribute):
    '''
    # how to use
    if attributeExists({'username':request.form['username']}):
        return "username exists"
    '''
    return True if User.getWhere(User,**attribute) else False

def register():
    context  = {
        
    }
    
    if request.method == 'POST':
        if attributeExists({'username':request.form['username']}):
            return "User Already Exists"
        if attributeExists({'email':request.form['email']}):
            return "A user with that email already exists"
        else:
            User.insert(
                User, 
                firstName = request.form['firstName'],
                lastName = request.form['lastName'],
                email = request.form['email'],
                username = request.form['username'],
                password = sha1(request.form['password'].encode()).hexdigest(),
                registrationTimestamp = datetime.datetime.now()
                )
        return "Confirm registration with email"
    else:
        return render_template('auth/RegisterView/RegisterView.html', form= RegisterForm())
    





