  3           0 LOAD_GLOBAL              0 (input)
              2 CALL_FUNCTION            0
              4 STORE_FAST               0 (inp)

  5           6 LOAD_CONST               1 (True)
              8 STORE_FAST               1 (s)

  6          10 LOAD_CONST               2 ('')
             12 STORE_FAST               2 (n)

  7          14 LOAD_CONST               2 ('')
             16 STORE_FAST               3 (p)

  8          18 BUILD_LIST               0
             20 LOAD_CONST               3 ((88, 1, 140, 1, 203, 208, 89, 207, 132, 191, 178, 110, 138, 132, 210, 1, 140, 156, 138, 140, 191, 187, 89, 89, 187, 1, 208, 231, 161, 235, 178, 188, 187, 132, 187))
             22 LIST_EXTEND              1
             24 STORE_FAST               4 (f)

 10          26 LOAD_FAST                0 (inp)
             28 LOAD_CONST               2 ('')
             30 COMPARE_OP               2 (==)
             32 POP_JUMP_IF_FALSE       46

 11          34 LOAD_GLOBAL              1 (print)
             36 LOAD_CONST               4 ('Nope')
             38 CALL_FUNCTION            1
             40 POP_TOP

 12          42 LOAD_FAST                1 (s)
             44 RETURN_VALUE

 14     >>   46 LOAD_GLOBAL              2 (range)
             48 LOAD_GLOBAL              3 (len)
             50 LOAD_FAST                0 (inp)
             52 CALL_FUNCTION            1
             54 CALL_FUNCTION            1
             56 GET_ITER
        >>   58 FOR_ITER                32 (to 92)
             60 STORE_FAST               5 (k)

 15          62 LOAD_FAST                2 (n)
             64 LOAD_FAST                0 (inp)
             66 LOAD_GLOBAL              4 (int)
             68 LOAD_GLOBAL              3 (len)
             70 LOAD_FAST                0 (inp)
             72 CALL_FUNCTION            1
             74 LOAD_FAST                5 (k)
             76 BINARY_SUBTRACT
             78 LOAD_CONST               5 (1)
             80 BINARY_SUBTRACT
             82 CALL_FUNCTION            1
             84 BINARY_SUBSCR
             86 INPLACE_ADD
             88 STORE_FAST               2 (n)
             90 JUMP_ABSOLUTE           58

 17     >>   92 BUILD_LIST               0
             94 LOAD_CONST               6 ((159, 44, 176, 145, 103, 133, 49, 97, 113, 136, 184, 60, 85, 69, 64, 186, 182, 37, 56, 170, 19, 108, 152, 183, 41, 197, 252, 77, 35, 127, 198, 43, 148, 48, 46, 62, 15, 139, 95, 9, 38, 73, 160, 175, 226, 254, 129, 211, 132, 7, 90, 208, 187, 164, 158, 201, 116, 93, 54, 87, 126, 128, 16, 50, 244, 12, 4, 188, 166, 59, 235, 28, 199, 92, 216, 192, 231, 51, 61, 39, 220, 180, 204, 210, 178, 75, 17, 91, 143, 94, 34, 70, 222, 125, 131, 195, 33, 223, 242, 156, 232, 140, 67, 24, 111, 141, 162, 66, 45, 207, 138, 202, 89, 122, 191, 1, 110, 203, 241, 196, 82, 72, 76, 161, 117, 88, 105, 147, 119, 6, 157, 249, 168, 81, 32, 224, 237, 5, 146, 27, 80, 57, 42, 102, 172, 219, 114, 8, 31, 26, 238, 30, 212, 106, 221, 240, 118, 149, 165, 65, 83, 154, 151, 96, 36, 253, 250, 100, 74, 21, 189, 169, 239, 142, 173, 217, 181, 86, 29, 68, 155, 115, 225, 135, 0, 130, 101, 112, 206, 185, 227, 245, 18, 58, 243, 137, 20, 99, 3, 2, 233, 22, 55, 11, 13, 214, 84, 200, 47, 190, 205, 209, 53, 194, 229, 171, 248, 230, 109, 234, 236, 98, 213, 247, 150, 104, 79, 134, 71, 144, 25, 218, 107, 179, 124, 167, 251, 14, 78, 193, 40, 163, 123, 10, 246, 120, 23, 174, 63, 153, 228, 52, 121, 177, 215))
             96 LIST_EXTEND              1
             98 STORE_FAST               6 (d)

 19         100 LOAD_GLOBAL              2 (range)
            102 LOAD_GLOBAL              3 (len)
            104 LOAD_FAST                0 (inp)
            106 CALL_FUNCTION            1
            108 CALL_FUNCTION            1
            110 GET_ITER
        >>  112 FOR_ITER                32 (to 146)
            114 STORE_FAST               7 (i)

 20         116 LOAD_FAST                3 (p)
            118 LOAD_GLOBAL              5 (chr)
            120 LOAD_FAST                6 (d)
            122 LOAD_GLOBAL              4 (int)
            124 LOAD_GLOBAL              6 (ord)
            126 LOAD_FAST                2 (n)
            128 LOAD_FAST                7 (i)
            130 BINARY_SUBSCR
            132 CALL_FUNCTION            1
            134 CALL_FUNCTION            1
            136 BINARY_SUBSCR
            138 CALL_FUNCTION            1
            140 INPLACE_ADD
            142 STORE_FAST               3 (p)
            144 JUMP_ABSOLUTE          112

 22     >>  146 LOAD_GLOBAL              2 (range)
            148 LOAD_GLOBAL              3 (len)
            150 LOAD_FAST                4 (f)
            152 CALL_FUNCTION            1
            154 CALL_FUNCTION            1
            156 GET_ITER
        >>  158 FOR_ITER                40 (to 200)
            160 STORE_FAST               8 (j)

 23         162 LOAD_FAST                4 (f)
            164 LOAD_FAST                8 (j)
            166 BINARY_SUBSCR
            168 LOAD_GLOBAL              6 (ord)
            170 LOAD_FAST                3 (p)
            172 LOAD_FAST                8 (j)
            174 BINARY_SUBSCR
            176 CALL_FUNCTION            1
            178 COMPARE_OP               3 (!=)
            180 POP_JUMP_IF_FALSE      158

 24         182 LOAD_GLOBAL              1 (print)
            184 LOAD_CONST               7 ('Nope !')
            186 CALL_FUNCTION            1
            188 POP_TOP

 25         190 LOAD_FAST                1 (s)
            192 ROT_TWO
            194 POP_TOP
            196 RETURN_VALUE
            198 JUMP_ABSOLUTE          158

 26     >>  200 LOAD_FAST                1 (s)
            202 RETURN_VALUE
