class sws::controller{

  include icclab::params

  $controller_node_public   = $icclab::params::controller_node_address
  $controller_node_internal = $icclab::params::controller_node_address
  $sql_connection           = "mysql://nova:${icclab::params::nova_db_password}@${controller_node_internal}/nova"

  $admin_password           = 'admin_pass'
  $keystone_admin_token     = 'keystone_pass'

  class { 'openstack::controller':
    public_address          => $controller_node_public,
    public_interface        => 'eth0',
    private_interface       => 'eth1',
    internal_address        => $controller_node_internal,
    floating_range          => '192.168.56.128/25',
    fixed_range             => '10.0.0.0/24',
    multi_host              => true,
    network_manager         => 'nova.network.manager.FlatDHCPManager',
    verbose                 => true,
    auto_assign_floating_ip => false,
    mysql_root_password     => 'mysql_root_password',
    admin_email             => 'admin@iownz.you',
    admin_password          => $admin_password,
    keystone_db_password    => 'keystone_db_password',
    keystone_admin_token    => $keystone_admin_token,
    glance_db_password      => 'glance_pass',
    glance_user_password    => 'glance_pass',
    nova_db_password        => 'nova_pass',
    nova_user_password      => 'nova_pass',
    rabbit_password         => 'rabbit_pass',
    rabbit_user             => 'rabbit_user',
    export_resources        => false,
  }

  class { 'openstack::auth_file':
    admin_password       => $admin_password,
    keystone_admin_token => $keystone_admin_token,
    controller_node      => $controller_node_internal,
  }
}

