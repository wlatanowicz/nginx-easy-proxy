import os
import re

from jinja2 import Environment, FileSystemLoader


env = Environment(loader=FileSystemLoader('/'))

template = env.get_template('config.j2')

context = {
    'services': []
}

for k in os.environ:
    services = re.findall("^BACKEND\\[(.*)\\]$", k)
    if len(services) > 0:
        service = services[0]

        context['services'].append({
            'name': service,
            'backend': os.environ.get(f'BACKEND[{service}]'),
            'location': os.environ.get(f'LOCATION[{service}]', "/"),
        })

config = template.render(context)

print(config)
