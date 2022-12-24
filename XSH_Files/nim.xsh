

def _newnim():
    item.mkdir('src','.')
    item.mkdir('bin','.')
    nimFileContent = '''
include prelude
import std/sugar
import std/enumerate
# import pythonpathlib
import std/sequtils
import strutils
'''
    item.mkfileNoOverwrite('main.nim', './src', nimFileContent)
    commandsContent = f'''
aliases['main'] = "nim c -r -o:./bin/main src/main.nim" 
aliases['home'] = r'cd {$pwd()}' 
aliases['src'] = r'cd {$pwd()}/src' 
aliases['binn'] = r'cd {$pwd()}/bin' 
'''
    item.mkfileNoOverwrite('commands.xsh', '.', commandsContent)
    importcommands


aliases['newnim'] = _newnim