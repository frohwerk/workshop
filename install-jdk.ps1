Expand-Archive -Path .docker/jdk.zip -DestinationPath 'C:/Program Files/Java';
setx /M PATH "$env:Path;C:/Program Files/Java/$(Get-ChildItem -Name "C:/Program Files/Java/jdk*")/bin"
