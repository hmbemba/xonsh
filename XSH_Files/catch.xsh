def noArgMsg(msg:str = 'This command requires an argument, the acceptable args are: ', acceptableArgs:list[str] = []):
    ''' 
    Will print a message when there is no arg provided on a command 
    '''
    def decorate(fn):
        @wraps(fn)
        def wrapper(*args):
            if not args[0]:
                #print(fn.__name__)
                return msg + ( str(acceptableArgs) if acceptableArgs else "")
            fn(args[0])
        return wrapper
    return decorate

def noArgErr(msg:str = 'This command requires an argument, the acceptable args are: ', acceptableArgs:list[str] = []):
    ''' 
    Will raise an error when there is no arg provided on a command 
    '''
    def decorate(fn):
        @wraps(fn)
        def wrapper(*args):
            if not args[0]:
                raise Exception(msg + ( str(acceptableArgs) if acceptableArgs else ""))
            fn(args[0])
        return wrapper
    return decorate
