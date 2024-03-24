# Bulk mail creator

This shell script is intended to ease bulk adding e-mail accounts to your e-mail server.

Boring hassle of blindly copy-pasting commands is over.

**Script is supposed to be compatible with [Luke Smith's e-mail server](https://github.com/LukeSmithXyz/emailwiz)**
**The script is written using zsh**

# Usage

## Installation
```zsh
#!/bin/zsh -e
git clone https://github.com/lopatar/BulkMailCreator.git --branch master
cd BulkMailCreator
chmod +x ./bulkMailCreator.sh
```

## Direct script editing
To specify e-mail accounts to add, you can modify the script itself and use the function `addAccount(username, password)`. Example usage is [here.](https://github.com/lopatar/BulkMailCreator/blob/master/addAccount.sh#L60-L62)

```zsh
#!/bin/zsh -e 
addAccount 'John-Smith' 'UltraSecurePassword'

./bulkMailCreator.sh
```

## Importing the script
You can import the script in any of your scripts and use the methods provided. Here is an example:
### Example script
```zsh
#!/bin/zsh -e
source bulkMailCreator.sh

addAccount 'John-Smith' 'UltraSecurePassword'
addAccount 'Mister-Mail' 'ExtraPass'
 
chmod +x yourScript.sh
./yourScript.sh
```

# Logging
You can configure logging by editing the [script header](https://github.com/lopatar/BulkMailCreator/blob/master/addAccount.sh#L1-L2) 

# TODO:
Load bulk accounts from file/env array
