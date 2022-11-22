def _nimnew():
    item.mkdir('src','.')
    item.mkdir('bin','.')
    item.mkfileNoOverwrite('main.nim', './src')
    commandsContent = '''
aliases['main'] = "nim c -r -o:./bin/main src/main.nim"  
'''
    item.mkfileNoOverwrite('commands.xsh', '.', commandsContent)
    importcommands


aliases['nimnew'] = _nimnew