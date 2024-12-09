variable "github_token" {
  description = "GitHub personal access token with GH Actions self-hosted access"
  type        = string
  sensitive   = true
}

variable "github_repo" {
  description = "GitHub repo to connect the runners to. Only used if user-data.sh is set to repo mode"
  type        = string
  default     = "username/repo"
}


# variable "aws_access_key" {
#   description = "AWS access key"
#   type        = string
#   sensitive   = true
# }

# variable "aws_secret_key" {
#   description = "AWS secret key"
#   type        = string
#   sensitive   = true
# }

# variable "github_org" {
#   description = "GitHub organization name. Only used if user-data.sh is set for org mode"
#   type        = string
#   default     = "org-name"
# }

# Optonal. labels like Linux,X64, and self-hosted are already applied. This is for additional labels.
# variable "github_runner_labels" {
#   description = "A list of comma-delimited custom labels to apply to GitHub-hosted runners"
#   type        = string
#   default     = ""
# }