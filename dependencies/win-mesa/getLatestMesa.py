import requests
import re
import os

url = 'https://archive.mesa3d.org'

http_answer = requests.get(f'{url}/?C=M;O=D')


if (http_answer.status_code != 200) and (http_answer.headers['Content-Type'].find("text/html") == -1):
    print(f'Failed to load the site: {http_answer.status_code}')
    exit(-1)


html_contents = str(http_answer.content)

latestMesaPkgName = re.search(r"\"mesa-\d\d\.\d\.\d\.tar\.xz\"", html_contents).group(0).strip(r'"')

if os.path.exists('./mesa.tar.xz'):
    print('File already exists')
    exit(0)

get_url = f'{url}/{latestMesaPkgName}'

print(f'Getting package {get_url}')

http_answer = requests.get(get_url)

if http_answer.status_code != 200:
    print(f'Failed to retrieve the package: {http_answer.status_code}')
    exit(-1)

with open('mesa.tar.xz', "wb") as file_handle:
    file_handle.write(http_answer.content)
