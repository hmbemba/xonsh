od_table = Table(title="Open Directory Command",)

for item in ['key', 'path', 'note']:
    od_table.add_column(item)

def _openDirectory(arg):
    def help():
        entries = od_getAll()
        for entry in entries:
            od_table.add_row(entry['key'], f"[link={entry['path']}]{entry['path']}[/link]", entry['note'])
            # if '$' in entry['path']:
            #     if '\\' in entry['path']:
            #         split = entry['path'].split('\\')
            #         body = '\\'.join(split[1:])
            #         full = split[0] + '\\'+ body
            #         print(execx(full))
            #     else:
            #         print(evalx(entry['path']))


        console = Console()
        console.print(od_table)

    if not arg:
        help()
    else:
        if arg[0] not in od_getAllKeys(): 
            help()
        else:
            entry = od_getByKey(arg[0])
            $oc f"{entry.path}"
            exit

aliases['od'] = _openDirectory