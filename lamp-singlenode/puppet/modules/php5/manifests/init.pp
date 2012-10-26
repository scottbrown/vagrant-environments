class php5 {
  package { "php5":
    ensure => installed,
    notify => Service[apache2]
  }
}