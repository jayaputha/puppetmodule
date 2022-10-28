define tomcat::tomcat_install(
  String $package_name,
){
    package { "${package_name}":
      ensure            => 'latest',
      provider          => 'chocolatey',
      source            => 'C:\Users\dharma548\Downloads',
      package_settings  => { 'verbose' => true, 'log_output' => true, },
    }
    /*
    service { "${service_name}":
      name    => "${service_name}",
      enable  => true,
      ensure  => running,
      require => Package["${package_name}"],
    }*/

    exec { 'update-server-xml':
      command   => '$d = puppet facts | ? {$_ -like "*tomcat_install_path*"}
  if(![System.String]::IsNullOrEmpty($d)){
      $logsPath = $d.Split("`"")[3].tostring().replace("\\","\")
      $serverFile = Join-Path $logsPath "conf\server.xml"
      [xml]$xmlDoc = Get-Content $serverFile
      $xmlDoc.Server.Service.Connector.port = "8081"
      $xmlDoc.Save($serverFile)
  }',
      provider  => powershell,
      logoutput => true,
      require => Package["${$package_name}"]
    }
}
