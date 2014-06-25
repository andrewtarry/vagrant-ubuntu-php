class composer::download {

  exec { 'install composer':
    command => "curl -sS https://getcomposer.org/installer | php -- --install-dir=${composer::install_dir} --filename=${composer::filename}",
    require => [Class['curl'], Class['php']],
    path => '/usr/bin:/usr/local/bin:/bin',
    creates => "/usr/bin/${composer::filename}"
  }

}
