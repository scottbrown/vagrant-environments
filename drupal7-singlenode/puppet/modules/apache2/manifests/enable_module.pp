# Define: apache2::enable_module
#
# $module_name: The name of the module to enable in Apache2
#
define apache2::enable_module ($module_name) {
  exec { "a2enmod $module_name":
    path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    require => Package[apache2],
    notify => Service[apache2]
  }
}