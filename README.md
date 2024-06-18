# KiCad Release Workflow

## Description

This GitHub Action generates a set of manufacturing files from a KiCad project and attaches them to a release. The action exports Gerber files, drill files, position files, placement documents, 3D models, schematics, and a BOM (Bill of Materials).

## Usage

To use this action, create a workflow in your GitHub repository (e.g., `.github/workflows/release.yml`) and configure it as follows:

```yaml
name: Generate KiCad Manufacturing Files

on:
  release:
    types: [created]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Run KiCad Release Workflow
        uses: ./ # or use the full path if it's a public action
        with:
          project-name: "your_project_name"
          version: "1.0.0"
          output-directory: "output"
```

## Inputs

- `project-name`: **Required** The KiCad project name.
- `version`: **Required** The version for the filenames.
- `output-directory`: The directory in which to place the manufacturing files. Defaults to output.

## Example

```yaml
- name: Run KiCad Release Workflow
  uses: ./ # or use the full path if it's a public action
  with:
    project-name: "my_kicad_project"
    version: "v1.2.3"
    output-directory: "release_files"
```

## Files Generated

The following files will be generated and placed in the specified output directory:

- Gerber files and Drill files packed in a ZIP archive
- Position files
- Placement documents in PDF format (Top and Bottom)
- 3D model in VRML format
- Schematic in PDF format
- BOM in CSV format

## Author

Alexander Ransmann
