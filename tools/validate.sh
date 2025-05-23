#!/bin/bash

find 'functions/' -name '*.yaml' -type f -print0 | xargs -0 -I {} tools/yajsv -s schemas/function.yaml -r schemas/common-defs.yaml {}
find 'elements/' -name '*.yaml' -type f -print0 | xargs -0 -I {} tools/yajsv -s schemas/element.yaml -r schemas/common-defs.yaml {}
find 'events/' -name '*.yaml' -type f -print0 | xargs -0 -I {} tools/yajsv -s schemas/event.yaml -r schemas/common-defs.yaml {}
