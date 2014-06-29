class bash ($cache_dir = false) {

  file { "/etc/profile.d/env.sh":
    content => template('bash/env.erb')
  }

}
