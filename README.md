# DotFiles
Just a repository to store my DotFiles / Configs and Scripts.<br>
Mostly files that start with a '.' :smile_cat:<br>
Feel free to copy, modify and/or fork it!<br>
(I made this repo not only for storing my files, but with the aim of providing useful configs and functions!)

## INFO:
The nginx.conf scores an <strong>A+</strong> on the <a href="http://ssllabs.com">SSLLabs</a> analysis!&nbsp;&nbsp;&nbsp;&nbsp;> <a href="https://www.ssllabs.com/ssltest/analyze.html?d=nulldev.org&latest">Test Me!</a> <<br>
The .crontab file [`$ crontab -e`] contains an autorenew for all SSL Certificates from <a href="https://letsencrypt.org/">LetsEncrypt</a><br>
The .gitignore is aiming for <a href="https://eclipse.org/downloads/">Eclipse</a><br>
The .gitattributes was made for <a href="https://docs.microsoft.com/dotnet/articles/csharp/">C#</a><br>
The .npmignore skips `.raw` files (I use them for debugging) and files starting with "test" in src<br>
The .crontab file also automatically starts the kik bot on server reboot now<br>
The termcol.sh is a CheatSheet for terminal colors. Preview below<br>
The ./profile.d folder is located at `/etc/profile.d` and the scripts are used to apply parameters to the shell of all users.<br>
The debug.php file enables outputing error messages<br>
The debug-switch.php files allows to turn on/off the error messages. <br>
The package.json file is my standard configuration for node projects. <br>
The file `LOLCODE.tmLanguage` in the submlime folder is syntax highliting for LOLCODE in Sublime Text 3<br>
The `issue.net` file (/etc) changes the Pre-Login SSH message. Uncomment `#Banner` in `/etc/ssh/sshd_config` <br>
The files located in `update-motd.d` modify the Post-Login SSH Message on Ubuntu (16.04 LTS) <br>
The `forever-start.sh` file starts all node scripts in given directories (see screenshot) <br>
The file `utils.sh` will install my alias file in `/etc/profile.d` (See explanation below) <br>
The `.github` folder contains an `issues` template. To see what it does, try to open an Issue on this repo.

**Also**: The forever-start.sh file features two arguments: <br>

| Argument | Explanation |
|----------|-------------|
| `-s` or `--stop`    | Stops all scripts              |
| `-r` or `--restart` | Stops and restarts all scripts |

## Explanation of my Alias file at `/etc/profile.d/00-alias.sh`

**NOTE:** If you want to update the alias file without restarting/relogin simply run:<br>
$ `source /etc/profile.d/00-alias.sh`

---

**NOTE:** If you want to automatically enable all alias on startup, add the line <br>
```bash
source /etc/profile.d/00-alias.sh
```
To your `rc.local` file at `/etc/rc.local` (befor the line `exit 0`)

| Alias | Explanation |   Usage   | Examples |
|-------|-------------|-----------|----------|
| ll           | Used to list all files in long list format and classify |
| ext          | Extract many types of archive files with the same command (autodetect) | ext file | `ext test.tar.gz` |
| cd...        | (and others) - Just move more directories up |
| timer        | Starts a timer (can be stopped with CTRL + C) and displays time |
| week         | Displays the ISO Week number |
| gip          | Get IP: displays the public IP of the machine |
| clearhistory | clears the bash/terminal history **and exits** |
| lnn          | Line Number: prints out a specific line of a file | lnn line file <!-- Dont ask... -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | `lnn 4 test.txt` |
| cls          | Clear Screen: Clears the screen (terminal) without spamming whitespaces and it maximizes it as well |
| chp          | CheckPort: Checks if a port is open or not | chp host port | `chp nulldev.org 80` |
| epoch        | Converts unix epoch time to human readble time and reverse | epoch | `epoch 137514859`, `epoch 22 june 2011`, `epoch` |

---

## How to clone:

$ `git clone git://github.com/NLDev/dotfiles ~/.dotfiles`<br>
$ `cd ~/.dotfiles && ls -a`

<br>

### Also: The scrips need to be made executable.<br>
Example for `termcol.sh`:

$ `chmod +x ./termcol.sh`

<p align="center">
<br>
<strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strike> termcol.sh preview <strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strike><br><br>
<img src="https://raw.githubusercontent.com/NLDev/dotfiles/master/.src/src_01.png" /><br>
<br>
<br>
<strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strike> SSL-Labs Test <strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strike><br><br>
<img src="https://raw.githubusercontent.com/NLDev/dotfiles/master/.src/ssl-test.png" /><br>
<br>
<br>
<strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strike> Forever-Start.sh <strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strike><br>
<br>
<img src="https://raw.githubusercontent.com/NLDev/dotfiles/master/.src/forever.png" /><br>
</p>
<br>
