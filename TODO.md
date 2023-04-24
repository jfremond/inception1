# TODO.md

## BEFORE STARTING

- [ ] update and upgrade
- [ ] install git
- [ ] install make

```
sudo apt update && sudo apt upgrade
sudo apt install git
sudo apt install make
```

## PREREQUISITES FOR THE PROJECT
- [ ]	Create group docker
- [ ]	Add jfremond to group sudo
- [ ]	Add jfremond to group docker
```
sudo groupadd docker
sudo usermod -aG sudo jfremond
sudo usermod -aG docker jfremond
```
- [ ]	Install docker engine
[Install Docker Engine](https://docs.docker.com/engine/install/debian/)