# from dataclasses import dataclass, field
# from typing import Any, List
# # from abc import ABCMeta, abstractmethod
# # from dotenv import load_dotenv

# @dataclass
# class SeshMngr:
#     registry: List = field(default_factory=lambda: [])

#     def start(self):
#         ...
#         '''
#         read this file line by line

#         # 
#         '''

# DemoSessions  = SeshMngr()

# def registerSeshAlias(alias:str):
#     def middle(func):
#         def inner():
#             DemoSessions.registry.append(f"{alias} : {func.__name__}")
#             func()

#         return inner
#     return middle


#@registerSeshAlias('dock')
def _docket():#(args):
    if not args:
        print(tabulate(DemosModel.onDocket(),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))
    else:
        DemosModel.addToDocket(args[0])


aliases['demos_getall'] = lambda: print(tabulate(DemosModel.getAllAsDicts(DemosModel),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))

aliases['docket'] = _docket

