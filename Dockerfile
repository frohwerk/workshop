# escape=`
FROM mcr.microsoft.com/dotnet/framework/runtime:4.7.2 AS runtime

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $progressPreference = 'silentlyContinue';"]

# ADD jdk.zip env.ps1 docker-build/
ADD env.ps1 docker-build/

RUN `
mkdir 'C:\\Program Files\\Java'; `
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; `
Invoke-WebRequest -UseBasicParsing -Uri 'https://api.adoptopenjdk.net/v2/binary/releases/openjdk8?openjdk_impl=hotspot&os=windows&arch=x64&release=latest&type=jdk' -OutFile docker-build/jdk.zip; `
Expand-Archive -Path docker-build/jdk.zip -DestinationPath 'C:\\Program Files\\Java'; `
powershell -Command docker-build/env.ps1

ENTRYPOINT ["java.exe", "-version"]
# ENTRYPOINT ["powershell.exe"]