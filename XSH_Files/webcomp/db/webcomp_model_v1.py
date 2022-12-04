from pony import orm
from PonyORM.BaseClass import BasePonyORMModel


db = orm.Database()

class Webcomp(db.Entity, BasePonyORMModel ):
    compName = orm.Required(str, unique = True)
    html = orm.Optional(str)
    css = orm.Optional(str)
    tags = orm.Optional(orm.StrArray)


    

    @orm.db_session
    def getByName(name:str):
        return Webcomp.get(compName = name)
        # comp = Webcomp.get(compName = name)
        # return comp.to_dict()
    




    

        

db.bind(provider="sqlite", filename=f"Webcomp.sqlite", create_db=True)
db.generate_mapping(create_tables=True)
