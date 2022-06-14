import numpy as np
from PIL import Image




imv1 = Image.open("decoupe/1.png")

for i in range(23):
    path = "decoupe/"+str(i+2)+".png"
    print("add", path)
    im2 = Image.open(path)
    dst = Image.new('RGB', (imv1.width + im2.width, imv1.height))
    dst.paste(imv1, (0, 0))
    dst.paste(im2, (imv1.width, 0))
    imv1 = dst


for i in range(22):
    l = (i+1)*24 + 1
    path = "decoupe/"+str(l)+".png"
    print(path)
    im1 = Image.open(path)
    print("deb", l)
    for j in range(22):
        im2 = Image.open("decoupe/"+str(l+j)+".png")
        dst = Image.new('RGB', (im1.width + im2.width, im1.height))
        dst.paste(im1, (0, 0))
        dst.paste(im2, (im1.width, 0))
        im1 = dst
    imv2 = im1
    dst = Image.new('RGB', (imv1.width, imv1.height + imv2.height))
    dst.paste(imv1, (0, 0))
    dst.paste(imv2, (0, imv1.height))
    imv1 = dst

dst.save('test.png')