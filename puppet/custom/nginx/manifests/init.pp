class nginx {

  class { 'nginx::install':} -> class { 'nginx::service': }
}
