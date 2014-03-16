class bash ($cache_dir, $log_dir) {

  file { "/usr/bin/install-app":
    source => "puppet:///modules/bash/install-app.sh",
    owner => "vagrant",
    group => "vagrant",
    mode => 755
  }

  file { "/etc/profile.d/env.sh":
    content => template('bash/env.erb')
  }

}