from pony import orm
from PonyORM.BaseClass import BasePonyORMModel

db = orm.Database()

class DemosModel(db.Entity, BasePonyORMModel):
    path = orm.Required(str, unique = True)
    name = orm.Optional(str)
    bpm = orm.Optional(int)
    key = orm.Optional(str)
#- completeness
    docket = orm.Optional(bool)


    def insert(**kwargs):
        super().insert(DemosModel, **kwargs)

    

    
# @orm.db_session
# def od_insert(key,path, note=''):
#     '''
#     od_insert(key='myKey',path=r'',note='')
#     '''
#     OpenDirectory(key=key,path=path,note=note)

# @orm.db_session
# def od_printAll():
#     query = orm.select(e for e in OpenDirectory)
#     for q in query:
#         print(f'''
#             key: {q.key}
#             path: {q.path}
#             note: {q.note}
#             '''
#         )
        
# @orm.db_session
# def od_getAll():
#     return [{'key':entry.key, 'path':entry.path, 'note':entry.note} for entry in orm.select(e for e in OpenDirectory)]

# @orm.db_session
# def od_getAllKeys():
#     query = orm.select(e.key for e in OpenDirectory)
#     return list(query)

# @orm.db_session
# def od_getByKey(key):
#     #query = orm.select(e.key for e in OpenDirectory)
#     return OpenDirectory.get(key=key) #list(query)

# @orm.db_session
# def od_delByKey(key):
#     try:
#         OpenDirectory.get(key=key).delete()
#         print('Delete Success')
#     except Exception as e:
#         print(e)
        

# db.bind(provider="sqlite", filename=f"Demos_Model_V1.sqlite", create_db=True)
# db.generate_mapping(create_tables=True)
