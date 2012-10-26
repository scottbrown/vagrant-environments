# Define: drush::disable_module
# Arguments:
#   $drupal_dir: the root directory of the Drupal installation
#   $module_name: the name of the module to disable
#
define drush::disable_module ($drupal_dir, $module_name) {
  exec { "disable_drupal_module_$module_name":
    command => "/usr/bin/drush dis $module_name -y",
    cwd => $drupal_dir,
    require => Exec[install_drush]
  }
}