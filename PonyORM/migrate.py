from pony import orm

@orm.db_session
def migrate(oldModel, newModel):
    '''Fiileds to not migrate,

    Fields toigarte on a special way(fieldName, callback)
    '''
    oldModelEntries = orm.select(e for e in oldModel)
    for entry in oldModelEntries:
        newModel(**{key:val for key,val in entry.to_dict().items() if key !='id'})