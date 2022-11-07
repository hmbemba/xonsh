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

def _openDirectory(arg):
    def help():
        print("Open Directory Command\n")
        print('Available Options\n')
        entries = od_getAll()
        print(tabulate(entries,headers={'key':'key', 'path':'path','note':'note'}, tablefmt="grid"))

    if not arg:
        help()
    else:
        if arg[0] not in od_getAllKeys(): 
            # the locaton of od_getAllKeys() is below
            # C:\ProgramData\xonsh\db\OpenDirectory_Model\V1\OpenDirectory_Model_V1.py
            help()
        else:
            entry = od_getByKey(arg[0])
            $oc f"{entry.path}"
            exit


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

# Aliases-----------------------------------
aliases['ox'] = _openXonsh
aliases['oxrc'] = _openXonshRC
aliases['od'] = _openDirectory
aliases['rf'] = _runFile
aliases['ef'] = _editFile
aliases['pullxonsh'] = _pullxonsh
aliases['pushxonsh'] = _pushxonsh
aliases['cmds'] = _commands
aliases['oc'] = $oc