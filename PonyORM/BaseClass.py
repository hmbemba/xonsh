from pony import orm
import json

from typing import TypeVar
PonyORM_Query_Object = TypeVar('PonyORM_Query_Object')


class BasePonyORMModel:
    @orm.db_session
    def insert(self,**fieldValues):
        '''
        MyModel.insert(MyModel, key1='va1',...)
        '''
        return self(**fieldValues)

    @orm.db_session
    def delWhere(self,**kwargs) -> str:
        entry = self.get(**kwargs)
        entry.delete()

    @orm.db_session
    def updateById(self,id,**kwargs) -> str:
        entry = self.get(id = id)
        entry.set(**kwargs)

    @orm.db_session
    def getWhere(self,**kwargs) -> PonyORM_Query_Object:
        return self.get(**kwargs)

    @orm.db_session
    def getWhereAsDict(self,**kwargs) -> PonyORM_Query_Object:
        return self.get(**kwargs).to_dict()

    @orm.db_session
    def getAll(self) -> PonyORM_Query_Object:
        return orm.select(e for e in self)

    @orm.db_session
    def getAllAsDicts(self) -> list :
        return [entry.to_dict() for entry in self.getAll(self)]

    @orm.db_session
    def getAllOrderedByAsDicts(self, arg) -> list :
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
    def getQuery_JSON(query, noResultsMsg = 'No Entries Found'): #  -> json | str
        if not query:
            return noResultsMsg
        else:
            return json.dumps([entry.to_dict() for entry in query], indent=2)

