import argparse
import os
import sys

import jinja2
import yaml

def main():
  parser = argparse.ArgumentParser(description='Execute a template.')
  parser.add_argument('--themes', nargs='?', 
                      help='path to themes directory')
  if len(sys.argv) != 3:
    print('error: expected 2 args: path/to/input/template.ext path/to/output/file.ext', file=sys.stderr)
    sys.exit(1)
  template_path = sys.argv[1]
  out_path = sys.argv[2]
  env = jinja2.Environment(loader=jinja2.FileSystemLoader(os.path.dirname(template_path)))
  template = env.get_template(os.path.basename(template_path))
  context = get_context()
  with open(out_path, 'w') as out_file:
    print(template.render(context=context), file=out_file)

def get_context():
  return yaml.safe_load()

if __name__ == '__main__':
  main()