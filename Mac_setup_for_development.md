
#Setting up a new Mac.

##Install via App Store

* Xcode

##Install via manual (browser) download

* [iterm](http://www.iterm2.com/#/section/home)
* [Alfred](http://www.alfredapp.com) and power pack ($) (launcher, multi-clipboards)
* [Dropbox](https://www.dropbox.com)
* [Evernote](https://evernote.com) and purchase premium ($$)
* [1Password](https://agilebits.com/onepassword) ($$)
* [Sublime Text](http://www.sublimetext.com) (best GUI text editor)
* [Marked 2](http://marked2app.com) ($) (for rendering markdown)
* [Git](http://git-scm.com/download/mac)
* [brew](http://brew.sh) (preferred package installer for mac)

##Install tmux, ack, and vim

Now install tools using brew.

* [tmux](http://tmux.sourceforge.net)
* [ack](http://beyondgrep.com)
* [vim](http://www.vim.org) (CLI vim and [MacVim](https://code.google.com/p/macvim/) GUI, pointing to same place)

```bash
$ brew update
$ brew install tmux
$ brew install ack
```

```bash
$ export PATH=/usr/local/bin:$PATH
$ brew install vim && brew install macvim
$ brew link macvim
```

If you encounter a segmentation fault launching vim and use rvm to manage ruby versions, you will need to uninstall and reinstall using the system ruby installation.

```
$ brew uninstall vim; rvm system; brew install vim
```

##Configure the zsh and bash shells, tmux, and vim


####Shell
Configure iTerm to use [Solarized](http://ethanschoonover.com/solarized). Download Solarized (e.g., under ~/devtools/), unzip, and then in iTerm 'Preferences' select 'Profiles' and the 'Colors' tab, click the 'Load Presets' button, and 'import' the 'solarized/iterm2-colors-solarized/Solarized Dark.itermcolors', then make sure it is selected in iTerm.

The next step is to configure the shell, tmux, and vim.  You should use whatever configuration settings you prefer.  I keep my configuration files in GitHub and so the following is specific to my setup. Others are welcome to use my configuration files (fork or borrow parts).

To use zsh as your shell, install 'oh-my-zsh':

```bash
curl -L github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

```bash
mkdir devtools && cd $_
git clone https://github.com/chasdev/config-files.git
cd ~
# if you already have a .bash_profile, .zshrc, .vimrc, or .tmux.conf, please create a backup
$ ln -s $HOME/devtools/config-files/.zshrc .zshrc
$ ln -s $HOME/devtools/config-files/.bash_profile .bash_profile
$ ln -s $HOME/devtools/config-files/.tmux.conf .tmux.conf
$ ln -s $HOME/devtools/config-files/.vimrc .vimrc
$ ln -s $HOME/devtools/config-files config-files
```

####Vim

Previously I used [janus](https://github.com/carlhuda/janus), and then later [pathogen](https://github.com/tpope/vim-pathogen) to manage vim plugins. My configuration now uses [Vundle](https://github.com/gmarik/Vundle.vim) which will allow other plugins to be installed simply by their inclusion in the .vimrc file.

Vim step 1: install Vundle

To use Vundle, we'll need to clone this into our .vim/bundle directory. All other plugins will be installed into the directory using Vundle, so this is the only one that needs to be done manually.

```bash
$ cd ~/.vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim.git
```

As discussed above, make sure '~/.vimrc' is sym linked to your local clone of this repository.

Vim step 2: install plugins


Review the plugins identified below, and remove/add plugins to the .vimrc file. For example, if you don't want support for Go (aka golang), just remove that plugin from the .vimrc file.  

When you are ready, launch vim and run:

```
:PluginInstall  
```

This will install the following plugins into the ~.vim/bundle directory. 

* [ack](https://github.com/mileszs/ack.vim) 
* [vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
* [YouCompleteMe](http://valloric.github.io/YouCompleteMe/)
* [tlib](https://github.com/tomtom/tlib_vim.git) (dependency for SnipMate)
* [vim-addon-mv-utils](https://github.com/MarcWeber/vim-addon-mw-utils.git) (dependency for SnipMate)
* [vim-snipmate](https://github.com/garbas/vim-snipmate.git)
* [vim-snippets](https://github.com/honza/vim-snippets) (snippets used by SnipMate)
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-scala](https://github.com/derekwyatt/vim-scala)
* [ZoomWin](https://github.com/vits/ZoomWin) (Note: This is a fork, as ver 25 or better is needed which has not been pushed to the main repo.)
* [vim-node](https://github.com/moll/vim-node)
* [vim-airline](https://github.com/bling/vim-airline)
* [vimproc](https://github.com/Shougo/vimproc.vim) (Note: Prerequisite to Unite.vim)
* [unite](https://github.com/Shougo/unite.vim)
* [unite-tag](https://github.com/tsukkee/unite-tag)
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [Dockerfile](https://github.com/ekalinin/Dockerfile.vim)
* [vim-go](https://github.com/fatih/vim-go)
* [gundo](http://sjl.bitbucket.org/gundo.vim/)
* [syntastic](https://github.com/scrooloose/syntastic)
* [vim-commentary](https://github.com/tpope/vim-commentary)
* [tabular](https://github.com/godlygeek/tabular) (needed for vim-markdown)
* [vim-markdown](https://github.com/plasticboy/vim-markdown)
* [vim-repeat](https://github.com/tpope/vim-repeat)
* [vim-surround](https://github.com/tpope/vim-surround)

When this is complete, read any messages and then exit vim.

Vim step 3: Compile native extensions

Two of the plugins ('vimproc' and 'YouCompleteMe') require native extensions to be built:

```bash
$ cd ~/.vim-bundles/vimproc.vim
$ make
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.sh
```

Vim step 4: Configure support for Go

Also, you need to set the $GOPATH environment variable and install hg (mercurial) in addition to git, as the vim-go plugin will retrieve artifacts using both hg and git and install them into the GOPATH location. 

The zsh-custom/custom.zsh file sets GOPATH to $HOME/working/gopath-default, so either create this directory or change the GOPATH environment variable. 

To install mercurial, you can use brew:

```
$ brew install hg
```

##Install mitmproxy (to intercept and modify HTTP traffic)

Installation instructions: [http://mitmproxy.org/doc/install.html](http://mitmproxy.org/doc/install.html).  Also install a fast proxy switcher such as the 'SwitchySharp' chrome extension.

To start mitmproxy on port 8888 use:

```
mitmproxy -p 8888
```

##Install nvm and Node.js

Use nvm to manage (potentially) multiple Node.js installations, akin to using gvm to manage multiple groovy and grails installations.

```
$ git clone git://github.com/creationix/nvm.git ~/.nvm
$ . ~/.nvm/nvm.sh
$ nvm ls-remote
$ nvm install 0.11.12
```

At the time of this writing in order to get 0.11.x which supports important Harmony features like 'generators'.  If you don't use nvm,  you'll need to download the installer from the [blog page](http://blog.nodejs.org). (This is because odd release versions are 'unstable'.)

Install some global node packages.

* 'node-inspector' - allows debugging the server-side JavaScript within the Chrome Developer Tools graphical debugger.
* 'express-generator' - provides an executable t

```
$ npm install -g node-inspector
$ npm install -g express-generator
```

##Install the JVM and Supporting Tools and Languages

From iTerm, try 'java -version'. This will bring up a popup with a link to download the JDK which you should then install.

Next, install [gvm](http://gvmtool.net) which we'll use to install and manage Groovy, Grails, Gradle, vert.x

```bash
$ curl -s get.gvmtool.net | bash

# Assuming the .bash_profile has been sym linked per above,
# type: sbp (aka source bash profile)
sbp
# Otherwise, you'll need to
$ source "$HOME/.gvm/bin/gvm-init.sh"
#
$ gvm install groovy
$ gvm install grails
$ gvm install gradle
$ gvm install vertx
```

##Install Typesafe Activator (Play framework, Scala, Akka)

Download the Typesafe Activator from [here](http://typesafe.com/platform/getstarted).

##Install an IDE

While I do not use an IDE for day-to-day development, occasionally it's nice to have the debugging capabilities.

##Install Local Databases

* [couchdb](http://couchdb.apache.org)
* [mongodb](http://www.mongodb.org)
* [redis](http://redis.io)
* [MariaDB](https://mariadb.org)

```
brew update
brew install couchdb
brew install mongodb
brew install redis
brew install mariadb
```
See [Installing MariaDB on Mac OS X using Homebrew](https://mariadb.com/kb/en/building-mariadb-on-mac-os-x-using-homebrew/)

## Install 'brew cask' (for installing packaged applications)

Install '[brew cask](https://github.com/phinze/homebrew-cask#learn-more) to provide a simple brew interface for installing many packaged applications for OS X.

```
brew tap phinze/homebrew-cask
brew install brew-cask
```

You can see a listing of available packaged applications using:

```
brew cask search
```

## Install 'virtualbox' (using brew cask)

Install [virtualbox](https://www.virtualbox.org/wiki/Downloads) and [vagrant](http://www.vagrantup.com), which we can use to manage our VMs. (Note alternatively that VMWare Fusion may be used.  _Note: If you want to run an Oracle RDBMS locally, you'll need to install it within a VM since Oracle does not provide direct support for OS X._

```
brew cask install virtualbox
brew cask install vagrant
```

## Docker

'[docker](https://www.docker.io)' may be used to manage 'lightweight containers' running within a Virtualbox VM.

Since docker requires a linux host, I run docker within an ubuntu VM (using [vagrant](http://www.vagrantup.com)). Alternatively, you could use  '[boot2docker](https://github.com/boot2docker/boot2docker)' or the Vagrant '[docker provider](https://docs.vagrantup.com/v2/docker/index.html)'  

A Dockerfile for the zsh-vim-tmux development environment established above is available here: [https://github.com/chasdev/dev-env](https://github.com/chasdev/dev-env) (albeit it is subject to changes).

## Oracle

(TODO: Add section regarding installation of the Oracle RDBMS on a VM as well as sqlplus on OS X.)

