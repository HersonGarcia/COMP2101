function myfunc {
param ( [parameter(valuefrompipeline=$true)]$include,
        [parameter(valuefrompipelinebypropertyname=$true)]$path )
      
    write-output "The path variable contains '$path'"
    write-output "The include variable contains '$include'"
}

"hello" | myfunc 
