@echo off

for /r "functions" %%f in (*.yaml) do (
    .\tools\yajsv.exe -s schemas/function.yaml -r schemas/common-defs.yaml "%%f"
)

for /r "elements" %%f in (*.yaml) do (
    .\tools\yajsv.exe -s schemas/element.yaml -r schemas/common-defs.yaml "%%f"
)

for /r "events" %%f in (*.yaml) do (
    .\tools\yajsv.exe -s schemas/event.yaml -r schemas/common-defs.yaml "%%f"
)
