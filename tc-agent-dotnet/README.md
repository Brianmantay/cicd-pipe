# tc-agent-dotnet

An extension of the jetbrains/teamcity-agent image with dotnet core installed for building dotnet core projects and Octopus tool for pushing packages to the Octopus server

## Build

`$ docker build -t bmantay/teamcity-agent-dotnet .`

## Push to DockerHub

`$ docker login --username xxx --password xxx`

`$ docker push bmantay/teamcity-agent-dotnet`