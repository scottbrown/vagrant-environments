class php5-gd {
  package { "php5-gd":
    ensure => installed,
    require => Package[apache2]
  }
}