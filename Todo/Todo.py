import subprocess
from dataclasses import dataclass, field
from typing import Any, Callable, List
from consolemenu import *
from consolemenu.items import *
import json

mainMenu = ConsoleMenu("Todo's")


@dataclass
class Task:
    name: str
    subTasks: List = field(default_factory=lambda: [])

    def addSubTask(self, subtask):
        self.subTasks.append(subtask)

    def menuItem(self):
        menu = ConsoleMenu(self.name + " Subtasks")
        for subtask in self.subTasks:
            menu.append_item(subtask.menuItem())
        return SubmenuItem(self.name, menu)


@dataclass
class SubTask:
    description: str
    completed: bool = False
    actions: List = field(default_factory=lambda: [])

    def menuItem(self):
        menu = ConsoleMenu(self.description + " Actions")
        for action in self.actions:
            menu.append_item(
                FunctionItem(
                    text=action.description,
                    function=action.callback,
                    menu=menu,
                )
            )
        return SubmenuItem(
            f"[x] {self.description}" if self.completed else f"[ ] {self.description}",
            menu,
        )


@dataclass
class Action:
    description: str
    callback: Callable

    def do(self):
        try:
            self.callback()
        except Exception as e:
            print(e)


tjs = Task("Complete Three JS Course")
tjs.addSubTask(
    SubTask(
        description="Complete Lesson 1",
        actions=[
            Action(
                "open Three JS Site",
                lambda: subprocess.run(
                    [
                        "powershell.exe",
                        r"start-process https://threejs-journey.com/lessons/1",
                    ]
                ),
            ),
            Action(
                "open obsidian page",
                lambda: subprocess.run(
                    [
                        "powershell.exe",
                        r'start-process obsidian://advanced-uri?vault=MySyncVault"&"filepath=Docs%2520-%2520ThreeJS.md"&"heading=Links',
                    ]
                ),
            ),
        ],
    )
)


todos = [
    tjs,
    FunctionItem(
        text="Daily Read",
        function=lambda: subprocess.run(["powershell.exe",r'start-process obsidian://open?vault=MySyncVault"&"file=Daily%20Read',]
        ),
        menu=mainMenu,
    ),
]


for task in todos:
    if isinstance(task, Task):
        mainMenu.append_item(task.menuItem())
    else:
        mainMenu.append_item(task)



Todo1 = {
    'name':'Complete ThreeJS Course',
    'subTasks':{
        {
            'description':'Complete Lesson 1',
            'actions':{
                'Open Site':...,
                'Open Obsidian':...
            }
        },
    }
}
