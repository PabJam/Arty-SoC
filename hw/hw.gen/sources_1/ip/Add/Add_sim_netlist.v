// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Nov 13 14:01:58 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top Add -prefix
//               Add_ Add_sim_netlist.v
// Design      : Add
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Add,c_addsub_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_20,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module Add
   (A,
    B,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_mode = "slave a_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_mode = "slave b_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_mode = "master s_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Add_c_addsub_v12_0_20 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Y3ZbCcdv9XasLMSMZW/y3Z6CUzCXNPTE+qdA8rN8R+bY1a3xUH0B/92K6jUJ2s2WEn1REyXOQgu8
z1NEWHIa9nJosDbj+GChjGTQwgXx6hcmrcoPipw89c2yCONv9um/soUaPzysLy4hmmECcp0nEvoo
xPoT9TYqcruYDtIOB7A=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F1IXWdxrPKwvTg8EeMjbKRbOQi8g3pVSNtCuVg69JLgqwWEV5YPJ799e7MoKiqJkPivuLi02N7OR
3hlEAzvBZ3MErCqbvMNQv7w7I1lUx9+PcnD0U7bq/UBNvJ4SM2MbX+zbypLiHoMWr2iJXBO7SNu1
rhAu1lfLAJFTaPeByNUlPrZ+jTO8nFOr63czMGj6idyWroogzVzYRiQWeWA1SPfn2YjH3ZVDvNsY
dvsAdBRES27GYG37D1ugMFri5LGOMaUqSbkct/gJpY9Gl7AtM6juWR9BFN8WcUmDZmrGRv5o8s7v
PvT4locJhONftqZXOCwafp7Nky6jEqmzPaBZTw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
bo7kG4Yo1muXASb3K+dNN076tI4tNFg29R/EzlrphZRJbZpGm/I/tKRbKF4dSppaobE1DPkNCMdc
Lm2HgNApmlQYjDsJNg7t6VPv/GU/DfWQY8Nxjpd1C+3gRDyCuHxYJFJUxCj3lzL31n9zOZ0dgqaM
g68NcofLsns/Jynvhjg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KaN2tJr4q0UNsRnsGonecTlshqKcaOREnPMxRFUF1thLUibwKC1aG9ZHSXnf2CHOj4jLmgT0RGUg
itULJEfsjy/hCOOVf+7cyWU21lL7ciL7Xf8ok2Rb2Co8Jqm8KTyikoWP9sOUZ/NJ6gEUEROrnQlw
uvEdVVmnWmNyJ2sVUmp3Ak7XqUzz+Kay0oDECH3Aat4yC198zQImE4yVhJgy36kw6wnLJmbLY+PX
BCv9k77gpJdX0frge81vAMSP/TAPKHGiqhCBShNIjMRtxL+uqAIO0jKw09FNpy+W6Fj6qowyL9PH
5jqpOMhg8GELaciGksOC/Zl2N4S73OQcbQqcHw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
STxdukJ0Ps7Q/iujvgYoC8IpCWBcTU5Y10ns6ltitMcVdYBmbbE6R7XGL5vuptPIvoGh8S2FGZLi
PBFLfYSAZP4oSXsF/mg/zitHSRxirnd81evlt0p09ZYT77/KV0OEJ8PpEYEb1vY7z1H1T4zlREBF
SdCBGMK8DtSTJX/RjuLQ7xeXVNOp/XBsgPFNnp/rheT/KMHYz8nkBpzuPce0SEgmAVUbp6xA2YHZ
GneJc/7zzuLACPFtpyCDyX7E8ngPZGu0FN6d+AkNnvsHnsMjlC5K+D4cUBRYUiBnL4XDU37xwoz/
1LQ8d+4CniEq+4kw+GWWJLhCoubXH+MZbN/inA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Y33HNuVH8FgqObSFFaKDX0GU3qNTzxgHbhe73nDCX69btae7453IbdcmV7iC/CPzwNp7zYlK03iB
0t+IeFq6WrcoVsF2WTwuv9uM/gBgovGdTEAVm5YSFK1byctgXjg0A0BdYS97jUDaf/4csV+H7ZyC
qvKluzcTGyKvUQnTomYUSQ28kLxqmq1NkJjrQlKtMRmhhI5hJTnsq98nyJ8EegaVWqIgJjqKjUpm
JLrEc0tMzdf/lUeie69ZABMmG0isSqiDk45ei2d1rVg1KNeJ5mLLLr7yD7thbGOBxhSJYebPWl1J
xd8DkEZAKORjNjL9vfNN1VSXbzRcEXSqmXm6Sg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Yw8TgjL3JDLwKvOnWlgfHV7HFJDgumk05JYG6xg+ZEl+tzRZNk2xu0gBOhr7u5/Wl0au++UmGY6i
jNz96oYuX7PeetoiWtoOeGQJxx2KpOlfWeBQo6ZiLOfhxGrZmgQcIxRmJRJgcdWMtlL4Ei/+69GI
dOMD+lhyIZpHEHK/bzB1udA4KYMEzoJpJZ/v1ehra0FwBIh9Gel4Bwg7gd95AbibIn1/dqA4i3Io
eprNWgFJGx7cn6KdT0iM5NWx36OnXFxDlIjBCm7hpEHPfcopQWSzd5V80Jnu4Sl7dwMGvnJMrv3z
tY/52wmL52JCVH9gzS/z6ahAghncs3BHheHS0Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jkfcW/kwccT/pnYgPwCFUAEXPO4w1sIzpMPIKA7oc+rEqJqr1hrOf9Jf2bYsYLtB6LGRcJa21Vmj
wuzdkTVyCAx7I6cfTipcRKP3KEsbEWRD+fkxZOrbtm530q5rDA7P6buM1gfHsBAJA4dyQW4sPWAd
XdThjGiOS5c34Yk1Nku7qda2Ngy72JPWCHZqcjSVcYq3t1Gy+vu/ps9RMROr+YpKxuWKL/TrlLyW
Zh2s1jF/RY+cQnbzAx2zQsuv2ZPwNMayv35zzsH+E2/sdw4gJrfsW/w8xon69M1K3HcyMHXkz1pG
1ARD2+r4X9TrUNmF0tsMGU//Yq8sDKs8tuZLEOMFXqiNt0cSO92lNunfvlgC+6Cj95Gmz5Ish4Ig
r738ysD14QJqX76mKB6uVjoans0SqrslykUdPdXRj20/YDNoBxGuDWORrvw8a+D0ZzLpNcW93Gm/
r4qqEqCyuKWwdue6gTrnRci11oxYSXG2gbTTYyQgn5mTS0RtpPG3q2EK

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LJGqd6SmZEGyn3I/RZHXQDVLBpUYHBXayfZsoC5aqeLzXio9mjP2jJJqiWGIFKE2XwVHURSLgk3G
H6kZmy4xc/KwiCHLNDWfqT6xXQrIiSgtx2D2iQuIyan4ExV7UT3qq4nT3VF8kLCvJmqTccLcd2f+
R+Xf2qDVdUDvGNnlmH41l4y4A/qSyULjdD4vQ5ECMXEvaa8cTlKxZakGA1WiCIfA8uSoTlpjQR0s
iMrT9wUgFuMs8+Dc02CQSSSo4pMYfhhXwronggT6BjjTGXR1+szUNBMU8lXyWTwEGb9cN4SZeasL
Wm0l1nbbrKwTQ730SeohB0aRd3zwOs4F3cHT0g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2nLT8Zvs6vla9f81jsNW2RPpEaJf9tKjV66ah5MzvkCo0kdwmi/psLyzofjZoAxPTJey7vNkD+OP
ig7ZThoxVTDJVMGERrfG8uaJ+LUCvPiCwnKn73vgpEMD7qP9g1VskXBf6CudHgaap8bDBgfVWITL
QExOCeVFUk9u93wTJdHimIoe6Ebg6RFmktgHJq1nNw6TYsKCwDY4E1Jg3vwGV5uT92yAW4PKYrDN
YGfeq3IIs+jiZrIZs1ffc3SAce6LLc62T3d8XglbzgKthxxcUc6Re4XKxVPp69nMLKsxTcvANNI0
Vgm0AGrkFuF+eBGT4Evi8c2RUBUZur4CgcKCwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bC7WF7hkz2L9eff+WtabxVTqD0ohNl7V54dbTlcmUuGjzlS7+etjYyf1ZmKyTxgZlI8CcGY3aLUm
g4gMZWQTkwQ2EABmYmtgG8B1CQOJdk0H16y1P3Ngef0kUT/4xGcurqPGqt8djCWLAJYHkIS0viNB
1s3Od9+84/L2xjU3GaQhc2e9u2OFVjrPCAKk0Ygmig+kgae5wRHqq16qz/+bWFyJe0O9cHyCjTtn
7/8jzeGuU0eaJfh0NrMBjbYxyV69oQjDU8ns6UMON/gG/Bos1va7j8dyIdYh6IGHeUSqr6LBTN7Q
2R4uEizA0QWc+/BV1v+nRTAIxxrJg5+4QWqljg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2592)
`pragma protect data_block
Zg2N1B6zFz5k1KC10OneccyIcUwV3RTMuycEAgHswQmL8qfKDBnVdHYnHIlRsw840xOMGTKxCwDs
oMbMCWeof978lqprrdJF4hNv582m1/WI8UC/LsrqZpyVFU4HqSaZaXU9E03GcNhnMoPCK/180M73
SdOz7wJ8RvuOtDLEFCJWks1amYOogD4zCIa8sVEw9DpystCXPGNVsjcNtk99tfwkcUHNy3rLDEKU
ZdO/xx0uYZlxTEFwY89QRKf1nl9XcvY12gQXEbqxw+AI7OznadmhS/nBVH7b4DyoP1R8AtjWKqsN
c8fiXHUgUDeSKQKH4enHDv5AIHWWr2zugegb0MaaoBYoB+GjhPt4qq1i6kK+BDLDN+BTroSEOc+a
+HbVfMWcxe2Xo/F9AoEiK4iBKezd2gt7iLwic3OEaLU+EEul7OxdKqgk1JomB/w319Gl0JC2TRz7
Ws7LyaAjJ/cDN+f6iWmm1/2FZHc/o2nfw3jGmnKi2XnR1Ij6D0jTpaGyuwGqackYvGv4rliENjhP
XwH6cOf5SYBIu55ZAbRrZVCMZeO7onNYFENCv5JVB8ifir5tZizX8M+8JDTvKqkm0qxR4NV43A42
K/VswPeov+iOOwsGD5HsEy8t4sqFMuZUWu06El97GTd0luaIcdPJiRcrix8LDgMdkijyatBou+4O
vrqHiviUjh6pRGwufwpxKxF/IViCYR2+bNaoDV7hMpVD0GXHNClEo6jh7uSt+QreKEfEL4xp3YEe
bqT1ZhDnsnnadazskUhucwHvXNd0SLaBSl4vFrxNihhjn6S2bHpXLrEbbstvgn6zjXkjgaXV1vJ4
h57pC8VLesC8+UbZxQ3bLKyq3qBP5g7UPsIMJ9LVgm1I2RrG0i2zRSsY2Caiqsj9GoWR4Vy9EZZ0
fePLCLeSKnhdV4dldOwZpBY/JzZJIrQT8HTiKU26G8Doy4cd0+F5JnPXtHjCk6Z3uTN1WxfDm4aJ
0f9MPf2RxoWdG5cbAyMQJKBW+Iod9ryE1pHRyxRtV/N9HxfXcfknVnFKNYv5mozyCPbQ+8tqq8qY
r2tyjtdU9+JZuCsea4yJ6sie1Lxv4zQw1/oZPOQhDehtavySUcg8ItE7odFS9Z0EI0ynFSmtG4yy
WQmUhKvHpW272a9LDcP7Iv0h/0e8syUkn/bvGGt+xb/jJ4H4QVQIfjmsmTmQe0HmCxv/Dai4AJ+d
wfpI86wXm6yFQ4tZJr1Fhlif9Wqv6fgvlayHq4X6m6SplLFjzhLeeRoc9o2MB68/3JwrJs9vxAe0
+YPgZeUAR1/M29wZFgUg+cDGIyQkd/I321O8Jbzxjt+IlsB9VRiB4edZyxWukQrb1DCp3BQwz2qW
2b9O9A2dQomIvvFiPS8P3Gr3XZW/yyf485Hs+7clQGNNU1uQjmwuxNJo8lRs9u3waFfXE7xPCrHm
AmYkEwJkEJO1zDVK4M2FO0iRpGpagPJQCKafnYMqsqr3vN4qkODRpwNzRx/BVVMjp3yWv00E1XkB
JwovGFteB/WSrLXAXMl5FhkwFlr4AE1MRaFNe0voxTfi1QonYcZQGRC7IOlitmrL674A0FnJlzD+
o0zdKYDW8d8LaDNWHRnXvWvSi5Pe0M4Gj7O1oeiVJpJJjyvS/AxaqnS+Oaq0lbh0xr/6daUvhsrL
MvV99i9660ynSEFDmaVwo19DqZDfMOoF48vGrFomTErfNddtAl2UC2apG0uXQnU0BhcfbFZjSIFO
HbicfVsz28+FsSz04Qa7S9hfRpA6O5Y4786WtrMnIxdpDMD9wfW0QtlYfNLu1e/d0Z8giULoyw5A
2dJafUklDdZmfTuUmxLJjWB8NlbNUe/OBgGsVut6ZA98gyL3PcJGYDkknoxh0GJ3L8ahWf26Gcek
FXeAVGi6HO2AmOOJgOt4zDnNSw3Kfo5BIU8kQJsV1YUU5qgWVQZTuLNpCjQ1wVT5ceKmZQpLu9dk
P+uLznVeMynsi1sXn25B2Z2m28OKmlqgCmw51pCck8rkE5bgH4rQZrQsvwU26t4iJ6lvJxHs4Jnr
L/LeIc3sR1FTfFY+MFw5bM36vJWELQdxBotxGq2nc0xIJg0axi+or/jfmuR+ffqHMA+wRwltRGL3
SKgJ+jcjxZQTvkVPTeY1RAS2LcThfcgSrl9gC5PSXSYHx1yH2T0mmx6mdGr+SsKKmSshZ/rfmJ7S
JCT4kS44mbz7UnUjNFhBEhGCyRo1bDXbvLwaUd2NjHbWBBSXTtok5b+KP6EihEkN7aNf0hfuG7xW
r8wVQKoanLjwIOkGiTWBcUQAuxZTCaXsNCLJQj6znw0WTRmNq2Z9Eztv78FwELNyAY6ALELMppeL
qF0Rtz12vMemFaV4bZEIyHryEyKRXp04qV0fndD7E1oSBD7DhPuDCEs29rWNKWL2PntgC4qjiOzg
EAAxcIKchOFEnWaCaX1hLFzdVvsM6us7+5Wh7RtzF3ni+E88dwjJ5/8QZWZQPXIk8mOiYI9bQOwy
z10X5Fv/cRmEFDDZJVL6oONCvKSXCbbjSpEhY73+l9HuFiIdOIsozsJGqCKJV+wasZSwO7ZZnbGK
UIM8RoMDKBt5yuMGYlruNrYjvgMkwLDNESrKtgsICZ7ABsCPO0cTrzujNIyAKDeYKDNZW5eLflGG
Cf9kB6SCzdyGJfT5hbo8x8hZd2CjucDrSr6cUR3h++sF1f2p0mm7vrfuEER5ovregCB+l6WjTun2
A3dqRasVZZzk6E4hzMUF+Ex04ZjRlCA13F72sYyA6FRgFn+7Q/Q7wFmWFUp2ivom3SlzK4SkWJjx
qEXrkUgDi/U/et8h2IjCXSDX+kNxRXtdqBnOu7B3+AMKEq1HrWdybFxf9rhZWIpQjK9bVcqwhM0v
AtOW6nEuhjnS4QY/oiucdK3J7rBQ/iJ2UAVGbdlEI/JRU3xhSGIEssu0+/U9BN7jTGJ77KOZMNdq
2llV44v14cNd0/+UMQ2fjASh2Q5Kdi5WOtxgo2jVQX62qxBK8jU+MdisJh+FPIs9QS+F3r1hMXKO
XGZRIiJwg0ECCOfH472hjTriPNwKH2yt1rT+G9abHF+9uPMjl6f+9XHvDDbox50/oxkSI1iON0rr
0vMbA5sVZuzJQEqkUC64ZJfZwZxPGJih8N+s1N92vDofktWUSRsPzrbTUnPx4LB476AbD6ekzdlm
PyrjJ8Yv9gtzPKzi277n5su3r6f6bTamtaQoBCeUAIKWu1WIpx3LD/dlEcXfGzzkEryOAcydcuNv
Cmr/itHdZgWpaPjkZ3+IDiiXG7n3G1mit8mZS/TquoLXyhtMA3pBnqY14Sus7khyzneFGqdv+SgK
q3JNReYiHK23hm8OZNtIy2J5K0lW4n9Xs3zOnHhM7mD+k8KalSRBY/kGzIwZrwFwQuqneeqQ7O7E
ot1t9nip8gdyWO0fPYdLfEsR5lF1YeM87FiS
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Y3ZbCcdv9XasLMSMZW/y3Z6CUzCXNPTE+qdA8rN8R+bY1a3xUH0B/92K6jUJ2s2WEn1REyXOQgu8
z1NEWHIa9nJosDbj+GChjGTQwgXx6hcmrcoPipw89c2yCONv9um/soUaPzysLy4hmmECcp0nEvoo
xPoT9TYqcruYDtIOB7A=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F1IXWdxrPKwvTg8EeMjbKRbOQi8g3pVSNtCuVg69JLgqwWEV5YPJ799e7MoKiqJkPivuLi02N7OR
3hlEAzvBZ3MErCqbvMNQv7w7I1lUx9+PcnD0U7bq/UBNvJ4SM2MbX+zbypLiHoMWr2iJXBO7SNu1
rhAu1lfLAJFTaPeByNUlPrZ+jTO8nFOr63czMGj6idyWroogzVzYRiQWeWA1SPfn2YjH3ZVDvNsY
dvsAdBRES27GYG37D1ugMFri5LGOMaUqSbkct/gJpY9Gl7AtM6juWR9BFN8WcUmDZmrGRv5o8s7v
PvT4locJhONftqZXOCwafp7Nky6jEqmzPaBZTw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
bo7kG4Yo1muXASb3K+dNN076tI4tNFg29R/EzlrphZRJbZpGm/I/tKRbKF4dSppaobE1DPkNCMdc
Lm2HgNApmlQYjDsJNg7t6VPv/GU/DfWQY8Nxjpd1C+3gRDyCuHxYJFJUxCj3lzL31n9zOZ0dgqaM
g68NcofLsns/Jynvhjg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KaN2tJr4q0UNsRnsGonecTlshqKcaOREnPMxRFUF1thLUibwKC1aG9ZHSXnf2CHOj4jLmgT0RGUg
itULJEfsjy/hCOOVf+7cyWU21lL7ciL7Xf8ok2Rb2Co8Jqm8KTyikoWP9sOUZ/NJ6gEUEROrnQlw
uvEdVVmnWmNyJ2sVUmp3Ak7XqUzz+Kay0oDECH3Aat4yC198zQImE4yVhJgy36kw6wnLJmbLY+PX
BCv9k77gpJdX0frge81vAMSP/TAPKHGiqhCBShNIjMRtxL+uqAIO0jKw09FNpy+W6Fj6qowyL9PH
5jqpOMhg8GELaciGksOC/Zl2N4S73OQcbQqcHw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
STxdukJ0Ps7Q/iujvgYoC8IpCWBcTU5Y10ns6ltitMcVdYBmbbE6R7XGL5vuptPIvoGh8S2FGZLi
PBFLfYSAZP4oSXsF/mg/zitHSRxirnd81evlt0p09ZYT77/KV0OEJ8PpEYEb1vY7z1H1T4zlREBF
SdCBGMK8DtSTJX/RjuLQ7xeXVNOp/XBsgPFNnp/rheT/KMHYz8nkBpzuPce0SEgmAVUbp6xA2YHZ
GneJc/7zzuLACPFtpyCDyX7E8ngPZGu0FN6d+AkNnvsHnsMjlC5K+D4cUBRYUiBnL4XDU37xwoz/
1LQ8d+4CniEq+4kw+GWWJLhCoubXH+MZbN/inA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Y33HNuVH8FgqObSFFaKDX0GU3qNTzxgHbhe73nDCX69btae7453IbdcmV7iC/CPzwNp7zYlK03iB
0t+IeFq6WrcoVsF2WTwuv9uM/gBgovGdTEAVm5YSFK1byctgXjg0A0BdYS97jUDaf/4csV+H7ZyC
qvKluzcTGyKvUQnTomYUSQ28kLxqmq1NkJjrQlKtMRmhhI5hJTnsq98nyJ8EegaVWqIgJjqKjUpm
JLrEc0tMzdf/lUeie69ZABMmG0isSqiDk45ei2d1rVg1KNeJ5mLLLr7yD7thbGOBxhSJYebPWl1J
xd8DkEZAKORjNjL9vfNN1VSXbzRcEXSqmXm6Sg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Yw8TgjL3JDLwKvOnWlgfHV7HFJDgumk05JYG6xg+ZEl+tzRZNk2xu0gBOhr7u5/Wl0au++UmGY6i
jNz96oYuX7PeetoiWtoOeGQJxx2KpOlfWeBQo6ZiLOfhxGrZmgQcIxRmJRJgcdWMtlL4Ei/+69GI
dOMD+lhyIZpHEHK/bzB1udA4KYMEzoJpJZ/v1ehra0FwBIh9Gel4Bwg7gd95AbibIn1/dqA4i3Io
eprNWgFJGx7cn6KdT0iM5NWx36OnXFxDlIjBCm7hpEHPfcopQWSzd5V80Jnu4Sl7dwMGvnJMrv3z
tY/52wmL52JCVH9gzS/z6ahAghncs3BHheHS0Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jkfcW/kwccT/pnYgPwCFUAEXPO4w1sIzpMPIKA7oc+rEqJqr1hrOf9Jf2bYsYLtB6LGRcJa21Vmj
wuzdkTVyCAx7I6cfTipcRKP3KEsbEWRD+fkxZOrbtm530q5rDA7P6buM1gfHsBAJA4dyQW4sPWAd
XdThjGiOS5c34Yk1Nku7qda2Ngy72JPWCHZqcjSVcYq3t1Gy+vu/ps9RMROr+YpKxuWKL/TrlLyW
Zh2s1jF/RY+cQnbzAx2zQsuv2ZPwNMayv35zzsH+E2/sdw4gJrfsW/w8xon69M1K3HcyMHXkz1pG
1ARD2+r4X9TrUNmF0tsMGU//Yq8sDKs8tuZLEOMFXqiNt0cSO92lNunfvlgC+6Cj95Gmz5Ish4Ig
r738ysD14QJqX76mKB6uVjoans0SqrslykUdPdXRj20/YDNoBxGuDWORrvw8a+D0ZzLpNcW93Gm/
r4qqEqCyuKWwdue6gTrnRci11oxYSXG2gbTTYyQgn5mTS0RtpPG3q2EK

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LJGqd6SmZEGyn3I/RZHXQDVLBpUYHBXayfZsoC5aqeLzXio9mjP2jJJqiWGIFKE2XwVHURSLgk3G
H6kZmy4xc/KwiCHLNDWfqT6xXQrIiSgtx2D2iQuIyan4ExV7UT3qq4nT3VF8kLCvJmqTccLcd2f+
R+Xf2qDVdUDvGNnlmH41l4y4A/qSyULjdD4vQ5ECMXEvaa8cTlKxZakGA1WiCIfA8uSoTlpjQR0s
iMrT9wUgFuMs8+Dc02CQSSSo4pMYfhhXwronggT6BjjTGXR1+szUNBMU8lXyWTwEGb9cN4SZeasL
Wm0l1nbbrKwTQ730SeohB0aRd3zwOs4F3cHT0g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2nLT8Zvs6vla9f81jsNW2RPpEaJf9tKjV66ah5MzvkCo0kdwmi/psLyzofjZoAxPTJey7vNkD+OP
ig7ZThoxVTDJVMGERrfG8uaJ+LUCvPiCwnKn73vgpEMD7qP9g1VskXBf6CudHgaap8bDBgfVWITL
QExOCeVFUk9u93wTJdHimIoe6Ebg6RFmktgHJq1nNw6TYsKCwDY4E1Jg3vwGV5uT92yAW4PKYrDN
YGfeq3IIs+jiZrIZs1ffc3SAce6LLc62T3d8XglbzgKthxxcUc6Re4XKxVPp69nMLKsxTcvANNI0
Vgm0AGrkFuF+eBGT4Evi8c2RUBUZur4CgcKCwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bC7WF7hkz2L9eff+WtabxVTqD0ohNl7V54dbTlcmUuGjzlS7+etjYyf1ZmKyTxgZlI8CcGY3aLUm
g4gMZWQTkwQ2EABmYmtgG8B1CQOJdk0H16y1P3Ngef0kUT/4xGcurqPGqt8djCWLAJYHkIS0viNB
1s3Od9+84/L2xjU3GaQhc2e9u2OFVjrPCAKk0Ygmig+kgae5wRHqq16qz/+bWFyJe0O9cHyCjTtn
7/8jzeGuU0eaJfh0NrMBjbYxyV69oQjDU8ns6UMON/gG/Bos1va7j8dyIdYh6IGHeUSqr6LBTN7Q
2R4uEizA0QWc+/BV1v+nRTAIxxrJg5+4QWqljg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10128)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
