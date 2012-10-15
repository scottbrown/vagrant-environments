# Drupal 7 Single Node

Automatically provisions a vagrant environment with a base install
of Drupal 7, using drush.  Provisioning happens via Puppet, so you
may find that you need some knowledge around that if you want to 
customize the scripts.

## Requirements

* 64-bit CPU
* at least 512MB free RAM

## Installed Services

This project will install the following services:
* Ubuntu 12.04
* PHP 5
* Drupal 7.x (latest)
* MySQL 5.x (latest)
* APC opcode caching

As the name of the directory suggests, all services are provisioned 
onto a single machine, they are not separated into tiers.  This 
provides fast and simple creation of a basic Drupal system.

## Drupal Website

Drupal is created using drush, a Makefile, and the standard install
profile provided in Drupal 7.  This is similar to if you downloaded 
the drupal tarball yourself, and then proceeded to run through the 
install wizard using the `Standard` profile.

You will be able to see your website at: [http://localhost:8080/drupal7](http://localhost:8080/drupal7)

You can login to your Drupal instance with the username `admin` and password `admin`.

## APC Caching

Only APC opcode caching is being used, as APC for data caching is not 
always the best (APC's memory mgmt sucks) and Memcached is much better.

As an added bonus, you will also be able to view APC's statistics by 
visiting: [http://localhost:8080/apc.php](http://localhost:8080/apc.php)

To prevent APC's stats page from skewing the statistics, I am manually 
filtering out `/var/www/apc.php` from being in the opcode cache.

## Usage

```bash
$ cd vagrant-environments/drupal7-singlenode
$ vagrant up
... do some work ...
$ vagrant halt
$ vagrant destroy
```

