$home = Path($HOMEPATH[0])
$HOME = $home
$desktop = $HOMEDRIVE /Path($HOMEPATH[0]) / "Desktop"
$scripts = $desktop / 'Scripts'
$python = $scripts / 'Python'
$apps = $python / 'Apps'
$ahk = $scripts / 'AHK'
$env = ${...}
$pwd = os.getcwd
$XONSH_SHOW_TRACEBACK = True
$xonshdir = Path($XONSHRC[0]).parent
$ssh = r"C:\Users\hmbem/.ssh/"
$oc = r"C:\Users\hmbem\Desktop\OneCommander\OneCommander.exe"


#from dataclasses import dataclass

# @dataclass
# class test:
#     def do(self):
#         print('it works')