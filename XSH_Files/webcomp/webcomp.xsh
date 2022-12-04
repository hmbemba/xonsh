def _webcomp_insert(args):
    '''
    # Usage

    _webcomp_insert <compName> f'{h}' f'{c}' f'{t}'
    '''
    compName  = args[0]
    html   = args[1]
    css  = args[2]
    #tags  = args[3]

    # turn this into a dict and destructure it
    
    w = Webcomp.insert(Webcomp, compName = compName, html = html, css = css)#, tags = tags)
    print(f'inserted {w}')


def _dlwebcomp(args):
    path = Path(args[0])
    compId = args[1]

    print(path, compId)




aliases['webcomp_insert'] = _webcomp_insert
aliases['dlwebcomp'] = _dlwebcomp