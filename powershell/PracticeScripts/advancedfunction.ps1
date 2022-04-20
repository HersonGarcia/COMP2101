function myfunc {
param ( [parameter(position=1)]$include,
        [parameter(position=0)]$path,
        [parameter(mandatory=$true,
                     position=2)]$recurse )
    
    write-output "The path variable contains '$path'"
    write-output "The recurse variable contains '$recurse'"
    write-output "The include variable contains '$include'"
}

myfunc "func" -path "fubar" $false
