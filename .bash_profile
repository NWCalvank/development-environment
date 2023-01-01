source ~/.bash_prompt
source ~/.bash_alias

# export PATH with local python installation
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set neovim as default text editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# AWS 2FA
function aws-login() {
  unset AWS_PROFILE

  res=$(aws sts get-session-token --serial-number arn:aws:iam::967800896805:mfa/nathan-user --token-code "$1")

  AWS_ACCESS_KEY_ID=$(echo $res | jq -r '.Credentials.AccessKeyId')
  AWS_SECRET_ACCESS_KEY=$(echo $res | jq -r '.Credentials.SecretAccessKey')
  AWS_SESSION_TOKEN=$(echo $res | jq -r '.Credentials.SessionToken')

  aws configure set --profile mfa aws_access_key_id $AWS_ACCESS_KEY_ID
  aws configure set --profile mfa aws_secret_access_key $AWS_SECRET_ACCESS_KEY
  aws configure set --profile mfa aws_session_token $AWS_SESSION_TOKEN

  export AWS_PROFILE=mfa
}
