from dataclasses import dataclass, field
from typing import Any, List
import inspect

def printMyFuncs(filePath: str = __file__):
    with open(Path(filePath),'r') as f:
        pp.pprint({count:line.split(" ")[1].split('(')[0] for count, line in enumerate(f.readlines()) if re.findall("^def _", line)})
        #pp.pprint(sorted({count:line.split(" ")[1].split('(')[0] for count, line in enumerate(f.readlines()) if re.findall("^def _", line)}.items(), key = lambda d: d[1]))
        #print([{'...':line.split(" ")[1].split('(')[0]} for line in f.readlines() if re.findall("^def _", line)])

def _docket(self,args):
    if not args:
        print(tabulate(DemosModel.onDocket(),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))
    else:
        DemosModel.addToDocket(args[0])

def _getAll() -> None:
    print(tabulate(DemosModel.getAllAsDicts(DemosModel),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))




aliases['demos_getall'] = _getAll 
aliases['demos_pmf'] = lambda: printMyFuncs()
aliases['demos_docket'] = _docket






