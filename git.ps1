git add .
$Commit = Read-Host "Enter commit message "
git commit -m $Commit
git push -u origin master

