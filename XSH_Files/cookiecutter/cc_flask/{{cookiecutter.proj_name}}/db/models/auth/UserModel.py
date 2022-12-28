from pony import orm
from db.PonyORM_Wrapper.PonyORMWrapper import BasePonyORMModel



db = orm.Database()



class User(db.Entity,BasePonyORMModel):
    firstName = orm.Required(str, unique = True)
    lastName = orm.Required(str, unique = True)
    Email = orm.Required(str)
    Password = orm.Required(str)
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