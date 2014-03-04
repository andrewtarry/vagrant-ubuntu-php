class bash {

  file { "/usr/bin/install-app":
    source => "puppet:///modules/bash/install-app.sh",
    owner => "vagrant",
    group => "vagrant",
    mode => 755
  }

}