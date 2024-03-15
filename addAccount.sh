LOG_ENABLED=1
LOG_FILE="email-accounts.log"

function logToFile()
{
  local CURRENT_DATE=$(date)
  local MESSAGE="LOG [${CURRENT_DATE}]: ${1}"
  echo "${MESSAGE}" | tee -a "${LOG_FILE}"
}

function printLine()
{
  local MESSAGE="${1}......"

  if [[ $LOG_ENABLED == 1 ]]; then
    logToFile "${MESSAGE}"
  else
    echo "${MESSAGE}"
  fi
}

function die()
{
  printLine "Exiting"

  set -e
  /bin/false
}

function checkRoot()
{
    printLine "Checking for root"

    local USER_ID=${EUID}

    if [[ $USER_ID != 0 ]]; then
      printLine "Script must be ran as root"
      die
    fi
}

function addAccount()
{
    local USERNAME=${1}
    local PASSWORD=${2}

    printLine "Creating account ${USERNAME}"
    adduser --disabled-password --shell /bin/zsh --home "/home/${USERNAME}" --gecos "${USERNAME}" "${USERNAME}"

    printLine "Changing password for ${USERNAME}"
    echo "${USERNAME}:${PASSWORD}" | chpasswd

    printLine "Changing group for ${USERNAME} to mail"
    usermod -aG mail "${USERNAME}"
}

checkRoot

addAccount "John-Smith" "UltraSecurePassword"