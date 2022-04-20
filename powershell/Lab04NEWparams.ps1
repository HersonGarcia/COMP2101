function Systeminformation {
        systemhardware 
        operatingsystem
        processor
        physicalmemory
        diskinfo
        myipconf
        videocard 



    }
Systeminformation

$systemhardware = systemhardware
$operatingsystem = operatingsystem
$processor = processor
$physicalmemory = physicalmemory
$diskinfo = diskinfo
$Network = myipconf
$videocard = videocard

function systeminformation {
    param ($systemhardware, 
           $operatingsystem,
           $processor,
           $physicalmemory,
           $diskinfo,
           $Network,
           $videocard)
}
systeminformation -Network 