#!/bin/sh -l

projectName=$1
version=$2
outputDirectory=$3

today=$(date "+%F")

echo "Project Name: $projectName"
echo "Version: $version"
echo "Output Directory: $outputDirectory"
echo "Today: $today"

mkdir -p $HOME/$outputDirectory
mkdir -p $HOME/tempGerbers

ls -al

# Gerber files
kicad-cli pcb export gerbers --no-protel-ext --output "$HOME/tempGerbers/" "$projectName.kicad_pcb"
# Drill files
kicad-cli pcb export drill --output "$HOME/tempGerbers/" "$projectName.kicad_pcb"
# Pack it
zip -r "$HOME/$outputDirectory/$today-$projectName-$version-Gerbers-Drills.zip" "$HOME/tempGerbers/"

# Position files
kicad-cli pcb export pos --exclude-dnp --output "$HOME/$outputDirectory/$today-$projectName-$version-Placement.pos" "$projectName.kicad_pcb"
# Placement documents
kicad-cli pcb export pdf --layers "F.Silkscreen,Edge.Cuts" --black-and-white --output "$HOME/$outputDirectory/$today-$projectName-$version-Placement-Top.pdf" "$projectName.kicad_pcb"
kicad-cli pcb export pdf --layers "B.Silkscreen,Edge.Cuts" --black-and-white --output "$HOME/$outputDirectory/$today-$projectName-$version-Placement-Bottom.pdf" "$projectName.kicad_pcb"

# 3D files
kicad-cli pcb export vrml --output "$HOME/$outputDirectory/$today-$projectName-$version-3D-Model.vrml" "$projectName.kicad_pcb"

# Schematic
kicad-cli sch export pdf --output "$HOME/$outputDirectory/$today-$projectName-$version-Schematic.pdf" "$projectName.kicad_sch"

# BOM
kicad-cli sch export bom --fields $BomFormat --exclude-dnp --output "$HOME/$outputDirectory/$today-$projectName-$version-BOM.csv" "$projectName.kicad_sch"

ls -al $HOME/$outputDirectory