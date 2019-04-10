$ErrorActionPreference = 'Stop';
$progressPreference = 'silentlyContinue';

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;

Invoke-WebRequest -UseBasicParsing -Uri 'http://mirrors.jenkins.io/war-stable/latest/jenkins.war' -OutFile .docker/jenkins.war;
Invoke-WebRequest -UseBasicParsing -Uri 'https://api.adoptopenjdk.net/v2/binary/releases/openjdk8?openjdk_impl=hotspot&os=windows&arch=x64&release=latest&type=jdk' -OutFile .docker/jdk.zip;
