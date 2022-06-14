import socket
from io import BytesIO
import matplotlib.image as img
import numpy as np
import base64
import csv
import time

code = 1

with open('code128.csv') as f:
    reader = csv.reader(f)
    code128_arr = list(reader)

def generate_barcode(data):
    imdata = base64.b64decode(data)
    filename = 'some_image.jpg'
    with open(filename, 'wb') as f:
        f.write(imdata)

def read_barcode(im):
    h,w,comp = im.shape
    l=[]
    for j in range(w):
        l.append(1-int(im[1, j, 0]))
    return ''.join(str(x) for x in l)

def chunkify(lst, n):
    return [lst[k*n:(k+1)*n] for k in range(len(lst)//n)]


dico1 = {i[0]:i[1] for i in code128_arr}
dico2 = {i[0]:i[2] for i in code128_arr}
dico3 = {i[0]:i[3] for i in code128_arr}
def netcat(host, port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((host, int(port)))
    data = s.recv(2048)
    print(data[:7])
    data = data[102:-4]
    generate_barcode(data)
    bin_split = chunkify(read_barcode(img.imread('some_image.jpg')), 11)
    L = []
    for bina in bin_split:
        L.append(dico3[bina])
    print(''.join(L))
    time.sleep(1)
    s.send(bytes(''.join(L)+'\n', 'utf-8'))
    time.sleep(1)
    for i in range(127):
        data = s.recv(2048)
        data = data[67:]
        print(str(data[:8]) + ' - done \u2713')
        data = data[102:-4]
        generate_barcode(data)
        bin_split = chunkify(read_barcode(img.imread('some_image.jpg')), 11)
        L = []
        for bina in bin_split:
            L.append(dico3[bina])
        time.sleep(0.1)
        s.send(bytes(''.join(L)+'\n', 'utf-8'))
        time.sleep(0.5)
    print(s.recv(4096))
    s.close()


netcat('challenge.404ctf.fr', 30566)

