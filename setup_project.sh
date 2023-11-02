#!/bin/bash

# Allow connections from the Docker container to the X server
xhost +local:docker

# Get the script directory path
repo_dir=$(pwd)

# Check if the entered path exists
if [ ! -d "$repo_dir" ]; then
  echo "Error: The specified directory does not exist."
  exit 1
fi

############################################################################################

# Create the devcontainer.json content with the user input
devcontainer_json='{
  "name": "AssistanceSoftwareWithGaze",
  "build": { "dockerfile": "Dockerfile" },
  "runArgs": ["--net=host", "--ipc=host", "--privileged", "--device=/dev/video0:/dev/video0",
    "--device=/dev/video1:/dev/video1",
    "--device=/dev/video2:/dev/video2",
    "--device=/dev/video3:/dev/video3",
    "--device=/dev/video4:/dev/video4",
    "--device=/dev/video5:/dev/video5",
    "--device=/dev/video6:/dev/video6",
    "--device=/dev/video7:/dev/video7",
    "--device=/sys/devices:/sys/devices"],
  "shutdownAction": "none",
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "eamodio.gitlens",
        "ms-python.python",
        "ms-vscode.cpptools-extension-pack"
      ]
    }
  },
  "postCreateCommand": "/bin/bash /workspaces/AssistanceSoftwareWithGaze/setup/set_git_credentials.sh",
  "mounts": [
    "source=/tmp/.X11-unix,target=/tmp/.X11-unix,type=bind,consistency=cached",
    "source='$repo_dir',target='/home/app',type=bind,consistency=cached"
  ],
  "containerEnv": {
    "DISPLAY": "${localEnv:DISPLAY}"
  }
}'

# Write the devcontainer.json to a file
echo "$devcontainer_json" > .devcontainer/devcontainer.json

echo "devcontainer.json created with the specified mount and xserver."

bash ./setup/download_files.sh






