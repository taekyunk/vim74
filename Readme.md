% Readme
%
%

* Set up vim plugins managed by Pathogen
* Setup for windows
* Based on Vim 7
* To use this under linux,

```
# open a terminal from ~
# install vim
sudo apt-get install -y vim-gnome

# clone this repository into ~/vimconfig
git clone https://github.com/taekyunk/vim74 vimconfig

# make symbolic links to all required directory and files
ln -s vimconfig/vimfiles .vim
ln -s vimconfig/_vimrc .vimrc
ln -s vimconfig/.gvimrc .gvimrc
```
Alternatively, use a script

````
cd ~
sh vimconfig/setup.sh
````

