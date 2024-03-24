LOG_ENABLED=1
LOG_FILE="email-accounts.log"

function logToFile()
{
  # shellcheck disable=SC2155
  local CURRENT_DATE=$(/usr/bin/date)
  local MESSAGE="LOG [${CURRENT_DATE}]: ${1}"
  echo "${MESSAGE}" | /usr/bin/tee -a "${LOG_FILE}"
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
    /usr/sbin/adduser -v --disabled-password --ingroup mail --shell /usr/sbin/zsh --home /home/"${USERNAME}" --gecos "${USERNAME} - mail account" "${USERNAME}"
    printLine "Changing group for ${USERNAME} to mail"

    printLine "Changing password for ${USERNAME}"
    echo -c BCRYPT "${USERNAME}":"${PASSWORD}" | /usr/sbin/chpasswd

}

checkRoot

# EXAMPLE USAGE
#addAccount John-Smith UltraSecurePassword
#addAccount Mister-Mail ExtraPass