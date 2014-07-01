class vim::rcconf {

  file { '/home/vagrant/.vimrc':
    source => "puppet:///modules/vim/vimrc",
    owner => 'vagrant',
    group => 'vagrant',
    require => Class['vim::install']
  }

}
