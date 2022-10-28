Facter.add('tomcat_install_path') do
  confine :osfamily => :windows
  setcode do
    value = nil
    Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Apache Software Foundation\Tomcat\9.0\Tomcat9') do |regkey|
      value = regkey['InstallPath']
    end
    value
  end
end
