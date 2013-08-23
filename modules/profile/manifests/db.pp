class profile::db {
  class { 'mysql::server':
    config_hash => { 'root_password' => '8ZcJZFHsvo7fINZcAvi0' }
  }
}
