import os
import re
import json
import requests

url = 'https://my-cloud-database-api-endpoint.com/player_notes'

saved_vars_path = os.path.join(os.getenv('APPDATA'), 'WoW', 'WTF', 'Account', 'YOUR_ACCOUNT_NAME', 'SavedVariables', 'MyAddon.lua')

with open(saved_vars_path, 'r') as f:
    saved_vars = f.read()

player_notes_str = re.search(r'WindwardPlayerNotesDB = {(.+)}', saved_vars).group(1)

player_notes = json.loads('{%s}' % player_notes_str)

headers = {
    'Content-Type': 'application/json'
}

response = requests.post(url, headers=headers, json=player_notes)

if response.status_code != 200:
    print('Failed to upload player notes to cloud database. Status code:', response.status_code)