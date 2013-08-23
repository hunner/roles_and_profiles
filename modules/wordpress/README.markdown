# WordPress Module

## Overview

This will set up an installation of Wordpress 3.5 on Debian and Redhat style distributions.

## Capabilities

Installation includes:

- Configuration of WordPress DB connection parameters
- Generate secure keys and salts for `wp-config.php`.
- Optional creation of MySQL database/user/permissions.

Requires:

- Configuration of php-enabled webserver
- Configuration MySQL server
- PHP 5.3 or greater

## Parameters

* `install_dir`<br />
  Specifies the directory into which wordpress should be installed. Default: `/opt/wordpress`

* `install_url`<br />
  Specifies the url from which the wordpress tarball should be downloaded.  Default: `http://wordpress.org`

* `version`<br />
  Specifies the version of wordpress to install. Default: `3.5`

* `create_db`<br />
  Specifies whether to create the db or not. Default: `true`

* `create_db_user`<br />
  Specifies whether to create the db user or not. Default: `true`

* `db_name`<br />
  Specifies the database name which the wordpress module should be configured to use. Default: `wordpress`

* `db_host`<br />
  Specifies the database host to connect to. Default: `localhost`

* `db_user`<br />
  Specifies the database user. Default: `wordpress`

* `db_password`<br />
  Specifies the database user's password in plaintext. Default: `password`

* `wp_owner`<br />
  Specifies the owner of the wordpress files. Default: `root`

* `wp_group`<br />
  Specifies the group of the wordpress files. Default: `0` (\*BSD/Darwin compatible GID)

* `wp_lang`<br />
  WordPress Localized Language. Default: ``

* `wp_plugin_dir`<br />
  WordPress Plugin Directory. Full path, no trailing slash. Default: WordPress Default

## Example Usage

Default deployment (insecure; default passwords and installed as root):

```puppet
class { 'wordpress': }
```

Basic deployment (secure database password, installed as `wordpress` user/group):

```puppet
class { 'wordpress':
  wp_owner    => 'wordpress',
  wp_group    => 'wordpress',
  db_user     => 'wordpress',
  db_password => 'hvyH(S%t(\"0\"16',
}
```

Externally hosted MySQL DB:

```puppet
class { 'wordpress':
  db_user     => 'wordpress',
  db_password => 'hvyH(S%t(\"0\"16',
  db_host     => 'db.example.com',
}
```

Disable module's database/user creation (the database and db user must still exist with correct permissions):

```puppet
class { 'wordpress':
  db_user        => 'wordpress',
  db_password    => 'hvyH(S%t(\"0\"16',
  create_db      => false,
  create_db_user => false,
}
```

Install specific version of WordPress:

```puppet
class { 'wordpress':
  version => '3.4',
}
```

Install WordPress to a specific directory:

```puppet
class { 'wordpress':
  install_dir => '/var/www/wordpress',
}
```

Download `wordpress-${version}.tar.gz` from an internal server:

```puppet
class { 'wordpress':
  install_url => 'http://internal.example.com/software',
}
```

