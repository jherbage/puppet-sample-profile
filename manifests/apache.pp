class profile::apache(
  Boolean $default_vhost = false,
  Hash $apache_vhost_servers,
  #Integer $port = 80,
  #String $docroot = '/var/www',
) {
  class { '::apache':
    default_vhost => $default_vhost,
  }  

  #::apache::vhost { 'jherbage2.mylabserver.com':
  #   port    => $port,
  #   docroot => $docroot,
  #}

  create_resources(::apache::vhost, $apache_vhost_servers)

  file { "${docroot}/index.html":
    ensure => present,
    content => '<p>YOU ARRIVED!</P>',
  }
}
