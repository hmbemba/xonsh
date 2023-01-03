from pony import orm
from db.PonyORM_Wrapper.PonyORMWrapper import BasePonyORMModel
from datetime import datetime
from pony.flask import Pony
from flask_login import UserMixin
from flask_login_config import login_manager
from init_app import app
import fire


db = orm.Database()

class User(db.Entity,BasePonyORMModel, UserMixin):
    
    # Required Attributes
    firstName = orm.Required(str)
    lastName = orm.Required(str)
    email = orm.Required(str, unique = True)
    password = orm.Required(str)
    username = orm.Required(str, unique=True)
    registrationTimestamp = orm.Required(datetime)

    # Optional Attributes
    last_login = orm.Optional(datetime)
    active = orm.Optional(bool)

    
    '''
    how to hash the password?
    '''
    
    def fullName(self, userId):
        ...
    
    def delUser(self, userId):
        '''
        self.delWhere
        '''
        ...
    
    def resetPwd(self, userId):
        '''
        self.updateWhere

        '''
        ...


    


    
db.bind(provider="sqlite", filename="db.sqlite", create_db=True)
db.generate_mapping(create_tables=True)

@login_manager.user_loader  # configuring the login endpoint
def load_user(user_id):
    return User.get(id=user_id)

Pony(app)