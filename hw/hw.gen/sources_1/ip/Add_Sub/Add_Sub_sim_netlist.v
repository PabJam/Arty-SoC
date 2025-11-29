// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Fri Nov 28 11:10:59 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim d:/Projekte/Arty/hw/hw.gen/sources_1/ip/Add_Sub/Add_Sub_sim_netlist.v
// Design      : Add_Sub
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Add_Sub,c_addsub_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_20,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module Add_Sub
   (A,
    B,
    CLK,
    ADD,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_mode = "slave a_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_mode = "slave b_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 add_intf DATA" *) (* x_interface_mode = "slave add_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME add_intf, LAYERED_METADATA undef" *) input ADD;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_mode = "master s_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire CLK;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "2" *) 
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
  (* C_LATENCY = "1" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Add_Sub_c_addsub_v12_0_20 U0
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2656)
`pragma protect data_block
kuGRKCHpcnQmYAV3OBAb5Dd89KusCARnS6Fk1zywLIht6DwSxbq+VYwS2Up73J1l6dYaK4M7mXP/
f2f9Mo7bvW/eAogRR9CaaExp+QEil2I5eHdIhvN/ebcrfpjzP3vRS9IEByiCX0UlBErhNzhGXf0U
biZtafoklvPFZZ7iagEgoOd7/wYAgfZBXcqDgC5AMnV9y3ndMP9dNfVwABceoSJz00V6G//JpvHa
lUgGeGY9IIL6U/FxvAbz0YCDnCbG728N1jtI3I20i+QSCuY+/bGvdXFrT71alw7OfAOPk5ZKWbVo
88BAg7qjsFzN4kdNUr3rkyglvuF7NKcKbvC6a4jjeTQDAvoE12iRGtVvmn/146oCso2ptYTY3ySM
4m9lT7J319+x371S1pTgzGjpedYRBVpsMY845AnziDWrVTyNGVbt6HPrgAjvxwLzjCcSxKj9oygL
Nu9vvrzjxUT7VNbIJKR8aQx912f7kUBLdWQlnZ5kwoL5rZYmvbmVtwo1nDTBY+VQPco0U3eTnBwI
Lilyb7qXVige3OY7AJAiuJNFoDCjsFQ11kAPdRzNBbH2PvykDetH1rg1OqxNc8po7qxX7wuX9cl0
Fhg/sNv+8Oj+kYUGaVCVzSxyftXTUl89YeoKJyOpQG25+4Tc/y2EnusU+Ns4YH1wzGzQsb5WxIcF
xKid+B84q5UP1Asy0OQyvs67guEMQjQM2uG6qLyzPUV1xYysef++ELrokovpuP8UioLTBR22BmFg
ufnhhV08B2h22sgxldzW7/ue2MUm7ErfUaVCg2FebH9rNykhIs2f2eqR8NFqj4/ZimGzXRVTyp4G
HFjLn+4MAvZ3zrElHAzIIi64EQwz6sjbr53wMl1mmf+IwGkWNs5Ulg9NWoYqDq4QOpVwxuB6XUo+
8p2/jVFgCNC+5azujgaXtAIKb99WkFEersGak6iNAZFM8WiWlj+8d2PxDVyiBAz6QsMxbhiVfJKn
wkRF/fAsC8juul7HmjnsIZQ6spZSs6TfWlH52t+c9MyFdmD3De4l+/jSQInAEunKNqFTEb5/nZ33
+bzn8TZ0noTqeJn9hMLilJvEkAlMgXSbXhCWGPCKIRNvJ+eA092PaAwoYi/EbB1NSZfYtuFy1rR7
WsZrvZowLno6xp0RAduEaP5eUYcIg+tlTyENPMccGR1zfoKl7hB8lkcauPUfSbVojL4uUG9IC7Xd
hUn5tYb0q2LzPwu+tay91uer/8ZdSoDMOKuCrso/cgn560ggQ9z+act9ZWBB67vvyHpFm5oWCmUV
z+EXCtT4S4sjbtRPNg68nupujoFa/mP7O3pPurqsiBkPNWfhwyQH9RDGVX9b+zckuXaRRFkno7A/
eJgLkQO2fUflalH41JxRrFcoLPYbySjmMycbRM3BgS3XPbrPyymFLDS7FCBWoozWEzf3aRhue0lF
4gADiv/f3HvWwr6i0Ix60NQX6Z7DIPHBomgIkjIUgLcR/BwX4Dzu7JfoBawPDzwAtC8tLp/vSEns
Ib9g/0kLyTMxgRLDecK5hpOf01G/QhP2pHmC3AbmJPrqIlSssMSYNR8WFiWhPldutHitlap8wYm8
/P0Pu8P441UVSlxabAI7RtNZHPM5hTjSGC6rBn6vlwNjkeExq7M3pnvYR0svznIqGE9I8J4SJEV+
8MzkQsyFo5ujHe7Jq9+Ru890Z0gJqTCI7wH1XEOk3dJKBVDPiuM0G8QCxmCUu2bcX8ExZZyrX77K
CPD3UQPbglZzX9w4yVg0FZPHvgPhZdGl8GYU1iIVZy9jcbqYItwemI/cVYcmOilUdNuII0jKCAhv
LsYw7Bm5SbBzhXCQFFMWsG7vAhQdfkCoajRyjWB0RM3BDsZPV+RXCCuYoG3oJ9ON19OUbLOpc9FZ
xbhlu/1G/6d+/CNo0jntTSt6DsdGCbcf+iQtjV/BvByrlDS/W0bVpo5+BhAdOaCzK5mTFo3jagvr
g+2Tb8Udd0Cs2hIvYEKrJF1hBVj41ofT6w440LIsJfKjwH33i5+sWCuCAxr1ZUw6qtcd3nMBq1qA
IB7Dmi1bG5f64BaaKtZl3Rj0+pi/G20g4Jo0uWnpvD5ajyIiczhR/DF9GUFHSYnd+Dh0Ck0TFdth
7kgUQwNOI0u180ajv4ildtLyiWGQaSbGOKNpkTerr4FMpR5skKEqNl9JBxGPuult+ktyEiMG4599
EVWAU1be6kbLlNrG+PxW4t1ha+WJa3dp9rv6rAc0eX6fVLCE58zk6LvWQm3nLu9mslBx6S1MzA0l
1V6tihQjte0dWLGCsP8ILa7zpOev/0e1pylgUEnM2y52Q+Qmln2JccVugEdcXqnsx5Ie8k0DaFLT
SZ2FXsr5M2uOPdy9coHF4ZTiWnaMKI2vP0opKEmasnQ+VDnRdHvGNdaaOHeIVIlivfcUWEvp92D+
rSkTZMvsumI3TRAyM41CzQWUmHui8Uxf6davzeOdKAw2Uyknqe5381Kq2krwAco75GYIRAbmNvl5
ZkZTEtZppzc6IzJb/yrjX59A0UlI8CRAOPGbE8qukR7Hplu2uUs3KsbaQvrxJ2zOjpBjClFrRek4
hMEcmBdAg8A1lwuCpL9HoVb2zdoFGtLhcqkEQthe2Kpk/LzeRnfNhj0sck8K6+epg5p2rmpmbjPX
1xTwZbjBgRlNJyrGAOeA66Y1wnNlJJ9XT7n1kn8ZV9bewP8Uuqe27XMWyTNd3s9lCHV8LBQa9qWG
qsuzQjdHIgv9kn6796sd5AC9PmxwIsiZjLbxrETJCC79ej7n79keI9VrDLf3OQN1x4Ps7OGRTEgQ
JceczTiFr1OOvWcIEOrZLsEW7d5g5BmRwWrCqJnHMgBI79aS5P+vymhRgLU1/U4qlbdCQ0B9U2ug
zjF4V/JG+0Cy8qdK6iY5NLLl6zUK8GZ8YjKXjARuw9gP6ck7NgGEYo2Glimwi3u+deAzOI5A82Wu
/mBuJBdwAYE9ZXj2ddDb0JG/iYLbEJ2SD/DcEnD7lFrCilF5C5b4ZKPHQyN0P1K3fkHhNVCnSgOz
RfkORVu8OBp00qS8g71PA4Gl2qNp8oOi+sQHQoMtD/FnLX2IKrgt8+tdIoxcW+cPwalLFk8XH514
jSrjrJ7i55DXvtgxKBJ3fAv/uXvSdPBlOvecytuN0DOBEs4Zf/BtuWCalNlhlCic7Et/9c6M2k6c
JMn2dALzOx/Je90BLUAybG8bcKn/SIhAB+ubTUQC60cv1IvGwYZjvHoBlTQvmBvZLeRivJQQ75M+
kiY9HNDxuiWSg8qk9dej8X7o6iR4C7j37Ut82fIJUTq59EpnsJ+VIksmscv1hh+D9oqmY1J6j/7X
4o3clJ74nF4VwjNZJ9n2hse2zB6hG+1y2h7AOoekVYaGd3Z/WuNfiCQWOs2arIjdrWwxHKuMAFet
3BiaBAU6bW136yVKlmIQess1sGh8ZAqwJqHSM3LZjpGcykCbCLyyB8rb6OoZnJTA2fRYvofsCVLt
KP4IYmtSqY5rigzRdxkvFDr5oqasCjdF17lWLeKHUcMqVw==
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11216)
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
