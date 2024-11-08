#!/bin/bash

# # Create a folder
# mkdir actions-runner && cd actions-runner
# # Download the latest runner package
# curl -o actions-runner-linux-x64-2.321.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz
# # Optional: Validate the hash
# echo "ba46ba7ce3a4d7236b16fbe44419fb453bc08f866b24f04d549ec89f1722a29e  actions-runner-linux-x64-2.321.0.tar.gz" | shasum -a 256 -c
# # Extract the installer
# tar xzf ./actions-runner-linux-x64-2.321.0.tar.gz



# # Create the runner and start the configuration experience
#  ./config.sh --url https://github.com/Sundze7/ec2-terraform --token AZSWKXVITUWTZ3EKWD6QAADHMVILA
# # Last step, run it!
# #  ./run.sh



# # Update the package list and install dependencies
# sudo apt-get update -y
# sudo apt-get upgrade -y
# sudo apt-get install -y curl unzip git jq

# # Create a directory for the GitHub Actions Runner
# mkdir -p /actions-runner && cd /actions-runner

# # Fetch the latest GitHub Actions Runner version dynamically
# RUNNER_VERSION=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | jq -r '.tag_name')
# echo "Installing GitHub Actions Runner version: $RUNNER_VERSION"

# # Download the GitHub Actions Runner binary
# curl -o actions-runner-linux-x64.tar.gz -L "https://github.com/actions/runner/releases/download/${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION#v}.tar.gz"

# # Extract the runner
# tar xzf actions-runner-linux-x64.tar.gz

# # Install dependencies
# ./bin/installdependencies.sh

# # Configure the runner
# ./config.sh --url "https://github.com/${github_repo}" \
#             --token "${github_token}" \
#             --name "self-hosted-runner" \
#             --work "_work" \
#             --labels "self-hosted,ubuntu" \
#             --unattended --replace

# # Create a service for the runner
# sudo ./svc.sh install
# sudo ./svc.sh start

# # Cleanup installation files
# rm -f actions-runner-linux-x64.tar.gz

# echo "GitHub Actions Runner setup completed."

