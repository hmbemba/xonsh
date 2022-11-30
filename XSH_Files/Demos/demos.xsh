# from dataclasses import dataclass, field
# from typing import Any, List
# import inspect
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




# @dataclass
# class SeshMngr:
#     registry: List = field(default_factory=lambda: [])

#     def start(self):
#         print('hey')
#         '''
#         read this file line by line

#         # 
#         '''

#     @registerSeshAlias('dock')
#     def _docket():#(args):
#         print('running docket')
#         # if not args:
#         #     print(tabulate(DemosModel.onDocket(),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))
#         # else:
#         #     DemosModel.addToDocket(args[0])

# DemoSessions  = SeshMngr()



def _docket(args):
    if not args:
        print(tabulate(DemosModel.onDocket(),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))
    else:
        DemosModel.addToDocket(args[0])


aliases['demos_getall'] = lambda: print(tabulate(DemosModel.getAllAsDicts(DemosModel),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))

aliases['docket'] = _docket

