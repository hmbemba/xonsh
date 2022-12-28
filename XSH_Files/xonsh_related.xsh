# Functions
def _pullxonsh():
    cd $xonshdir
    git pull

def _pushxonsh(arg):
    cd $xonshdir
    _gitpush(arg)

def _openXonsh():
    subprocess.run(['powershell.exe', f'code "{Path($XONSHRC[0]).parent}"'])
    exit

def _openXonshRC():
    subprocess.run(['powershell.exe', f'code "{Path($XONSHRC[0])}"'])
    exit

def _commands():
    pp.pprint(list(__xonsh__.aliases)[52:])



def _runFile(arg):
    def help():
        print("Run File Command\n")
        print('Available Options\n')
        for option in options:
            print('\t',option['key'], ' : ', f'"{option["path"]}"',' | ', option['note'], '\n' )

    options = [
        {
            'key':'pysnip',
            'path':fr"{$ahk}\Code_Snippets\Python_Snippets\Python_Snippets.ahk",
            'note':'Python Snippets'
        },

    ]

    if not arg:
        help()
    else:
        if arg[0] not in [option['key'] for option in options]:
            help()
        else:
            for option in options:
                if arg[0] == option['key']:
                    subprocess.run(["powershell.exe", f'start-process "{option["path"]}" '])

def _editFile(arg):
    def help():
        print("Edit File Command\n")
        print('Available Options\n')
        for option in options:
            print('\t',option['key'],' : ', f'"{option["note"]}"', '\n' )
    
    options = [
        {
            'key':'pysnip',
            'editStr':fr"code {$ahk}\Code_Snippets\Python_Snippets\Python_Snippets.ahk",
            'note':'Edit Python Snippets'
        },
        {
            'key':'sdb',
            'editStr':fr"code {$desktop}\Scripts\Python\Apps\Songdb",
            'note':'Edit Songdb'
        },
        {
            'key':'todo',
            'editStr':fr"code C:\Users\hmbem\Desktop\Scripts\Python\Apps\Todo\TaskInstances.py",
            'note':'Edit Todo App'
        },
    ]

    if not arg:
        help()
    else:
        if arg[0] not in [option['key'] for option in options]:
            help()
        else:
            for option in options:
                if arg[0] == option['key']:
                    filePath = option['editStr'].split(' ')[1]
                    if not Path(filePath).exists():
                        raise Exception(f'Path "{filePath}" not found')
                    subprocess.run(["powershell.exe", f'{option["editStr"]}'])

def _importCommands():
    fileName = "commands.xsh"
    pathToCommands = Path($pwd()) / fileName
    if pathToCommands.exists():
        source f"{pathToCommands}"
        print(f"successfully sourced {fileName}")
    else:
        print(f'''
        Couldn't find "{fileName}"
        Was expecting to be here

        {pathToCommands}
        ''')

def _glob():
    pyperclip.copy('p`.*`')
    print('p`.*` pushed to clipboard')
# Aliases-----------------------------------
aliases['ox'] = _openXonsh
aliases['oxrc'] = _openXonshRC

aliases['rf'] = _runFile
aliases['ef'] = _editFile
aliases['pullxonsh'] = _pullxonsh
aliases['plx'] = _pullxonsh
aliases['pushxonsh'] = _pushxonsh
aliases['psx'] = _pushxonsh
aliases['cmds'] = _commands
aliases['oc'] = $oc
aliases['importcommands'] = _importCommands
aliases['glob'] = _glob
