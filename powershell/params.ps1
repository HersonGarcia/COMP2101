function myfunc {
param ( $include = "",
        [string]$path = ".",
        [int]$recurse = 1 )
    $pathtype = $path.gettype().fullname
    write-output "The path variable contains '$path' which is a $pathtype"
    write-output "The recurse variable contains '$recurse'"
    write-output "The include variable contains '$include'"
}

myfunc -path "func" 