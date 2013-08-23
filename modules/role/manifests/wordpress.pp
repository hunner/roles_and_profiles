class role::wordpress inherits role {
  include profile::db
  include profile::db::php
  include profile::wordpress
}
