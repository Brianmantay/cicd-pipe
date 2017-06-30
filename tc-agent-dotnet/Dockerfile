FROM jetbrains/teamcity-agent

RUN sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN apt-get update
RUN apt-get -y install dotnet-dev-1.0.4

RUN mkdir ~/Octopus
RUN apt-get install wget
RUN wget https://download.octopusdeploy.com/octopus-tools/4.18.0/OctopusTools.4.18.0.ubuntu.16.04-x64.tar.gz -P ~/Octopus
RUN tar -xvzf ~/Octopus/OctopusTools.4.18.0.ubuntu.16.04-x64.tar.gz
RUN ln -s ~/Octopus/Octo /usr/local/bin/Octo
