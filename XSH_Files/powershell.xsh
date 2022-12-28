def _start(arg):
    if not arg:
        raise Exception("you need an argument")
    subprocess.run(["powershell.exe", f"start-process {arg[0]}"])


# Powershell aliases
aliases['start'] = _start
aliases['ls'] = "powershell -Command ls"
aliases['psrun']=  lambda command: subprocess.run(["powershell.exe", f'{command[0]}'])

'''
newitem
mkdir
newitem_ow
mkdir_ow
copy
move
'''
