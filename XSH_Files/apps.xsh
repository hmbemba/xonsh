# Functions------------------------
def _otf():
    cd fr"{$desktop}\Scripts\Python\Apps\ObsidianTextFormatter"#,"vox", "enter"python","main.py"]#['python', fr"{$desktop}\Scripts\Python\Apps\ObsidianTextFormatter\main.py"]
    vox enter venv
    python "main.py"

def _sdb(arg):
    cd fr"{$desktop}\Scripts\Python\Apps\Songdb"
    vox enter venv

def _workon(arg):
    import datetime

    tempProjectsFolder = fr"{$scripts}\Temp_Projects"
    item.FolderExistsOrError(tempProjectsFolder)
    date = datetime.datetime.now().strftime(r'%m-%d-%y_%H-%M') #MM-dd-yy_hh-mmtt
    
    name = f"{arg[0]}_{date}"
    fullPath = Path(f"{tempProjectsFolder}\\{name}")

    if arg[0] == "show":
        subprocess.run(["powershell.exe", f"start-process {tempProjectsFolder}"])
        exit
    
    else:
        Path.mkdir(fullPath)
        subprocess.run(["powershell.exe", f"code {fullPath}"])
        exit 

# Aliases------------------------------
aliases['workon'] = _workon
aliases['otf'] = _otf
aliases['inv'] = ['code', fr"{$apps}\Invoice_App"]
aliases['sdb'] = _sdb
aliases['todo'] = ['python', fr'{$apps}\Todo\main.py']
aliases['helium'] = ['code', fr"{$apps}\helium_WORKING"]