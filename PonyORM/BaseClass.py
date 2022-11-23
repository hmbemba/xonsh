from pony import orm
import json

from typing import TypeVar
PonyORM_Query_Object = TypeVar('PonyORM_Query_Object')


class BasePonyORMModel:#(db.Entity):
    @orm.db_session
    def insert(self,**fieldValues):
        '''
        MyModel.insert(MyModel, key1='va1',...)
        '''
        self(**fieldValues)

    @orm.db_session
    def delById():
        ...

    @orm.db_session
    def getAll(self) -> PonyORM_Query_Object:
        return orm.select(e for e in self)

    @orm.db_session
    def getAllAsDicts(self) -> list :
        '''
        returns a list of dictionaries for each entry in the model
        '''
        return [entry.to_dict() for entry in self.getAll(self)]

    @orm.db_session
    def getAllOrderedByAsDicts(self, arg) -> list :
        '''
        returns a list of dictionaries for each entry in the model
        '''
        return [entry.to_dict() for entry in self.getAll(self).order_by(arg)]

    def validatePhoneNumber(self, val):
        if '-' in val:
            raise Exception('bad num')

    def assertEnum(sefl,val, enum):
        '''
        assert that the given value is
        within a specific enum class or raise error
        '''
        ...

    @orm.db_session
    def getQuery_JSON(query, noResultsMsg = 'No Entries Found'):
        if not query:
            return noResultsMsg
        else:
            return json.dumps([entry.to_dict() for entry in query], indent=2)

