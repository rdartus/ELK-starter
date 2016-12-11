ELK-starter

## Généralités:
Installer la stack ELK en 30 min.


##Installation :
Cloner le dossier dans le dossier Home de votre machine.
```sh
cd ~
sudo git clone http://github.com/rdartus/ELK-starter
sudo chmod +x ~/ELK-starter/ELK.sh
sudo ~/ELK-starter/ELK.sh
```
L'installation effectuera les différents ajouts de service à votre distribution.
Cela configurera ces cervices pour une utilisation simple et sans configuration.

Il est cependant necessaire d'ajouter un motde passe pour securiser kibana avec le reverse proxy.

remplacer utilisateur par le nom d'utilisateur voulu :
```sh
sudo htpasswd -c /etc/nginx/htpasswd.users utilisateur
```
