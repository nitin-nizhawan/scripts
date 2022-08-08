
# save this file to where  $PROFILE  variable points to in powershell

function Prompt {
   $dirName = Split-Path -Path $executionContext.SessionState.Path.CurrentLocation -Leaf 
   $user = $env:UserName
   Write-Host "[" -NoNewline 
   Write-Host "$($dirName)" -NoNewline -ForegroundColor blue
   Write-Host "]"  -NoNewline
   "$("`n$ " * ($nestedPromptLevel + 1))"
   
}


