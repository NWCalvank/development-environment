source ~/.aliases

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Make python3 the default python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set neovim as default text editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Git Branch
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{46}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

# k9s
export XDG_CONFIG_HOME="$HOME/.config"

# AWS 2FA
function aws-login-archera() {
    SERIAL_NUMBER=$(aws configure get --profile archera mfa_serial)
    SESSION=$(aws configure get --profile archera role_session_name)
    ROLE=$(aws configure get --profile archera-"$1" role_arn)

    res=$(aws sts assume-role --profile archera --duration-seconds 43200 --serial-number $SERIAL_NUMBER --role-session-name $SESSION --role-arn $ROLE --token-code "$2")

    AWS_ACCESS_KEY_ID=$(echo $res | jq -r '.Credentials.AccessKeyId')
    AWS_SECRET_ACCESS_KEY=$(echo $res | jq -r '.Credentials.SecretAccessKey')
    AWS_SESSION_TOKEN=$(echo $res | jq -r '.Credentials.SessionToken')

    aws configure set --profile archera-"$1" aws_access_key_id $AWS_ACCESS_KEY_ID
    aws configure set --profile archera-"$1" aws_secret_access_key $AWS_SECRET_ACCESS_KEY
    aws configure set --profile archera-"$1" aws_session_token $AWS_SESSION_TOKEN
}

function aws-export-archera() {
    export AWS_ACCESS_KEY_ID=$(aws configure get --profile archera-"$1" aws_access_key_id)
    export AWS_SECRET_ACCESS_KEY=$(aws configure --profile archera-"$1" get aws_secret_access_key)
    export AWS_SESSION_TOKEN=$(aws configure --profile archera-"$1" get aws_session_token)
}

# AWS CLI Helpers
function aws-instances() {
    aws ec2 describe-instance-type-offerings --location-type availability-zone --filters=Name=instance-type,Values="$2" --region "$1" --output table
}
