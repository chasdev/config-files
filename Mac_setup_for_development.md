
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

##Install via brew

Now install tools using brew. 

* [tmux](http://tmux.sourceforge.net)
* [ack](http://beyondgrep.com)

```bash
brew install tmux
brew install ack
```

* vim (CLI vim and MacVim GUI, pointing to same place)

```bash
export PATH=/usr/local/bin:$PATH
brew update
brew install vim && brew install macvim
brew link macvim
```

##Configure the shell, tmux, and vim

Configure iterm to use [Solarized](http://ethanschoonover.com/solarized). Download Solarized (e.g., under ~/devtools/), unzip, and then in iTerm 'Preferences' select 'Profiles' and the 'Colors' tab, click the 'Load Presets' button, and 'import' the 'solarized/iterm2-colors-solarized/Solarized Dark.itermcolors', then make sure it is selected in iTerm.  

The next step is to configure the shell, tmux, and vim.  You should use whatever configuration settings you prefer.  I keep my configuration files in GitHub and so the following is specific to my setup. Others are welcome to use my configuration files (fork or borrow parts). 

```bash
mkdir devtools && cd $_
git clone https://github.com/chasdev/config-files.git
cd ~
# if you already have a .bash_profile, .vimrc, or .tmux.conf, please create a backup
ln -s $HOME/devtools/config-files/.bash_profile .bash_profile
ln -s $HOME/devtools/config-files/.tmux.conf .tmux.conf
ln -s $HOME/devtools/config-files/.vimrc .vimrc
ln -s $HOME/devtools/config-files config-files
```

My vim configuration generally follows the advice found here: [Vim:revisted](http://mislav.uniqpath.com/2011/12/vim-revisited/). Previously I used [janus](https://github.com/carlhuda/janus) which is a very nice (and simple) installation. However, I've found it includes more than I want so have moved to storing a .vimrc in my config-files repository. (The .vimrc.before and .vimrc.after files used for a janus distribution are retained for now, but they are not used in this non-janus configuration. Conversely, if you intend to use janus and want to use my config-files, you should symlink the .vimrc.before and .vimrc.after files and NOT the .vimrc file as shown above.)

First, install pathogen which will allow other plugins to be installed simply by cloning them

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle; curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
```

As shown above, my '~/.vimrc' file was sym linked to a local repo cloned from GitHub (~/devtools/config-files'. IF you are using another .vimrc, the following minimal .vimrc can be created:

```
execute pathogen#infect('bundle/{}', '~/.vim-bundles/{}')
syntax on
filetype plugin indent on
```

Now install other plugins by cloning repos under a .vim-bundles directory. 

* Install [Solarized](http://ethanschoonover.com/solarized/vim-colors-solarized)
* Install [Command T](https://github.com/wincent/Command-T/)  (Here are additional [instructions](https://github.com/wincent/Command-T/blob/master/doc/command-t.txt))
* Install [ack](https://github.com/mileszs/ack.vim)
* Install [sensible.vim](https://github.com/tpope/vim-sensible)
* Install [easymotion](https://github.com/Lokaltog/vim-easymotion)

```bash
cd .vim-bundles
# Solarized so colors match iTerm (which uses Solarized)
git clone git://github.com/altercation/vim-colors-solarized.git
#
# Sensible.vim "Defaults everyone can agree on"
git clone git@github.com:tpope/vim-sensible.git
#
# Command-T, which provides fuzzy file lookup in vim
git clone git://git.wincent.com/command-t.git
cd command-t/ruby/command-t
ruby extconf.rb
make
#
# Ack ("grep for developers")
git clone git@github.com:mileszs/ack.vim.git
#
# Easymotion
git clone git@github.com:Lokaltog/vim-easymotion.git
```

##Install the JVM and Supporting Tools and Languages

From iTerm, try 'java -version'. This will bring up a popup with a link to download the JDK which you should then install.  

Next, install [gvm](http://gvmtool.net) which we'll use to install and manage Groovy, Grails, Gradle, vert.x

```bash
curl -s get.gvmtool.net | bash
# Assuming the .bash_profile has been sym linked per above
sbp
# Otherwise, you'll need to 
source "/Users/chardt/.gvm/bin/gvm-init.sh"
#
gvm install groovy
gvm install grails
gvm install gradle
gvm install vertx
```

##Install Node.js

At the time of this writing in order to get 0.11.x which supports important Harmony features like 'generators', you need to download the installer from the [blog page](http://blog.nodejs.org). (This is because odd release versions are 'unstable'.)

##Install Typesafe Activator (Play framework, Scala, Akka)

Download the Typesafe Activator from [here](http://typesafe.com/platform/getstarted).

##Install an IDE

While not recommended for day-to-day development, IDEs provide very nice debugging capabilities that are occasionally very important.




