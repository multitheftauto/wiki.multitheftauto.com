import yaml
from jsonschema import validate, ValidationError
import markdown
import re

def load_schema(schema_path):
    with open(schema_path, 'r') as file:
        schema = yaml.safe_load(file)
    return schema

def load_and_validate_yaml(file_path, schema):
    with open(file_path, 'r') as file:
        data = yaml.safe_load(file)
        validate(instance=data, schema=schema)
        return data

def to_html(markdown_text, single_paragraph=False):
    html = markdown.markdown(markdown_text)
    if single_paragraph:
        html = re.sub(r'<p>(.*?)</p>', r'\1', html)

    # Custom link syntax
    # Replace all [[string|text]] with <a href="/string">text</a>
    html = re.sub(r'\[\[(.*?)\|(.*?)\]\]', r'<a href="/\1">\2</a>', html)
    # Replace all [[string]] with <a href="/string">string</a>
    html = re.sub(r'\[\[(.*?)\]\]', r'<a href="/\1">\1</a>', html)

    return html
