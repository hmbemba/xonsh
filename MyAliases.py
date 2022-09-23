from dataclasses import dataclass, field
from abc import ABCMeta, abstractmethod
from typing import List


@dataclass
class AliasBase(metaclass=ABCMeta):
    '''
    Doc strings go here
    '''
    aliasKeyword:str
    
    @abstractmethod
    def do(self):
        ...
    
    def doc(self):
        print(self.__doc__)

@dataclass
class AliasRegistry:
    aliases: List = field(default_factory=lambda: [])
    
    def addAlias(alias:AliasBase):
        ...
    
    def run(self):
        for alias in self.aliases:
            __xonsh__.aliases |= {alias.aliasKeyword:alias.do}
        
        
# p = Alias()

# print(p.doc())

