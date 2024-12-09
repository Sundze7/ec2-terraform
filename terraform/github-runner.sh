#!/bin/bash

# Update the package list and install dependencies
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y curl unzip git jq

# Create a directory for the GitHub Actions Runner
mkdir -p /actions-runner && cd /actions-runner

# Fetch the latest GitHub Actions Runner version dynamically
RUNNER_VERSION=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | jq -r '.tag_name')
echo "Installing GitHub Actions Runner version: $RUNNER_VERSION"

# Download the GitHub Actions Runner binary
curl -o actions-runner-linux-x64.tar.gz -L "https://github.com/actions/runner/releases/download/${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION#v}.tar.gz"

# Extract the runner
tar xzf actions-runner-linux-x64.tar.gz

# Install dependencies
./bin/installdependencies.sh

# Configure the runner
./config.sh --url "https://github.com/${github_repo}" \
            --token "${github_token}" \
            --name "self-hosted-runner" \
            --work "_work" \
            --labels "self-hosted,ubuntu" \
            --unattended --replace

# Create a service for the runner
sudo ./svc.sh install
sudo ./svc.sh start

# Cleanup installation files
rm -f actions-runner-linux-x64.tar.gz

echo "GitHub Actions Runner setup completed."



# # Update system and install dependencies
# sudo yum update -y
# sudo yum install -y curl unzip git

# # Create a GitHub Actions Runner directory
# mkdir -p /actions-runner && cd /actions-runner

# # Download GitHub Actions Runner
# curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v2.308.0/actions-runner-linux-x64-2.308.0.tar.gz

# # Extract the runner
# tar xzf actions-runner-linux-x64.tar.gz

# # Install dependencies
# ./bin/installdependencies.sh

# # Configure the runner
# ./config.sh --url "https://github.com/<your-org-or-repo>" --token "<your-runner-token>" --name "self-hosted-runner" --work "_work" --labels "self-hosted,Linux" --unattended --replace

# # Create a service for the runner
# sudo ./svc.sh install
# sudo ./svc.sh start
