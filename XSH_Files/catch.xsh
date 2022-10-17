def noArgMsg(msg:str = 'This command requires an argument'):
    ''' 
    Will print a message when there is no arg provided on a command 
    '''
    def decorate(fn):
        @wraps(fn)
        def wrapper(*args):
            if not args[0]:
                #print(fn.__name__)
                return msg
            fn(args[0])
        return wrapper
    return decorate

def noArgErr(msg:str = 'This command requires an argument'):
    ''' 
    Will print a message when there is no arg provided on a command 
    '''
    def decorate(fn):
        @wraps(fn)
        def wrapper(*args):
            if not args[0]:
                raise Exception(msg)
            fn(args[0])
        return wrapper
    return decorate

# @noArgMsg()
# def _test(arg):
#     print('this works' )
#     print(arg)
#     print(type(arg))


# aliases['tt'] = _test