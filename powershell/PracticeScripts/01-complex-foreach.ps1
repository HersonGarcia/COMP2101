$ethernetAdapters = Get-wmiobject win32_NetworkAdapter |            #store the network adapter objects in a temporary variable for clarity.
    where-object adaptertype -match "ethernet"                      #filter out anything that does not have 'ethernet' in the description.

$configuredadapters = foreach ($adapter in $ethernetAdapters) {     #use foreach to run a scriptblock on each object in the saved adapters collection.

    $nac = $adapter.GetRelated('win32_NetworkAdapterConfiguration') #use the WMI getrelated method to retrieve the configuration object for the adapter and store it in the "nac" variable.

    New-Object PSObject -Property @{
        Index = $adapter.Index
        DHCPEnabled = $nac.DHCPEnabled
        DHCPServer = $nac.dhcpserver
        DHCPLeased = $nac.dhcpleaseobtained
        DHCPExpired = $nac.dhcpleaseexpired
        IP = $nac.IPAddress|? {$_.indexof('.') -gt 0}
        NetconnectionID = $adapter.NetconnectionID
        Name = $adapter.name
        MAC = $adapter.macaddress
        "Speed(Mb)" = $adapter.speed/1000000 -as [int]
        GW =$nac.defaultipgateway
        Netmask = $nac.ipsubnet |? {$_.indexof('.') -gt 0}
        Domain = $nac.dnsdomain
        Hostname = $nac.dnshostname
        "DNS Servers" = $nac.dnsserverserachorder
    }

}

$configureadapters |
    Format-List Name,
                Mac,
                "Speed(Mb)",
                IP,
                Netmask,
                GW,
                Domain,
                Hostname,
                "DNS Servers"
