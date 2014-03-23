class bash {

  file { "/etc/profile.d/env.sh":
    content => template('bash/env.erb')
  }

}