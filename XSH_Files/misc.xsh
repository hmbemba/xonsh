# Functions--------------------------------

@noArgMsg()
def _newFLProj(projName:str):
    folders = [
        projName[0],
        fr"{projName[0]}/2_Production",
        fr"{projName[0]}/3_Mix",
        fr"{projName[0]}/4_Master",
        fr"{projName[0]}/1_OG_Demo"
    ]
  
    for folder in folders:
        item.mkdir(folder, '.')
    #exit

def ppjson(jsonStr:str):
    '''pretty prints a JSON string'''
    parsed = json.loads(jsonStr)
    print(json.dumps(parsed, indent=4))

def timestamp() -> str:
    dt = datetime.datetime.now()
    return dt.strftime("%m_%d_%Y-%I_%M%p")

def _sp():
    '''Studio Pics
    
    This function creates a bunch of folders
    in my visuals drive the way I like
    '''
    if $COMPUTERNAME != 'DESKTOP-I5FROLF':
        raise Exception('Wrong Computer')
    t = timestamp()
    item.mkdir(f"StudioPics_{t}", r"V:\Projects\IG Content\Studio Pics")
    loc = fr"V:\Projects\IG Content\Studio Pics\StudioPics_{t}"
    item.mkdir(f"Unedited", loc)
    item.mkdir(f"Edited", loc)
    subprocess.run(["powershell.exe", f'start-process "{loc}"'])
    subprocess.run(["powershell.exe", fr'start-process "C:\ProgramData\Microsoft\Windows\Start Menu\Luminar AI.lnk"'])

def getSystemInfo():
    try:
        info={}
        info['platform']=platform.system()
        info['platform-release']=platform.release()
        info['platform-version']=platform.version()
        info['architecture']=platform.machine()
        info['hostname']=socket.gethostname()
        info['ip-address']=socket.gethostbyname(socket.gethostname())
        info['mac-address']=':'.join(re.findall('..', '%012x' % uuid.getnode()))
        info['processor']=platform.processor()
        info['ram']=str(round(psutil.virtual_memory().total / (1024.0 **3)))+" GB"
        return info
    except Exception as e:
        #logging.exception(e)
        print(e)

def _geticon(args):
    if not args:
        cd $svg 
        for path in p`.*`:
            print(path.absolute())
    else:
        svgPath = str(args[0])
        svgName = Path(args[0]).stem.lower().replace(' ', '_')
        dst = str(args[1]) if len(args) == 2 else ''
        with open(svgPath) as f:
            svgContent = f.read()
            
        svgMacro = f'''
    {{% macro {svgName}() -%}}
        {svgContent}
    {{%- endmacro %}}
    '''
        howToUse = f'''
        ###############
        HOW TO USE
        {{% from 'macros/{svgName}.html' import Plus %}}

        {{{{{svgName}()}}}}
                '''

        if len(args) == 1:
            print(svgMacro)
            print(howToUse)
        if len(args) == 2:
            psrun f''' New-Item -Path {dst} -Name "{svgName}.html" -ItemType "file" -Value '{svgMacro}' '''
            print(howToUse)
        if len(args) > 2:
            print('''
This command only takes 2 arguments - the path to the desired svg and the destination copy path' like so:
"geticon 'Apps.svg' '.'"
            ''')


# Aliases----------------
aliases['studiopics'] = _sp
aliases['newflproj'] = _newFLProj
aliases['vimm'] = lambda x: subprocess.run(["powershell.exe",f'vim "{x}"'])
aliases['sys'] = lambda: pp.pprint(getSystemInfo())
aliases['pushahk'] = f'cd {$ahk} ; gitpush'
aliases['pullahk'] = f'cd {$ahk} ; gitpull'
aliases['vs_term_settings'] = f'code {$vscode_terminal_settings} '
aliases['geticon'] = _geticon