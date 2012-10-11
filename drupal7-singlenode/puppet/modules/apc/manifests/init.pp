class apc {
  package { "apache2-dev":
    ensure => installed
  }

  package { "build-essential":
    ensure => installed
  }

  exec { "install_apc":
    command => "sudo pecl install apc",
    require => [ Package[apache2-dev], Package[build-essential], Package[php-pear] ]
  }

  file { "/etc/php5/conf.d/apc.ini":
    ensure => file,
    content => template("apc/apc.ini.erb"),
    require => Exec[install_apc],
    notify => Service[apache2]
  }

  file { "/var/www/apc.php":
    source => "/usr/share/php/apc.php",
    require => Exec[install_apc]
  }
}

