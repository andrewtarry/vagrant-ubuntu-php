class vim {

  include vim::install, vim::pathogen, vim::vimrc

  vim::plugin { 'nerdtree':
    repo => 'https://github.com/scrooloose/nerdtree.git'
  }
}
