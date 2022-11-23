def _openDirectory(arg):
    def help():
        print("Open Directory Command\n")
        print('Available Options\n')
        entries = od_getAll()
        print(tabulate(entries,headers={'key':'key', 'path':'path','note':'note'}, tablefmt="grid"))

    if not arg:
        help()
    else:
        if arg[0] not in od_getAllKeys(): 
            # the locaton of od_getAllKeys() is below
            # C:\ProgramData\xonsh\db\OpenDirectory_Model\V1\OpenDirectory_Model_V1.py
            help()
        else:
            entry = od_getByKey(arg[0])
            $oc f"{entry.path}"
            exit

aliases['od'] = _openDirectory