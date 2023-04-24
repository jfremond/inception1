# TODO.md

## BEFORE STARTING

- [ ] update and upgrade
- [ ] install git
- [ ] install make

```
apt update && apt upgrade
apt install git
apt install make
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