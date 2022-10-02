

function GetGitBranch($dir) {
    if("$dir".length -lt 2){
         return ""
    }
    $gitbranch = cat "$dir\.git\HEAD" | %{ $_.Split("refs/heads/")[1] }
    if("$gitbranch".length -lt 1){
         $parent = Split-Path $dir -Parent
         return GetGitBranch $parent
    }
    return $gitbranch
}

function PrintFirstSegment($text, $color) {
   Write-Host "$([char]0xe0b6)" -NoNewline -ForegroundColor $color -BackgroundColor Black 
   Write-Host "$text" -ForegroundColor Black -BackgroundColor $color -NoNewline
   Write-Host "$([char]0xe0b0)" -ForegroundColor $color -BackgroundColor Black -NoNewline
}

function PrintMiddleSegment($text, $color) {
   Write-Host "$([char]0xe0b0)" -NoNewline -ForegroundColor Black -BackgroundColor $color
   Write-Host "$text" -ForegroundColor Black -BackgroundColor $color -NoNewline
   Write-Host "$([char]0xe0b0)" -ForegroundColor $color -BackgroundColor Black -NoNewline
}

function Prompt {
   $cwd = $executionContext.SessionState.Path.CurrentLocation
   $dirName = Split-Path -Path $cwd -Leaf 
   $user = $env:UserName
   $dateStr = Get-Date -Format 'HH:mm:ss'
   PrintFirstSegment $user 1
   PrintMiddleSegment "$dirName/" 2
   $gitbranch = GetGitBranch $cwd
  
   if ( "$gitbranch".length -gt 0 ){
      PrintMiddleSegment "$([char]0xe0a0)$gitbranch" 4
   }

   PrintMiddleSegment "$dateStr" 5
   "$("`n$ " * ($nestedPromptLevel + 1))"

}



