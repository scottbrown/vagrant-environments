class php5-mysql {
  package { "php5-mysql":
    ensure => installed,
    require => Package[php5]
  }
}