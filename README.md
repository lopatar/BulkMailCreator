# Bulk mail creator

This shell script is intended to ease bulk adding e-mail accounts to your e-mail server.

Boring hassle of blindly copy-pasting commands is over.

**Script is supposed to be compatible with [Luke Smith's emailwiz](https://github.com/LukeSmithXyz/emailwiz)**

# Usage
## Installation
```zsh
    git clone https://github.com/lopatar/BulkMailCreator.git
    cd BulkMailCreator
    chmod +x addAccount.sh
```

## Direct script editing
To specify e-mail accounts to add, you can modify the script itself and use the function `addAccount(username, password)`. Example usage is [here.](https://github.com/lopatar/BulkMailCreator/blob/main/addAccount.sh#L1-L2)
```zsh
#!/bin/zsh
addAccount "John-Smith" "UltraSecurePassword"
```

## Importing the script
You can import the script in any of your scripts and use the methods provided. Here is an example:
```zsh
#!/bin/zsh
source addAccount.sh
addAccount "John-Smith" "UltraSecurePassword"
```
# Logging

You can configure logging by editing the [script header](https://github.com/lopatar/BulkMailCreator/blob/main/addAccount.sh#L1-L2) 

# TODO:
Load bulk accounts from file/env array