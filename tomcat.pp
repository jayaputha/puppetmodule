/*package { 'apache-tomcat':
  ensure            => 'latest',
  provider          => 'chocolatey',
  source            => 'C:\Users\dharma548\Downloads',
  package_settings  => { 'verbose' => true, 'log_output' => true, },
}
service { "Tomcat9":
  name    => "Tomcat9",
  enable  => true,
  ensure  => running,
  require => Package['apache-tomcat'],
}

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
  require => Package['apache-tomcat']
}
*/

class {'tomcat':
}
tomcat::tomcat_install{'install_tomcat':
  package_name => 'apache-tomcat'
}
