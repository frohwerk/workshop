# escape=`
FROM mcr.microsoft.com/dotnet/framework/runtime:4.7.2 AS runtime

SHELL ["powershell", "-Command"]

# ADD jenkins.war jdk.zip *.ps1 .docker/
ADD *.ps1 .docker/

RUN .docker/download.ps1
RUN .docker/install-jdk.ps1

EXPOSE 8080

ENTRYPOINT java -jar .docker/jenkins.war
# ENTRYPOINT ["powershell.exe"]