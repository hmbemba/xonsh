$sitename = 'hmbemba.pythonanywhere.com'

def _sdb_insert(arg):
    url = arg[0]
    curl --data f'url={url}' f"{$sitename}/sdb/insert"

def _sdb_getbybpm(arg):
    bpm = arg[0]
    curl f"{$sitename}/sdb/getbybpm/{bpm}"

aliases['sdb_insert'] = _sdb_insert
aliases['sdb_getall'] = f"curl {$sitename}/sdb/getall"
aliases['sdb_getbybpm'] = _sdb_getbybpm


