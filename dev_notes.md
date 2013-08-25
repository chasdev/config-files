
## Tips and Cheats

### Miscellaneous Mac Tips
 
*Finder* 
To show hidden files and directories by:

```
 defaults write com.apple.Finder AppleShowAllFiles YES
```

Then use option/right click hold, and choose option to 'relaunch' 
To return to 'normal', reverse but switch YES to NO.

Git must have proxy set in .bash_profile to get through firewall: 
```
export http_proxy=www-proxy.xyz.com:8080
```

#### bash command line basics:

References:
* [Sed - An intro and tutorial](http://www.grymoire.com/Unix/Sed.html)

To create a gzip tar: 
```
tar -czf eventmgmt.tar.gz eventmgmt/
```

To extract from a gzip tar: 
```
tar -xzf eventmgmt.tar.gz [optional_file_to_extract]
```
                         
To kill a process using it's pid file:  
```
kill -9 `cat some_process.pid` (note back ticks are used)
```

To find a process using a port (e.g., 8080)
```
lsof -i tcp:8080
```

To find processes that are listening:
```
lsof -i -P | grep LISTEN
```

To find a file:  
```
sudo find / -name "filename"
```

To find the size of a directory:
```
du -h --max-depth=1 some_directory/
```

To find number of files within a directory:
```
ls some_directory/ | wc -l
```

#### Tmux

References:
* [The Text Triumvirate](http://www.drbunsen.org/the-text-triumvirate/)
* [Tweaking tmux and vim](https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux)
* [tmux shortcuts and cheatsheet](https://gist.github.com/MohamedAlaa/2961058)

CTRL-a (default is CTRL-b) then:
* d  = detach (exit back to normal terminal) and use normal vim keys 
* s  = create a new pane below the current one, resize with C-a Shift-J/K
* \[ = this starts 'copy mode' which is scrollable (type q to exit copy mode)
(or use trackpad to navigate and resize panes)

#### MacVim / Vim 

References:
* [Janus](https://github.com/carlhuda/janus)
* See tmux references above

Install Solarized for both vim and iTerm2

*NerdTree*
<Leader> n  = toggles sidebar
I (shift i) = shows hidden files in sidebar
go          = previews file
s           = opens new pane between sidebar and existing pane

*BufferGator*
<Leader> b = toggles buffer listing

*EasyMotion*
<Leader><Leader>fA = highlight 'finds' of 'A'

*ZoomWin*
Ctrl-W o = zoom/unzoom a pane when using split panes

*TagBar*
<Leader>rt = toggle tagbar (CTAG tags of current file)

*NERDcommenter*
<Leader>/ = toggle commenting current line / select lines

*Ack*
<Leader>f = bring up :Ack

References:
* [Using Marks](http://vim.wikia.com/wiki/Using_marks)


Commands:
To remove highlights from current/last search:  
```
:noh
```

To replace a word:  
```
%s/word/newword/g
```

To replace a case-sensitive word: 
```
:%s/word\C/newword/g
```

To select columns:
ctrl-V goes into visual mode, selecting columns - use esc esc to fill other columns

To remove Windows line returns that show as ^M, use:
```
:%s/^V^M//g
``` 

(type this as :%s/CTRL-V-CTRL-M//g  (hold CTRL and type VM)k
(note that it will appear as :%s/^M//g when displayed)

To tag a project in order to use exuberant tags plugin:
```
   ctags . 
```

To delete a file, use:
```
:Explore -- and then use 'R' to remove the highlighted file
```

#### Brew 

If 'brew update' fails with conflicts, cd /usr/local which is a git directory, and stash or commit on a different branch, then re-try. 

#### MongoDB 

Mongo Database

```
brew update
brew install mongodb
```

If this is your first install, automatically load on login with:
```
    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/Cellar/mongodb/2.0.0-x86_64/org.mongodb.mongod.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
```

If this is an upgrade and you already have the org.mongodb.mongod.plist loaded:
```
    launchctl unload -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
    cp /usr/local/Cellar/mongodb/2.0.0-x86_64/org.mongodb.mongod.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
```

Or start it manually:
```
    mongod run --config /usr/local/Cellar/mongodb/2.0.0-x86_64/mongod.conf
```

MongoDB 1.8+ includes a feature for Write Ahead Logging (Journaling), which has been enabled by default.
To disable journaling, use --nojournal.
==> Summary
/usr/local/Cellar/mongodb/2.0.0-x86_64: 17 files, 120M, built in 15 seconds
