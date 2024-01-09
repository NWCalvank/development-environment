source ~/.aliases

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nathancalvank/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nathancalvank/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nathancalvank/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nathancalvank/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

    res=$(aws sts get-session-token --profile archera --serial-number $SERIAL_NUMBER --token-code "$1")

    AWS_ACCESS_KEY_ID=$(echo $res | jq -r '.Credentials.AccessKeyId')
    AWS_SECRET_ACCESS_KEY=$(echo $res | jq -r '.Credentials.SecretAccessKey')
    AWS_SESSION_TOKEN=$(echo $res | jq -r '.Credentials.SessionToken')

    aws configure set --profile archera-mfa aws_access_key_id $AWS_ACCESS_KEY_ID
    aws configure set --profile archera-mfa aws_secret_access_key $AWS_SECRET_ACCESS_KEY
    aws configure set --profile archera-mfa aws_session_token $AWS_SESSION_TOKEN
}

function aws-export-archera() {
    export AWS_PROFILE=archera-mfa
    export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
    export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
    export AWS_SESSION_TOKEN=$(aws configure get aws_session_token)
}

# Run automatically in new shells
aws-export-archera

# AWS CLI Helpers
function aws-instances() {
    aws ec2 describe-instance-type-offerings --location-type availability-zone --filters=Name=instance-type,Values="$2" --region "$1" --output table
}
