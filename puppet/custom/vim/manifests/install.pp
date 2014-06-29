class vim::install {

  package { 'vim':
    ensure => latest
  }

  file { '/home/vagrant/.vim':
    ensure => 'directory'
    }->

    file { '/home/vagrant/.vim/autoload':
      ensure => 'directory'
      }->

      file { '/home/vagrant/.vim/bundle':
        ensure => 'directory'
      }
}
