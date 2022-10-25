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
        for option in options:
            print('\t',option['key'], ' : ', f'"{option["path"]}"',' | ', option['note'], '\n' )

    options = [
        {
            'key':'apps',
            'path':fr"{$desktop}\Scripts\Python\Apps",
            'note':'Apps folder in Python dir'
        },
        {
            'key':'scripts',
            'path':$scripts,
            'note':'Scripts folder'
        },
        {
            'key':'py',
            'path':$python,
            'note':'Python dir in Scripts folder'
        },
        {
            'key':'python',
            'path':$python,
            'note':'Python dir in Scripts folder'
        },
        {
            'key':'ahk',
            'path':$ahk,
            'note':'AHK dir in Scripts folder'
        },
        {
            'key':'stupics',
            'path':r"V:\Projects\IG Content\Studio Pics",
            'note':'Studio Pics Folder'
        },
        {
            'key':'user',
            'path':r"D:\User",
            'note':'FL Samples'
        },
        {
            'key':'george_demos',
            'path':r"D:\FL Projects\George\DEMOS",
            'note':''
        },
        {
            'key':'titkok_remixes',
            'path':r"D:\FL Projects\George\DEMOS\TikTok_Remixes",
            'note':'Tik Tok Remix Productions'
        },
        {
            'key':'dbs',
            'path':r"C:\Users\hmbem\Desktop\Scripts\Python\Databases",
            'note':'Databases'
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
                    f = Folder(f"{option['path']}")
                    $oc f"{option['path']}"
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