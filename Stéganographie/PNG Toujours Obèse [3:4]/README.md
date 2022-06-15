# PNG : Toujours Obèse [3/4]

On récupère le fichier stage3.png dans la deuxième partie du challenge.

On utilise des outils fréquents de Stéganographie pour chercher les données contenues dans le fichier.

Et en utilisant le package [zsteg](https://github.com/zed-0xff/zsteg), on obtient :

```shell
extradata:imagedata .. file: PNG image data, 800 x 600, 8-bit/color RGBA, non-interlaced
    00000000: 89 50 4e 47 0d 0a 1a 0a  00 00 00 0d 49 48 44 52  |.PNG........IHDR|
    00000010: 00 00 03 20 00 00 02 58  08 06 00 00 00 9a 76 82  |... ...X......v.|
    00000020: 70 00 00 00 06 62 4b 47  44 00 ff 00 ff 00 ff a0  |p....bKGD.......|
    00000030: bd a7 93 00 00 00 09 70  48 59 73 00 00 0b 13 00  |.......pHYs.....|
    00000040: 00 0b 13 01 00 9a 9c 18  00 00 20 00 49 44 41 54  |.......... .IDAT|
    00000050: 78 9c ec bd 07 7c 94 55  f6 ff 7f 9f 36 bd 65 52  |x....|.U....6.eR|
    00000060: 29 16 5c 65 15 cb 8a 80  14 81 d0 7b 0b 21 d4 d0  |).\e.......{.!..|
    00000070: 23 bd 23 5d 0c 58 16 5d  5d 45 d7 b2 ac ba 76 44  |#.#].X.]]E....vD|
    00000080: c0 8e 5d d7 45 29 02 21  09 a4 87 40 12 4a 20 21  |..].E).!...@.J !|
    00000090: 99 64 fa cc 53 7f e7 3c  33 41 77 7f bf ff eb ff  |.d..S..<3Aw.....|
    000000a0: ad e2 ae f7 8d c7 fb d4  99 e7 99 cc dc b9 9f 39  |...............9|
    000000b0: f7 9c c3 10 0a 85 42 a1  50 28 14 0a 85 42 f9 99  |......B.P(...B..|
    000000c0: 60 ae f6 05 50 28 14 0a  85 42 a1 50 28 14 0a 85  |`...P(...B.P(...|
    000000d0: 42 a1 50 28 14 0a 85 42  a1 fc 8f c3 5d ed 0b a0  |B.P(...B....]...|
    000000e0: 50 28 14 0a 85 42 a1 50  28 bf 1e e8 14 2c 0a 85  |P(...B.P(....,..|
    000000f0: 42 a1 50 28 14 0a 85 f2  b3 c1 5e ed 0b a0 50 28  |B.P(......^...P(|
imagedata           .. text: "z!!!\t112"
```

Donc on utilise zsteg pour extraire les données : 

```shell
zsteg  -E "extradata:imagedata" stage3.png > stage4.png
```
 Ce qui nous donne : 

 ![FlagImage](/St%C3%A9ganographie/PNG%20Toujours%20Ob%C3%A8se%20%5B3%3A4%5D/stage4.png)

 d'où le flag :

>404CTF{271l1_0b323_&_still_h4d_s3cr3tz_4_U}