class vim {
  

  include vim::install, vim::pathogen, vim::vimrc

  vim::plugin { 'nerdtree':
    repo => 'https://github.com/scrooloose/nerdtree.git'
  }

  vim::plugin { 'json':
    repo => 'https://github.com/elzr/vim-json.git'
  }

  vim::plugin { 'puppet':
    repo => 'git://github.com/rodjek/vim-puppet.git'
  }

  vim::plugin { 'coffeescript':
    repo => 'https://github.com/kchmck/vim-coffee-script.git'
  }

  vim::plugin { 'less':
    repo => 'https://github.com/groenewege/vim-less'
  }
  
  vim::plugin { 'twig':
    repo => 'https://github.com/evidens/vim-twig.git'
  }
  
  vim::plugin { 'solorized':
    repo => 'git://github.com/altercation/vim-colors-solarized.git'
  }

  vim::plugin { 'hack':
    repo => 'git://github.com/hhvm/vim-hack.git'
  }
  
  vim::plugin { 'markdown':
    repo => 'https://github.com/plasticboy/vim-markdown.git'
  }
  
  vim::plugin { 'airline':
    repo => 'https://github.com/bling/vim-airline' 
  }
}
