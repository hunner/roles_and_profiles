node default {
  ## Create user
  group { 'wordpress':
    ensure => present,
  }
  user { 'wordpress':
    ensure   => present,
    gid      => 'wordpress',
    password => '$1$jrm5tnjw$h8JJ9mCZLmJvIxvDLjw1M/', #puppet
    home     => '/var/www/wordpress',
  }
 
  ## Configure mysql
  class { 'mysql::server':
    config_hash => { 'root_password' => '8ZcJZFHsvo7fINZcAvi0' }
  }
  include mysql::php
 
  ## Configure apache
  include apache
  include apache::mod::php
  apache::vhost { $::fqdn:
    port    => '80',
    docroot => '/var/www/wordpress',
  }
 
  ## Configure ftp for installing updates/themes. Disallows root login
  include vsftpd
 
  ## Configure wordpress
  class { 'wordpress':
    install_dir => '/var/www/wordpress',
    db_name     => 'wordpress',
    db_host     => 'localhost',
    db_user     => 'wordpress',
    db_password => 'wordpress',
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
  }
}
