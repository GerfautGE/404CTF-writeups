# PNG : Drôle de Chimères [2/4]

Après avoir récuperer le fichier stage2.png dans la premiere partie du challenge, on peut continuer son analyse .

on peut utiliser le package [pngcheck](http://www.libpng.org/pub/png/apps/pngcheck.html) pour verifier que la constitution du fichier PNG est correcte.

En sortie on obtient : 

```shell
File: stage2.png (497701 bytes)
  chunk IHDR at offset 0x0000c, length 13
    513 x 340 image, 32-bit RGB+alpha, non-interlaced
  chunk sTeG at offset 0x00025, length 388350:  illegal reserved-bit-set chunk
ERRORS DETECTED in /home/gerf/Desktop/stage2.png

```

cela permet de voir que le fichier PNG possède un curieux chunk illégal "**sTeG**". 

On peut extraire les données de ce Chunk en utilisant le package [pngsplit](http://manpages.ubuntu.com/manpages/bionic/man1/pngsplit.1.html).

ceci nous donne un [fichier](./stage2.png.0002.sTeG) contenant le chunk sTeG.

Le fichier n'est malheuresement pas lisible. On peut tout de même regarder sa composition avec [Okteta](https://invent.kde.org/utilities/okteta)

On y découvre la structure classique d'un fichier PNG :
>IHDR-IDAT-...-IEND

Le seul problème est que les [magic numbers](https://en.wikipedia.org/wiki/Magic_number_(programming)) ne correspondent pas à un fichier PNG.
On peut alors les rectifier dans Okteta.

On a alors :

![AltText](./stage3.png)

D'où le flag :
>404CTF{7h47_v1c10us_m1zzing_z19natur3}
