# Define: ipboard::create_vhost
# Parameters:
# arguments
#
define apache2::create_vhost ($hostname, $www_dir) {
  file { "/etc/apache2/sites-available/app":
    ensure => file,
    owner => root,
    group => root,
    mode => 644,
    content => template("apache2/vhost.erb"),
    require => Package[apache2]
  }

  exec { "enable_site":
    command => "a2ensite app",
    path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    require => File["/etc/apache2/sites-available/app"],
    notify => Service[apache2]
  }
}