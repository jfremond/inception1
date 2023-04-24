# TODO.md

## BEFORE STARTING

- [x]	update and upgrade
- [x]	install vim
- [x]	install git
- [x]	install make

```
sudo apt update && sudo apt upgrade
sudo apt install vim
sudo apt install git
sudo apt install make
```

## PREREQUISITES FOR THE PROJECT
- [x]	Create group docker
- [x]	Add jfremond to group sudo
- [x]	Add jfremond to group docker
```
sudo groupadd docker
sudo usermod -aG sudo jfremond
sudo usermod -aG docker jfremond
```
- [x]	[Install Docker Engine](https://docs.docker.com/engine/install/debian/)
