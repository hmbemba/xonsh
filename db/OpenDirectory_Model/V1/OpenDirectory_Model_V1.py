from pony import orm
from pathlib import Path


db = orm.Database()

class OpenDirectory(db.Entity):
    key = orm.Required(str, unique=True)
    path = orm.Required(str)
    note = orm.Optional(str)
    
    # def before_insert(self):
    #     if not Path(self.path).exists():
    #         raise Exception(f'{self.path} is not a valid folder path')
        
    #     if not Path(self.path).is_dir():
    #         raise Exception(f'{self.path} is a file not a folder')
    
@orm.db_session
def od_insert(key,path, note=''):
    '''
    od_insert(key='myKey',path=r'',note='')
    '''
    OpenDirectory(key=key,path=path,note=note)

@orm.db_session
def od_printAll():
    query = orm.select(e for e in OpenDirectory)
    for q in query:
        print(f'''
            key: {q.key}
            path: {q.path}
            note: {q.note}
            '''
        )
        
@orm.db_session
def od_getAll():
    return [{'key':entry.key, 'path':entry.path, 'note':entry.note} for entry in orm.select(e for e in OpenDirectory)]

@orm.db_session
def od_getAllKeys():
    query = orm.select(e.key for e in OpenDirectory)
    return list(query)

@orm.db_session
def od_delByKey(key):
    try:
        OpenDirectory.get(key=key).delete()
        print('Delete Success')
    except Exception as e:
        print(e)
        

db.bind(provider="sqlite", filename=f"OpenDirectory_V1.sqlite", create_db=True)
db.generate_mapping(create_tables=True)
