$env = ${...}
$XONSH_SHOW_TRACEBACK = True
$xonshdir = Path($XONSHRC[0]).parent

$home = Path($HOMEPATH[0])
$HOME = $home

$desktop = $HOMEDRIVE / $home / "Desktop"
$scripts = $desktop / 'Scripts'
$python = $scripts / 'Python'
$apps = $python / 'Apps'
$ahk = $scripts / 'AHK'

$pwd = os.getcwd

$ssh = r"C:\Users\hmbem/.ssh/"

'''One Commander'''
$oc = fr"{$desktop}\OneCommander\OneCommander.exe"

'''vs code'''
$vscode_terminal_settings = Path($home) / 'AppData' / 'Roaming' / 'Code' / 'User' / 'settings.json'

'''SVG'''
$svg = Path(fr'{$xonshdir}\SVG')
