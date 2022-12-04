from pony import orm
from PonyORM.BaseClass import BasePonyORMModel
from pathlib import Path
from tabulate import tabulate

db = orm.Database()

class DemosModel(db.Entity, BasePonyORMModel):
    path = orm.Required(str, unique = True)
    name = orm.Optional(str)
    bpm = orm.Optional(int)
    key = orm.Optional(str)
#- completeness
    docket = orm.Optional(bool)


    @orm.db_session
    def onDocket() -> list[dict]:
        q = orm.select( d for d in DemosModel if d.docket == True)
        return [entry.to_dict() for entry in q]

    @orm.db_session
    def addToDocket(projectPath:str) -> None:
        if not Path(projectPath).is_dir():
            raise Exception(f"cannot find {projectPath}")
        
        proj = DemosModel.get(path = projectPath)

        if not proj:
            raise Exception(f"{proj} not in db")
        else:
            proj.docket = True
            print(f'"{proj.name}" added to docket')
            #print(tabulate(proj.to_dict(),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key'} ))



    


db.bind(provider="sqlite", filename=f"Demos_Model_V1.sqlite", create_db=True)
db.generate_mapping(create_tables=True)
