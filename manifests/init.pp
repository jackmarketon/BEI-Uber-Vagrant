group {'puppet': ensure=>present }

Exec { path => ['/bin/','/sbin/','/usr/bin/','/usr/sbin/' ] }
File { owner => 0, group => 0, mode => 0644 }

class { 'apt':
	always_apt_update => true,
}

exec { 'apt-get update':
	command => "apt-get update",
}

package { [
	'build-essential',
	'vim',
	'curl',
	'git-core'
	]:
	ensure => 'installed',
}

class { 'apache': }

apache::dotconf { 'custom': 
	content => 'EnableSendfile Off',
}

apache::module { 'rewrite': }

apache::vhost { 'uber.vg.blueearth.net':
	server_name 	=> 'uber.vg.blueearth.net',
	serveraliases 	=> [
		'edward.vg.blueearth.net',
		'jacob.vg.blueearth.net'
	],
	docroot 		=> '/var/www/',
	port			=> '80',
	env_variables 	=> [],
	priority		=> '1',
}

class {'mongodb':
	enable_10gen => true,
}

class { 'php':
	service 			=> 'apache',
	module_prefix		=> '',
}

php::module { 'php5-cli': }
php::module { 'php5-curl': }
php::module { 'php5-intl': }
php::module { 'php5-mcrypt': }

class { 'php::devel': 
	require => Class['php']
}

class { 'php::pear':
	require => Class['php'],
}

php::pecl::module{'mongo':
	use_package => 'true',
	notify => Class['apache'],
}


# install mongo db pecl extednsion
#package { "make": 
#    ensure => "installed"
#}

#exec { "sudo pecl install mongo":
#    command => "pecl install mongo",
#    require => Package["make", "php"],
#    unless => 'pecl info mongo'
#}

file { "/etc/php5/conf.d/mongo.ini":
    content=> 'extension=mongo.so',
    notify => Class['apache'],
    require=> Class['php'],
}

if !defined(Package['git-core']) {
	package {'git-core': }
}