class icclab::compute{

  include icclab::params

  $controller_node_public   = $icclab::params::controller_node_address
  $controller_node_internal = $icclab::params::controller_node_address
  $sql_connection         = "mysql://nova:${icclab::params::nova_db_password}@${controller_node_internal}/nova"

  class { 'openstack::compute':
    public_interface   => 'eth0',
    private_interface  => 'eth1',
    internal_address   => $ipaddress_eth0,
    libvirt_type       => 'qemu',
    fixed_range        => '10.0.0.0/24',
    network_manager    => 'nova.network.manager.FlatDHCPManager',
    multi_host         => true,
    sql_connection     => $sql_connection,
    nova_user_password => 'nova_pass',
    rabbit_host        => $controller_node_internal,
    rabbit_password    => 'rabbit_pass',
    rabbit_user        => 'rabbit_user',
    glance_api_servers => "${controller_node_internal}:9292",
    vncproxy_host      => $controller_node_public,
    vnc_enabled        => true,
    verbose            => true,
    manage_volumes     => true,
    nova_volume        => 'nova-volumes'
  }
}

