$sitename = 'hmbemba.pythonanywhere.com'

def _sdb_insert(arg):
    url = arg[0]
    curl --data f'url={url}' f"{$sitename}/sdb/insert"

def _getAll_orderedBy(args):
    arg = args[0]
    #print(arg)
    curl f"{$sitename}/sdb/getall/orderedby/{arg}"

def _sdb_getbybpm(args):
    bpm = args[0]
    plusMinus = 10
    if len(args) > 1:
        plusMinus = args[1]
    
    curl f"{$sitename}/sdb/getbybpm/{bpm}/{plusMinus}"


def _sdb_sampleThis(args):
    if args:
        url = args[0]
        curl --data f'url={url}' f"{$sitename}/sdb/addSampleThisTag"
    else:
        curl f"{$sitename}/sdb/getAllWithSampleThisTag"

aliases['sdb_insert'] = _sdb_insert
aliases['sdb_getall'] = f"curl {$sitename}/sdb/getall"
aliases['sdb_getall_orderedby'] = _getAll_orderedBy
aliases['sdb_getbybpm'] = _sdb_getbybpm
aliases['sdb_samplethis'] = _sdb_sampleThis


