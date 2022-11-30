$sitename = 'hmbemba.pythonanywhere.com'
__cmds = {
        'insert':'sdb_insert', 
        'getall':'sdb_getall', 
        'getall_orderedby':'sdb_getall_orderedby', 
        'getbybpm':'sdb_getbybpm', 
        'samplethis':'sdb_samplethis', 
        'getbyurl':'sdb_getbyurl', 
        'getbyartist':'sdb_getbyartist',
        'addTagsToId':'sdb_addTagsToId', 
        'clearTagsById':'sdb_clearTagsById',
        'getbytag':'sdb_getbytag'
    }

def formatUrl(url):
    return url.split('?')[0]

@noArgMsg(acceptableArgs = "a spotify playlist url")
def _sdb_insert(arg):
    url = formatUrl(arg[0])
    curl --data f'url={url}' f"{$sitename}/sdb/insert"

def _getAll_orderedBy(args):
    arg = args[0]
    curl f"{$sitename}/sdb/getall/orderedby/{arg}"

@noArgMsg(acceptableArgs = '<bpm> <plusOrMinus: default 10> "getbybpm 90 5" ' )
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

@noArgMsg(acceptableArgs = '<start> <step> getall 10 100')
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

def _startSdbSession():

    __xonsh__.aliases.update(**__cmds)
    print('SDB Session Started')
    pp.pprint(__cmds)

def _endSdbSession():
    for item in __cmds.keys():
        del __xonsh__.aliases[item]
    print('SDB Session Ended')

@noArgMsg(acceptableArgs = '<SongID> tag1 tag2 tag3 ...')
def _addTagsToId(args):
    songId = args[0]
    tags = args[1:]
    curl --data f'id={songId}&tags={tags}' f"{$sitename}/sdb/addtagstoid"

@noArgMsg(acceptableArgs = '<SongID>')
def _clearTagsById(args):
    songId = args[0]
    curl --data f'id={songId}' f"{$sitename}/sdb/cleartagsbyid"

@noArgMsg(acceptableArgs = '<tag>')
def _getByTag(args):
    tag = args[0]
    curl --data f'tag={tag}' f"{$sitename}/sdb/getbytag"

@noArgMsg(acceptableArgs = '<url> tag1 tag2 tag3 ..')
def _addTagsByUrl(args):
    ...

# @noArgMsg(acceptableArgs = '<tag> id1 id2 id3...')
# def _addTagToManyIds(args)
#     ...
    # tag = args[0]
    # songIds = args[1:]

# getAllTags?
# @noArgMsg(acceptableArgs  = '')
# def addGenreToIDs(args):
#     ...

# @noArgMsg(acceptableArgs = '')
# def addSubgenreToIds(args):
#     ...

aliases['sdb_insert'] = _sdb_insert
aliases['sdb_getall'] = _sdb_getAll#f"curl {$sitename}/sdb/getall"
aliases['sdb_getall_orderedby'] = _getAll_orderedBy
aliases['sdb_getbybpm'] = _sdb_getbybpm
aliases['sdb_samplethis'] = _sdb_sampleThis
aliases['sdbst'] = _sdb_sampleThis
aliases['sdb_getbyurl'] = _sdb_getByUrl
aliases['sdb_getbyartist'] = _sdb_getByArtist
aliases['sdb'] = _startSdbSession
aliases['sdb_end'] = _endSdbSession
aliases['sdb_addTagsToId'] = _addTagsToId
aliases['sdb_clearTagsById'] = _clearTagsById
aliases['sdb_getbytag'] = _getByTag


