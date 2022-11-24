@noArgMsg()
def _newDeck(args):
    deckName = args[0]
    
    subdecks = ''
    if len(args) > 1:
        for arg in args[1:]:
            subdecks += f'::{arg}'
    
    full = deckName + subdecks
    
    req = f'''
        {{
            "action": "createDeck",
            "version": 6,
            "params": {{
                "deck": "{full}"
            }}
        }}
        '''
    curl localhost:8765 -X POST -d f'{req}'


def addCard(args):
    deckName = ''
    front = ''
    back = ''
    tags  = ''

    req = f'''
{{
    "action": "addNote",
    "version": 6,
    "params": {{
        "note": {{
            "deckName": "{deckName}",
            "modelName": "Basic",
            "fields": {{
                "Front": "{front}",
                "Back": "{back}"
            }},
            "options": {{
                "allowDuplicate": false,
                "duplicateScope": "deck",
                "duplicateScopeOptions": {{
                    "deckName": "Default",
                    "checkChildren": false,
                    "checkAllModels": false
                }}
            }},
            "tags": [
                "..."
            ],
        }}
    }}
}}
'''


aliases['anki_newdeck'] = _newDeck
aliases['anki_running'] = 'curl localhost:8765'
