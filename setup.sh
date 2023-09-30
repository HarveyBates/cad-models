#!/bin/bash

project_dir=""
project_desc=""
project_imgs="<div align=center><img src=\"media/front.png\" width=400><img src=\"media/rear.png\" width=400></div>"
private=false

while getopts n:d:ph flag; do 
  case "${flag}" in 
    n) project_dir="${OPTARG}" ;;
    d) project_desc="${OPTARG}" ;;
    h) 
      echo "General CAD Model Directory Creator"
			echo " "
			echo "Options:"
			echo "-h			Show help information."
			echo "-n	(required)	Name of the new project to create."
			echo "-d	(optional)	Description of the new project. Requires quotations."
      echo "-p  (optional)  Private model, won't be added to git."
      exit 0 ;;
    p) private=true ;;
    \?) echo "Invalid option: -"$OPTARG"" >&3
			exit 1 ;;
		:) echo "Option -"$OPTARG" requires an argument" >&2
			exit 1 ;;
  esac
done
shift "$(( OPTIND -1 ))"

# Check project name is valid
if [[ "$project_dir" == "" ]]; then 
  echo "No project name provided. Exiting."
  exit 1
fi

# Check if project directory already exists
if [[ -d "$project_dir" ]]; then
  echo "Project (${project_dir}) already exists. Exiting."
  exit 1
fi

echo "Adding directory: ${project_dir}"
mkdir "${project_dir}"

mkdir "${project_dir}/extern"
mkdir "${project_dir}/gcode"
mkdir "${project_dir}/media"
mkdir "${project_dir}/stl"
touch "${project_dir}/README.md"

if [[ "$project_desc" == "" ]]; then 
  # No description provided
  printf "# ${project_dir}\n## Description\n\n## Images\n${project_imgs}\n\n## Links\n" > "${project_dir}/README.md"
else 
  # User supplied project description
  printf "# ${project_dir}\n## Description\n${project_desc}\n\n## Images\n${project_imgs}\n\n## Links\n" > "${project_dir}/README.md"
fi

# Add to gitignore if private flag is passed
if $private; then
  echo "${project_dir}" >> .gitignore
fi

echo "Project: ${project_dir} created."
