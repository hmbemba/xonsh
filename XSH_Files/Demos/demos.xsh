from dataclasses import dataclass, field
from typing import Any, List
import inspect
# from functools import wraps


# from abc import ABCMeta, abstractmethod
# from dotenv import load_dotenv

# def registerSeshAlias(alias:str):
#     def middle(func):
#         @wraps(func)
#         def inner(register = False):
#             if register:
#                 print('registered')
#                 DemoSessions.registry.append(f"{alias} : {func.__name__}")
#             else:
#                 func()

#         return inner
#     return middle




@dataclass
class Demosdb:
    sessionAliases: List = field(default_factory=lambda: [])


    def printMyFuncs(self):
        for func in inspect.getmembers(self, predicate=inspect.ismethod):
            if func[0][0] == '_':
                print(f':"{func[0]}"}},')
	# def startSesh
	# def endSesh

    def startSession(self):
        ...

    def endSession(self):
        ...


    def _docket(self,args):
        #print('running docket')
        if not args:
            print(tabulate(DemosModel.onDocket(),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))
        else:
            DemosModel.addToDocket(args[0])

d = Demosdb()





# def _docket(args):
#     if not args:
#         print(tabulate(DemosModel.onDocket(),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))
#     else:
#         DemosModel.addToDocket(args[0])


#aliases['demos_getall'] = lambda: print(tabulate(DemosModel.getAllAsDicts(DemosModel),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))

aliases['docket'] = d._docket

