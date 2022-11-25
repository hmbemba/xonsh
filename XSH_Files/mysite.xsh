$sitename = 'hmbemba.pythonanywhere.com'

def formatUrl(url):
    return url.split('?')[0]

def _sdb_insert(arg):
    url = formatUrl(arg[0])
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
        url = formatUrl(args[0])
        curl --data f'url={url}' f"{$sitename}/sdb/addSampleThisTag"
    else:
        curl f"{$sitename}/sdb/getAllWithSampleThisTag"

@noArgMsg(acceptableArgs = "a properly formatted spotify track url")
def _sdb_getByUrl(args):
    url = formatUrl(args[0])
    curl --data f'url={url}' f"{$sitename}/sdb/getbyurl"


@noArgMsg()
def _sdb_getByArtist(args):
    artist = formatUrl(args[0])
    curl --data f'artist={artist}' f"{$sitename}/sdb/getbyartist"

#@noArgMsg()
def _sdb_getAll(args):
    '''
    can accepts  a start and step arg like this "sdb_getall 100 100"
    Will return all entries starting at entry 100 w/ a step of 100
    '''
    if args:
        start = args[0]
        if len(args) > 1:
            step = args[1]
        else:
            step = 1
    else:
        start = 0
        step = 1
    curl --data f'start={start}&step={step}' f"{$sitename}/sdb/getall"


aliases['sdb_insert'] = _sdb_insert
aliases['sdb_getall'] = _sdb_getAll#f"curl {$sitename}/sdb/getall"
aliases['sdb_getall_orderedby'] = _getAll_orderedBy
aliases['sdb_getbybpm'] = _sdb_getbybpm
aliases['sdb_samplethis'] = _sdb_sampleThis
aliases['sdbst'] = _sdb_sampleThis
aliases['sdb_getbyurl'] = _sdb_getByUrl
aliases['sdb_getbyartist'] = _sdb_getByArtist


