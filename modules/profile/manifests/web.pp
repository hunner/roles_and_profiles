class profile::web {
  ## Configure apache
  class {  'apache':
    mpm_module => 'prefork',
  }
  include apache::mod::php
  #$vhosts = hiera_hash('apache::vhosts')
  #create_resources('apache::vhost', $vhosts)
}
