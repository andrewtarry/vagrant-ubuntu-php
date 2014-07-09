$application = hiera('application')
$languages = hiera('languages')
$tools = hiera('tools')
$webserver_type = $tools['webserver']['type']

node 'default' {

  ##################################################
  #
  # Repo Stage
  #
  #################################################

  # Set up the apt repos in a stage before the main puppet run 

  stage { 'repos': 
  before => Stage['main']
  }

  class { 'apt':
    stage => repos,
    always_apt_update => false
  }

  class { 'repo':
    stage => repos
  }

  class { 'python':
    stage => repos
  }

  ##############################################
  #
  # Main Stage
  #
  ##############################################


  ########################
  # Always install classes
  ########################

  class { 'curl': }
  class { 'unzip': }
  class { 'git': }
  class { 'htop': }

  #
  # Install vim and all the plugins
  #
  class { 'vim': }


  # Set up the bash commands in the profile.
  #
  # There are no custom options as this command will only load the config file
  class { 'bash':
    cache_dir => $application['cache_dir']
  }

  # Host file configuration
  class { 'hosts':
    hostname => $application['server_name']
  }



  ###########################
  # Webserer
  ##########################
  if $webserver_type {

    if $webserver_type == 'apache' {
      class {'apache': }

      apache::vhost { $application['server_name']:
        port => $application['port'],
        docroot  => $application['web_root'],
        directory => $application['web_root'],
        directory_allow_override => 'All',
        directory_require => 'all granted'
      }
    }elsif $webserver_type == 'nginx'{
      class {'nginx': }

      nginx::symfony { $application['server_name']:
        host => $application['server_name'],
        docroot => $application['web_root'],
        port => $application['port'],
        phpport => $languages['php']['socket']
      }

    }

  }

  ###########################
  # php
  ##########################
  $php_version = $languages['php']['version']
  if $php_version != false {

    class { 'php':
      version => $php_version,
      port => $languages['php']['socket']
    }

    if $tools['composer'] {
      class { 'composer': }
    }

    if $tools['phpmyadmin'] {
      class { 'phpmyadmin': 
      webserver => $webserver_type
      }
    }

    if $php_version == 'hhvm' {
      class { 'hhvm': }
    }
  }

  #########################
  # nodejs
  ########################
  $nodejs_version = $languages['nodejs']['version']
  if $nodejs_version != false {

    class { 'nodejs': 
    version => $nodejs_version
    }

    if $tools['grunt'] {
      nodejs::npm { 'grunt-cli': }
    }

    if $tools['bower'] {
      nodejs::npm { 'bower': }
    }

    if $languages['nodejs']['coffeescript'] {
      nodejs::npm { 'coffee-script': }
    }

  }


  #######################
  # Tools and libraries
  ######################
  if $tools['mysql'] {
    class { 'mysql': }
  }


  if $tools['jsonc'] {
    class { 'jsonc': }
  }

  if $languages['java'] {
    class {'java': }
  }

  if $languages['r'] {
    class {'r': }
  }

  if $tools['gcc'] {
    include gcc
  }

  if $tools['mongodb'] {
    include mongodb
  }
  }	
