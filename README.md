# CAD Models
Random CAD models for personal use.

## Installation
Clone project directory and make `setup.sh` executable.
```bash
git clone https://github.com/HarveyBates/cad-models
cd cad-models
chmod u+x setup.sh
```

## Usage

### Create a project
Create a new project directory structure. The use of a description (`-d`) is optional as it can be added to the project `README.md` later.
```bash
./setup.sh -n <project_name> -d "<project_description>"
```
#### Project Images
By default two images are automatically added to your projects `README.md`, these are `front.png` and `rear.png`. Create these images when your project is complete and place inside the `<project_name>/media` directory.

### Help
```bash
General CAD Model Directory Creator

Options:
-h                      Show help information.
-n      (required)      Name of the new project to create.
-d      (optional)      Description of the new project. Requires quotations.
```

### Directory Structure
By default your applications (Fusion360, FreeCAD etc.) files should go in the `<project_name>` directory with other files housed as below.
```bash
.
├── README.md    # Project README
├── extern       # External models
├── gcode        # 3D printer G-Code if applicable
├── media        # Project images (two files are added to the readme by default: front.png and rear.png)
└── stl          # Project STL files
```
