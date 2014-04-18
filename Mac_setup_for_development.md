
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

##Configure the shell, tmux, and vim

Configure iterm to use [Solarized](http://ethanschoonover.com/solarized). Download Solarized (e.g., under ~/devtools/), unzip, and then in iTerm 'Preferences' select 'Profiles' and the 'Colors' tab, click the 'Load Presets' button, and 'import' the 'solarized/iterm2-colors-solarized/Solarized Dark.itermcolors', then make sure it is selected in iTerm.

The next step is to configure the shell, tmux, and vim.  You should use whatever configuration settings you prefer.  I keep my configuration files in GitHub and so the following is specific to my setup. Others are welcome to use my configuration files (fork or borrow parts).

```bash
mkdir devtools && cd $_
git clone https://github.com/chasdev/config-files.git
cd ~
# if you already have a .bash_profile, .vimrc, or .tmux.conf, please create a backup
$ ln -s $HOME/devtools/config-files/.bash_profile .bash_profile
$ ln -s $HOME/devtools/config-files/.tmux.conf .tmux.conf
$ ln -s $HOME/devtools/config-files/.vimrc .vimrc
$ ln -s $HOME/devtools/config-files config-files
```

My vim configuration generally follows the advice found here: [Vim:revisted](http://mislav.uniqpath.com/2011/12/vim-revisited/). Previously I used [janus](https://github.com/carlhuda/janus) which is a very nice (and simple) installation. However, I've found it includes more than I want so have moved to using a simpler pathogen-based solution.

First, install pathogen which will allow other plugins to be installed simply by cloning them

```bash
$ mkdir -p ~/.vim/autoload ~/.vim/bundle; curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
```

As shown above, my '~/.vimrc' file was sym linked to a local repo cloned from GitHub (~/devtools/config-files'. IF you are using another .vimrc, the following minimal .vimrc can be created:

```
execute pathogen#infect('bundle/{}', '~/.vim-bundles/{}')
syntax on
filetype plugin indent on
```

Now install other plugins by cloning repos under a .vim-bundles directory.

* Install [Command-T](https://github.com/wincent/Command-T) - git clone git://git.wincent.com/command-t.git (Here are additional [instructions](https://github.com/wincent/Command-T/blob/master/doc/command-t.txt))
* Install [ack](https://github.com/mileszs/ack.vim) - git clone git@github.com:mileszs/ack.vim.git
* Install [sensible.vim](https://github.com/tpope/vim-sensible) - git clone git@github.com:tpope/vim-sensible.git
* Install [easymotion](https://github.com/Lokaltog/vim-easymotion) - git clone git@github.com:Lokaltog/vim-easymotion.git
* Install [SuperTab](https://github.com/ervandew/supertab) - git clone git@github.com:ervandew/supertab.git)
* Install [tlib](https://github.com/tomtom/tlib_vim.git) - git clone git@github.com:tomtom/tlib_vim.git (dependency for SnipMate)
* Install [vim-addon-mv-utils](https://github.com/MarcWeber/vim-addon-mw-utils.git) (dependency for SnipMate) - git clone git@github.com:MarcWeber/vim-addon-mw-utils.git
* Install [SnipMate](https://github.com/garbas/vim-snipmate.git) - git clone git@github.com:garbas/vim-snipmate.git
* Install [Vim-Snippets](https://github.com/honza/vim-snippets) - git clone git@github.com:honza/vim-snippets.git (snippets used by SnipMate)
* Install [Solarized](https://github.com/altercation/vim-colors-solarized) - git clone git://github.com/altercation/vim-colors-solarized.git
* Install [Fugitive](https://github.com/tpope/vim-fugitive) - git clone git@github.com:tpope/vim-fugitive.git
* Install [Vim-Scala](https://github.com/derekwyatt/vim-scala) - git clone git@github.com:derekwyatt/vim-scala.git
* Install [ZoomWin](https://github.com/vits/ZoomWin) - git clone git@github.com:vits/ZoomWin.git (Note: This is a fork, as ver 25 or better is needed which has not been pushed to the main repo.)
* Install [Node.vim](https://github.com/moll/vim-node) - git clone git@github.com:moll/vim-node.git
* Install [vim-airline](https://github.com/bling/vim-airline) - git clone git@github.com:bling/vim-airline.git

Command-T requires a few more commands to be executed...

```bash
$ cd command-t/ruby/command-t
$ ruby extconf.rb
$ make
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

TODO: Add content regarding the use of docker. In the meantime, here is a really nice [write-up](https://github.com/relateiq/docker_public).

## Oracle

(TODO: Add section regarding installation of the Oracle RDBMS on a VM as well as sqlplus on OS X.)

