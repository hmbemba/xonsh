def _docket(args):
    if not args:
        print(tabulate(DemosModel.onDocket(),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))
    else:
        DemosModel.addToDocket(args[0])


aliases['demos_getall'] = lambda: print(tabulate(DemosModel.getAllAsDicts(DemosModel),headers={'path':'path', 'name':'name','bpm':'bpm','key':'key',} ))

aliases['docket'] = _docket

