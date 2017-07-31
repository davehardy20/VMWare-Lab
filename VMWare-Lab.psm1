function VMWare-LAB
{
	[cmdletbinding()]
	Param
	(
		[Parameter(Position = 0, Mandatory = $true,
				   HelpMessage = 'start, stop, suspend,reset,pause and unpause')]
		[ValidateNotNullorEmpty()]
		[ValidateSet('start','stop','suspend','reset','pause','unpause')]
		[string]$action
	
	)

$vmrun = "vmrun.exe -T ws "
$vmruncommand = $vmrun + $action

# FW
invoke-expression "$vmruncommand 'E:\Virtual Machines\Endian-FW\Endian-FW.vmx' nogui"

# LAB.LOCAL SYSTEMS

# DC01.LAB.LOCAL
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\Windows Server 2016 Std\Windows Server 2016 Std.vmx' nogui"
# Servers in LAB.LOCAL
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\SpotLight-Server\SpotLight-Server.vmx' nogui"
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\SharePoint-2010\SharePoint-2010.vmx' nogui"
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\Windows Server 2012 Std\Windows Server 2012 Std.vmx' nogui"
# Workstations in LAB.LOCAL
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\Windows 7 x64 01\Windows 7 x64 01.vmx' nogui"
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\Windows 10 Ent-02\Windows 10 Ent -02.vmx' nogui"
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\Windows 10 Ent\Windows 10 Ent.vmx' nogui"
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\Windows 10 Pentest\Windows 10 Pentest.vmx' nogui"

# UK.LAB.LOCAL SYSTEMS

# DC02.UK.LAB.LOCAL
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\DC02-Server-2016\DC02-Server-2016.vmx' nogui"

# Servers in UK.LAB.LOCAL
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\DC02-Server-2008R2\DC02-Server-2008R2.vmx' nogui"

# EXTERNAL.LOCAL SYSTEMS

# DC03.EXTERNAL.LOCAL
Invoke-Expression "$vmruncommand 'E:\Virtual Machines\DC03-Server-2008R2\DC03-Server-2008R2.vmx' nogui"
}