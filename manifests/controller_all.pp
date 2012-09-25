class sws::controller_all{

  include sws::params
  if $controller_node_public == undef{
	$controller_node_public   = $sws::params::controller_node_public
  	#$controller_node_public	=$::ipaddress
  }
  if $controller_node_internal == undef{
  	$controller_node_internal = $sws::params::controller_node_internal
  }  
  if $sql_connection == undef{
  	$sql_connection	= $sws::params::sql_connection
  }
  if $admin_password == undef{
  	$admin_password	= $sws::params::admin_password
  }
  if $keystone_admin_token == undef{
  	$keystone_admin_token = $sws::params::keystone_admin_token
  }
  if $public_interface == undef{
  	$public_interface = $sws::params::public_interface
  }
  if $private_interface == undef{
    	$private_interface = $sws::params::private_interface
  }
  if $floating_range == undef{
  	$floating_range = $sws::params::floating_range
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
  if $verbose == undef{
  	$verbose = $sws::params::verbose
  }
  if $auto_assign_floating_ip == undef{
  	$auto_assign_floating_ip=$sws::params::auto_assign_floating_ip
  }
  if $mysql_root_password == undef{
  	$mysql_root_password = $sws::params::mysql_root_password
  }
  if $admin_email == undef{
  	$admin_email = $sws::params::admin_email
  }
  if $admin_password == undef{
  	$admin_password = $sws::params::admin_password
  }
  if $keystone_db_password == undef{
  	$keystone_db_password = $sws::params::keystone_db_password
  }
  if $keystone_admin_token == undef{
   	$keystone_admin_token = $sws::params::keystone_admin_token
  }
  if $glance_db_password == undef{
  	$glance_db_password = $sws::params::glance_db_password
  }
  if $glance_user_password == undef{
  	$glance_user_password = $sws::params::glance_user_password
  }
 
  if $nova_db_password == undef{
  	$nova_db_password = $sws::params::nova_db_password
  }
  if $nova_user_password == undef{
  	$nova_user_password = $sws::params::nova_user_password
  }
  if $rabbit_password== undef{
  	$rabbit_password = $sws::params::rabbit_password
  }
  if $rabbit_user == undef{
  	$rabbit_user = $sws::params::rabbit_user
  }
  if $export_resources == undef{
  	$export_resources = $sws::params::export_resources
  }
  
  class { 'openstack::controller':
    public_address          => $controller_node_public,
    public_interface        => $public_interface,
    private_interface       => $private_interface,
    internal_address        => $controller_node_internal,
    floating_range          => $floating_range,
    fixed_range             => $fixed_range,
    multi_host              => $multi_host,
    network_manager         => $network_manager,
    verbose                 => $verbose,
    auto_assign_floating_ip => $auto_assign_floating_ip,
    mysql_root_password     => $mysql_root_password,
    admin_email             => $admin_email,
    admin_password          => $admin_password,
    keystone_db_password    => $keystone_db_password,
    keystone_admin_token    => $keystone_admin_token,
    glance_db_password      => $glance_db_password,
    glance_user_password    => $glance_user_password,
    nova_db_password        => $nova_db_password,
    nova_user_password      => $nova_user_password,
    rabbit_password         => $rabbit_pass,
    rabbit_user             => $rabbit_user,
    export_resources        => $export_resources,
  }

  class { 'openstack::auth_file':
    admin_password       => $admin_password,
    keystone_admin_token => $keystone_admin_token,
    controller_node      => $controller_node_internal,
  }
}

