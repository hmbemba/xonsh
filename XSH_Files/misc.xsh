# Imports
import json

# Functions--------------------------------
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
    exit

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

# Aliases----------------
aliases['studiopics'] = _sp
aliases['newflproj'] = _newFLProj
aliases['vimm'] = lambda x: subprocess.run(["powershell.exe",f'vim "{x}"'])
