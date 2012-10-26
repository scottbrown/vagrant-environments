class drush {
  package { "php-pear":
    ensure => installed,
    require => Package[php5]
  }

  exec { "add_drush_channel":
    unless => "/usr/bin/pear channel-info pear.drush.org",
    command => "/usr/bin/pear channel-discover pear.drush.org",
    require => Package[php-pear]
  }

  exec { "install_drush":
    unless => "/usr/bin/pear info drush/drush",
    command => "/usr/bin/pear install drush/drush",
    require => Exec[add_drush_channel]
  }
}