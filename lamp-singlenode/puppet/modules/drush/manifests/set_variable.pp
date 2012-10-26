# Define: drush::set_variable
# Parameters:
#   drupal_dir: the Drupal installation directory (Drush requirement)
#   variable_name: the name of the variable being changed
#   value: the new value of the variable
#
define drush::set_variable ($drupal_dir, $variable_name, $value) {
  exec { "set_drush_var_$variable_name":
    command => "/usr/bin/drush vset $variable_name $value",
    cwd => "${drupal_dir}",
    require => Exec[install_drush]
  }
}