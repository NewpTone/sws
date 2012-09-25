class sws::compute{

  include sws::params

  if $controller_node_public == undef{
	$controller_node_public   = $sws::params::controller_node_address
  }
  if $controller_node_internal == undef{
  	$controller_node_internal = $sws::params::controller_node_internal
  }  
  if $sql_connection == undef{
  	$sql_connection	= $sws::params::sql_connection
  }
  if $public_interface == undef{
  	$public_interface = $sws::params::public_interface
  }
  if $private_interface == undef{
    	$private_interface = $sws::params::private_interface
  }
  if $libvirt_type == undef{
    	$private_interface = $sws::params::libvirt_type
  }
  if $fixed_range == undef{
  	$fixed_range = $sws::params::fixed_range
  }
  if $multi_host == undef{
  	$multi_host = $sws::params::multi_host
  }
  if $network_manager == undef{
  	$network_manager = $sws::params::network_manager
  }
  
  if $nova_user_password == undef{
  	$nova_user_password = $sws::params::nova_user_password
  }
  if $rabbit_password == undef{
  	$rabbit_password = $sws::params::rabbit_password
  }
  if $rabbit_user == undef{
  	$rabbit_user = $sws::params::rabbit_user
  }
  if $glance_api_servers == undef{
  	$glance_api_servers = $sws::params::glance_api_servers
  }
  if $vncproxy_host == undef{
  	$vncproxy_host = $sws::params::vncproxy_host
  }
  if $vnc_enabled == undef{
  	$vnc_enabled = $sws::params::vnc_enabled
  }
  if $verbose == undef{
  	$verbose = $sws::params::verbose
  }
  if $manage_volumes == undef{
  	$manage_volumes = $sws::params::manage_volumes
  }
  if $nova_volume == undef{
  	$nova_volume = $sws::params::nova_volume
  }

  class { 'openstack::compute':
    public_interface   => $public_interface,
    private_interface  => $private_interface,
    internal_address   => $ipaddress_eth0,
    libvirt_type       => $libvirt_type,
    fixed_range        => $fixed_range,
    network_manager    => $network_manager,
    multi_host         => $multi_host,
    sql_connection     => $sql_connection,
    nova_user_password => $nova_user_password,
    rabbit_host        => $controller_node_internal,
    rabbit_password    => $rabbit_password,
    rabbit_user        => $rabbit_user,
    glance_api_servers => "$glance_api_servers",
    vncproxy_host      => $vncproxy_host,
    vnc_enabled        => $vnc_enabled,
    verbose            => $verbose,
    manage_volumes     => $manage_volumes,
    nova_volume        => $nova_volume,
  }
}

