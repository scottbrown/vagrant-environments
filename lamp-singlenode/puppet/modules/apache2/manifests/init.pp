class apache2 {
  package {
    "apache2":
      ensure => installed
  }

  service {
    "apache2":
      ensure => true,
      require => Package["apache2"]
  }
}