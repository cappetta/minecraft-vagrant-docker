ECHO OFF

set startTime=%time%
ECHO Launching the Box without provisioning
vagrant up --no-provision
ECHO Starting Shell Provisioning
vagrant provision --provision-with shell
ECHO Starting Puppet Provisioning
vagrant provision --provision-with puppet
ECHO Starting Docker Provisioning
vagrant provision --provision-with docker
ECHO Starting Docker-Compose Provisioning
vagrant provision --provision-with docker_compose
ECHO Reloading Vagrant
vagrant reload

echo Start Time: %startTime%
echo Finish Time: %time%