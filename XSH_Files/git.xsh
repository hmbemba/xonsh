def _gitpush(arg):
    git add '.'
    git status
    git commit -m arg
    git push origin master

## Git
aliases['gitnew'] = 'gh repo create'
aliases['gitlist'] = 'gh repo list'
aliases['gitpush'] = _gitpush
aliases['gitpull'] = 'git pull'
aliases['clone'] = 'gh repo clone'
aliases['status'] = 'git status'
