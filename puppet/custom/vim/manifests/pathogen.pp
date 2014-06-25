class vim::pathogen {

  exec { 'install_pathogen':
    command => 'curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim',
    path => '/usr/bin:/usr/local/bin',
    require => Class['vim::install']
  }

}
