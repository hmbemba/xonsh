isFile = where(lambda x: Path(x).is_file())
isDir = where(lambda x: Path(x).is_dir())
trueIfDir = select(lambda x: True if Path(x).is_dir() else False )
trueIfFile = select(lambda x: True if Path(x).is_file() else False )
allDirsExist = lambda listOfDirPaths: all([dir for dir in listOfDirPaths | trueIfDir])

