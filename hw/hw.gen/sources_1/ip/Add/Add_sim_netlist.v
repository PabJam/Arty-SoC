// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Nov 13 14:01:59 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim d:/Projekte/Arty/hw/hw.gen/sources_1/ip/Add/Add_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2640)
`pragma protect data_block
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
azWkK/BscFGwMavHZN5FEADZ
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10272)
`pragma protect data_block
Y8PEEkjBaGKd3k++COak9ukI5JVcWmRwmN4UBNAd/CNCoPC8luZQwW3/JbPtR4+KEekhAk5WusrA
ke8HJ/1hMXlmduug99STIvFbNdv/xB0aLdqbgDfIpfaimSCPHTwi3xiOfOGhEPzOP3v8nEJmAsOB
KDN3aXPR+KORLL3ShMpjr2Xb/uTB3vta5ZSg7G2fEk+u1r86HToFOiRzvIfWjU+iDLLJUH+s9tv/
pQvYhpDDvaMv2p8nmjPaoG63h6sR2+CXLL8U0i9sKk2amLBbwzccckDKAt+CCGBEMjf97rk9IhM4
MpfgRPUBRC3LPXhNyoAX4jF9p4VExuE6FuoDorc5QHva1jQQyzx7JWA3LdcPso+yzZSt2AiMXwtt
zK4XvGsfr4vMIyyEzJNYzNfpJUpgsco/SX9gr76I9FN2EgQUiN25KkYwu+VcQo3dVcE8OStJY1XT
GHv+1mWqCJz22iCRzkTYdMBOwFQi4RHDRUX8HDki/95z+qGn/WMCK1D8drLjTZ0cs7faSVf+lwx5
OEbjckpkDs7ELObqBmSk+KM7ZRf0me71QcNzJrAN6HziV2YBFbIezPyaZDzrLRYKFccjgpgqAq/D
+8RIfZ5aNupR/9Bw/5ynEZU1mLZpOXyikBMvbYmhSQYaJiY7Trp3JkjZyvavbN1elplFuIXVwu5g
viX2kEc1p58k0rdLURhtHpArAed2f0VdVnk4iF8DyHMzdueIs6tzJ/1xvc85gQPJoGBf9UQ+sCO6
gWTBT8v6Npjl1S70s8x8AAyEuvOZep+lT+4lCpugZ7nCrrOXSHDIV4T1CT6/qdDbwHckM6ocdbaw
oLi/seFZzFL6wCWaK9pTI8eG27QNYNjpwSHq2VNRKLwVZ0Fo7Qkb8s+tTCl2rYGTybgOdynypt/o
Fuvox4z7NOfPoe/+IIvzeQwEPnzmZUoDzIQK66fs2epU4e7374tfH3qNhKFvYuZGeQgaUChr0Nw+
ElWNkVaEjgZHySdbRhdru/VeK/2OdxfZFuK4aRcj73dntXEN0atjrDdum5LV569HkbXq4DELWOGf
Hm0F41AQYJ+yhYhcZh6pitOUnwawku+0BMVU93QVh/g15+p5VaCV8Mwb151lM88U++Pft+yyZWko
mLUuRrOw+9tJpoYtzGt4BD5+k8Wts8ZwCFRA97pbuB6ALb/mIrwmwmnjRWMmJAAP9MZKEKRn9GSw
7GCcnQVbOz0CpAvpJPwXEFm2faWenONokT+tuT59IffpEBx526E8Rk9OmATVo38iZqUGtch4Dx5s
vW8xKM48cjrR7jFBShAuIhfhd8i/sAP+djqQfNuKpXUpZrt1zsYFfm+PQlbq+/pLW0yAmnAPU7Cc
3rEi2s5OH+dmelT5Z1XRtHhZmiM5rt9ZC4pNG/5Yw2Ll19kxJK/YUuH1aQ6m7Oud4nW81GPhKkoQ
49q6W724CSxwJxOmi2mlIXRktGuObIJ9hBaITrf9PCtRB0IeiOODGRqvZW2wgVbeM3fxVDs5A79B
2a6ljKWgV+BLUigzo8Upqo7JCAkVUbIIsQPLEtb/swIJevNLXbyc5ZlQvSOBKIkZR3tOhnBXnhfN
Rjve6MkHknXGFfm/pr0YMd9TWYe0pn4IQZyOFiYzTbgyyhRfSlNlFI8OIPpRovE0tDrniLM4PkwM
vaEfVjKTS08YqIPgOJ0JndkBboMC3ce2tZHKtOjHrzc2WUzz1cePgCnanv4NmAnIFPRjlyOReAMy
ghj+7cUocHmIiMYMEA5WqhI9ew2+PUOiGui6ZF/5r2g9bKHbZVgi6ZpIcBRgF4Az43IvFoIzdsLz
L2EW/o2S+KF2NtpwZ9A7bfnrBpGdmlfx02EwJhJEtQn+ds1rP2HE2HO5nH2PH584waHQDW9JfX9E
rVvUiT3AzFZqetQaCZp7r0H+RTpxjkfrNLWCq9eCY+Q24LroK5GrSnQaU/bSiMgtzvJ8mKmYEIXR
wysUhhQW0WLXTXxf3eLzmY81k7PUKiOxR0PcoL+/Ijsw8VbNa1KuhVhgEWt1EIpOxOaA3sp39ZOQ
OSHIJRxRkdQWQVcXIkBCRtZmE7y9C3je0Gsiz1x9FDiRZuspdvD2JNhav6BXwRe3xA25ush+o3VU
eawVrZk8RrsIwXqDMB9AV+D5DIvTidw1ic9myJoLi2s6Qy4g4pOagnWJeUAEeYWWgYq2FIGmKSiO
lvCl0GsKQB6GA9r2OaAiUewR4vPlPxxHB2XexvQjKH0BmD3oD19tD2kVzn13mI/srhOGVdTQcK5h
SAqe5P0RBGIFD+SrcLeZMq6LZqJXMoZMuJjfC0uokz1r2B/L3GAhYsXyf4HR6Y/dpAQj49vqMqbZ
PS+rd2gv6TTxxiKxrPglcp1FOdoDEtMHRJa/08OpXQa3DxFVSxHdggqFC/AQgLDq7knEQ5U541mT
SqCKrTzQ0AhVNOt+ed3MNPhIUNsIIWIBmFtdd5J8OVg5QHmu+OhmC/ldX+xJQNOIXQrhRysJIYE4
oESvnJnJnvSXAkwedvXFxWdKiSJfLp3IqttBDXlE7cfQoxg9+n4mhBEhEO2G0Q2eI1gRTnFKW2U1
QNHScRCbGgmCcD+Rov0mOCMxyDZwOexLLgIQmcUcOX52/HQIGCnzTbpfUSXFgGHywsn2mihCM/VW
mFVWk+ZbxkWXlSqZcyarI1ldlVJskxF3qHAKGeIgbCPuQiu13WunqnZFDcqaDZaoI8BsWajO34iJ
658l5V4Jds8/fronbV3wAKpGbU6C0zN+RNaQUinuJEAk5JKSMV+0XtbBk6C5i22hlR17KGhfwXTq
iONWgYFEe/9HEWfGBNBpRKHYd869FdCidzT3PvSliJM6RsxnCOSt+D70Kr1enZWV2RzaKG7niGjd
SXs4UXIe+SFz64BQhpS9OQ7cXSwh/RRVL/ml0i7M4hcVLSYe0iuUhtVaSPF6HZIoIELs26SjaKo/
4Yt+GYvMQRN4/yvQjppcL/HNSKUi27hWTjjDZS9ItFiBc4t468EwBYOnFom8ZIl+GL8j0zYEGE6W
wx01yRoIo47KxfZB5mbIK8reBjCtN+amfVPcK06u2qBW8YkUdHholQovP3A9ZMJyJESTmRBkUy07
pOIGGr8S4jRQ9x5kbi3NsJXfjEpKApEsd9Cw75MES8thFDD+++FtDftJIoYBiTSViw0KyVJSm+cS
BbCa27IpzL/VFdCYvYn1BbAxIHrzX86Qnl8fbKN4frMk4ApkzEPeKb4oNtNKmATm0Lh+PmZ4iwU+
m6gfft528h4GqkJ+K+8zCK6uL7KHKs9I2iCA0Nca0wZHfflu5K3P7goT8lU/JqkJIzcDIrpJZQXk
ePH7Oh4NTFkDzOAHlNRV1gbzso/5tvm4yO2zHePpgraRFO1x9QaSfaWEv4VAgREOfGN+SQojTD+H
yQKTo6am8T2heQp0ZJv3Qc6LvRVD3NxsrgAtAE2DrS0YE8gwGNM0JGmmHjmAhk/zbDMMlropdfwm
YtpzGgCTAzWt530AqywwaDFdfTZph7BmzHcqZJOyRi8rwRW0PmqOdxMRvrf0ev8obN+LU3y5IRk3
52tu2xCg55PYg3b6o6LebBUvZ2ngANAuia8+CdEaPb+pje0pylregkA9Cse6o6MbThZWqpiiifzf
8IsrmleqwogLMZ2P5/OAU/ErS4IAO6trcE9jkErn28oMIzkX4b14CmtA5MEcZ3PuOaBdCXIJv0Z8
uIx/+JwJk9QHMbEz1Kxpr7wIsopcFQr4ToaAlcfjCP+yrYtkYUrrtg5esmNXeLRU3S8TXuxBt8DY
xr2GWQONWXZ/ex1e8ycIgDTgm0NF4FpmatLjS4MRMEbYJnrFB5AwK4cQ90yWSOeWvEMxJAsp/h6N
lqypvdpKU9TSpdoymMF4HUKEzvG4Tvzt75cTOASmDm/QPJ73zet1J5lQw+oHXAa2/kukeT2ZRzHO
01p9ZQiA2wYFwoAV0CZV4e9d9zyByPxaZgCZzRkHFxupSuxMgvZrkhdxd91F7q7E3cDWNshUBqhZ
2ERc/wx8mVV2+vxOqYlXVh4rNcUM25yJn+/WwPanHnfHucolJvh/o2Fz4OLsfqu8j70yZmJvsJ7H
fwmVa0+lD6fLhgBlRMeiIQfTVsJCcTE7POnzyb3QpK+/wGWMVdsLtwwTEZqlFNYMuCeUyWROlrGY
DNzDNnZ8yNYp6pKfpwhI1bCz6rff4MdZ3AKJnIhIwAYSZLFqodymq8sJIJXGX+wUVYanzDbqaNMB
8vFPaHcsU4+tWAyCVJ767OGHtEZF7kfhrx/2hIIdaNqClfVdK4oSYNN9Pe/cUZ+UJhTfUhx6UoQn
HtOdzTALPEriefEUgy7CNWYqKD7yIcsVsbUOLARxUGwGWANsfQzgl8ENHQDgDDwB9k9UWnwju9C+
hcdJBTZxo+WTSeQghwo+w3MGk3QAwLjPxPe8IFzz5cPsUBV+RcJ2Tcib7ucKGPfjHWeoKjoVpPJ9
gVkBbiQGz+PRVQ1VesdZSnhoubURYpkuaXNVXoLAjnSNDIpUPg3auGoa+EFN5vSiffrOVYfwE4Lu
uvRWippJO9aknSA9JOs29jVuGD6OlW3b5vnoMhctOXCw3OAJr8XtnS+uOZNa5XqTKonvrk4X1SF8
fTEweXL8K8MJo2v/p83YQ13kmOX+w+IY+4Y5HDNVtryHKpPIT4E5kxoarq0ZVDRy21H5ncShICFJ
joH3wdDFD8suTKm00QoMGCWAIFu2ClMXFvh6QVBOepXlRtQEGertCL4a51zUKrB3voqHJ9Yr15e/
0hs7yTZNBcJEQGMKVnOjDnIImz7KY59uGo0N8sgquwnAKaJYKifkPUZXZRk5FvLrNKRmjBov2r8v
/5+PXJxQLIcJijt1cl3w1EMw6t5mIu9X2WsRJGd14ded0JuRyrLnKlLxqzhJ4e7d+yOIlYnaCKqX
EWIV6VBQjS+9V3fLnhwSMn1rQBiGSXF+gKwwfI1l4oY0ErEI0hrazjIT6dly65f+UoO4xLPGc0H9
75hpMe9+4/1rRn+uf4KUAShqZRNR4WXf8zIl4PdRIjEIDDpfwjvtj9rFHnAt/0VENxujrZK9stzB
Go1hfOOOZXC0h9AtuxnMS41BFKmKR15zUVOT+GxKLMCq2O37VU3ahogv5YM7mtSpbyz9O3Q+h0I0
AfRMJutwVqCs+9KNQsF7aDNEQru25D1A1fG7L2Vw9BgQpRwQrr8idkNArtyH5WH/WQCPaoi2YifK
sr3SW22h9bejg5X9UB/+hMa3YJRgvOtj+/gc++gdTrdbG7JXv8LRzO/7eHobh/MJC1Y9FP2lf4Xf
RgSO4MJKeWwRYL6wGcuO7eQERW5A6vt4Iokt+x8rFYzTOlf1J1KMEr5cHiVCURN9vIHoGx/yZe6R
jFu7d4YcZ055pfxVcF205nbVPxTOAgEsSqQuN3/x97c6eEvK4mHLmH63qIRBg2uC7zeryStqJDtx
0ERG6jiKe2HgsIvZ2jLT0PM7S0OSjVBmb2UArDTOC/lcwgnNOuSvjmwEPF45cClwSbhyuuLJEmmA
etp7JhVq/vZ0iUURFYnYMIf4+IztxsfWaow29nt7nQPXZwQCPDzM8Jr6GEGSsI4GyXCBvHw4llNN
BiUASzdqZC7U/Gtgk7f3vMA/LfiDbnVU9Ir4SGJ98Wtgm5vAtN/DQtresi3Nq2BimmXfUbMrbSVO
iqcahOfLX5+QiehO6K/0i4HBDoMmsBsGPmGYM9fRob93+8f0sKJVxJiEVAnVeWJ74jNHJFquPC3R
73yCwnJdBzGR7bN5xa9vuncV0cyCzZeYlnHbTQVsJxVd8mNMKE3e2pFM8ruPiPQD82ukLSCC5QQ6
mPMj/fuRa9zRCxMSDx/Bje3u5uXPFVRCKFScBmfSKMeB8qSfYxlmA2mgQZ/gNVcz0O7/NvhesFQE
acp0lVNoHXcze3Ibp4TSelbHk8h7/rb+4CjmTaZ6EC1zTQY8niS5F9sq4dpKf+ebkUA4tRuV35V4
ynqka++tVWzJ9IlQsurDfiaW4TufjFc3fkz9l1CyRH9eSuRO3RT8mMlUyJA4xUe06k+3i8seakZQ
gYxDBiSKvHBoRyVxrKtDgqNzguXu44HzxUGCijXEeRBvuBhsFjNmsaj32l5uP9+7r3V+MMnmIrDS
6+vsFIRTxLZ9pm7kG1YDADqfOZQ0WTZkSN+0iLwgM2RIIEJ99BKkKU8IiDj0w3bU82UieVqUKDtc
PM+XJp/yQAvBM6CJz1g0QrD4rPPPZnUvwOcOcx0XqMW1laBGtgYGjeDulhM/JgE7YK1KdFwTc1dQ
/OJ12RMHdRlFYM1udyqZ10HGNbZsTNf2dt6K7bzhl2JBw6QdzzkBxUmQeF3B27LvoiSxkMRCcEHS
rSwtfq5SxIP+ezB4yjhSXn023qpKsQN+2F5mS7h/U3s84a+gIVssJxQNmWP+dRv5zVSOvRfm4DBg
rdTsQ2NWlR01iG1CIsR2W32fvLjpVwVZYweXWgtqv/tMyPe9Cp+/9XjFNhPmFx4Iz8pKDTC2oNhd
lfJgkJtHuvKvhwuh9KD58Ga+OaaobB8XUNWzzlMKew0UdxZKwObI7Bh6uLM93SZxRclNosnC+hkc
jfaHm1LINLtocgZdFhjXZV4wt9ynPkK5TynWHRn1s+VBQZjHVE0gXJ8zZSjozPjQXdFTL5M5+7v9
op+rJbYeRwcmddaGcQswTg+EOAf0W5y9Oxq+MiifPbPZHM2D151jLsldllbSgZ0jqff0srpq9m16
LsaQu5FWXBPuI1sOOMVl/QUtSYkh3JNinTh2VP+kOgaXTNI0nNeP+CXjbefeab/qAC4k2R9MGBdM
PkQCYWCBhkBfc+AkPSHSlue5L+IRPC8L3d14J4+gLmGpbsBIk5+vth6uFzYBPIxHYVnHAlQmToQc
ZK6ikZPQ6qxyt5sDwA3HZdvqgCqZGUYPyBQ7iqmegZtVaOF5qZYYmFvcxXkkr00MdLbHHKli+2Gh
RNSrhFYa/uKZoRVKfSBhiFtzsajzIIX7yTibOART6V7AiXLg5cTIeZ2G13rOWJbWeMAbSQI/EEsw
EVreb0kYC9aZkhEYI8hsp5y00z+TtdbY0XgotpOpkJXFSDeaLV3vE0xIN8XWUgEC5HDTfQDizISz
4IYeUvTpUas2RctmL12Ny9MKoILvFPpTY9vrGVFGdQB8rscZp96CWh96se375c0aLpjvXwqs9OIu
GSnJvKotxb6o/SGG7CTzTVhKGesnHX5mhmz8XKpvUVVSD43wzxH+9MjJyakIKUc0aO+oJcmuD4UF
Qh9bca6tBytfjz32C+l5iKxib3l/4OKxJ0EwWB1pi3NJ2HXtCw84UtDjiLqTUcqHrq7cKjFKZRdj
3L+vwAdztLxMrPMOU+HyqQX0+xMdrGtV5zob0w1bRrytaJWTIoox1FEx6Q363VODmLhrNXPvqqFZ
fQ6ydo+jF44O3EKUxegc9ZmhSuwaEx4c4FvZwqCo6/LSP1Q23uhX9gvAZ7GeCuxV8CSKXHa2Bs13
FNZhBPvia7jnEXhzkGZfdSnavNpkl2dDqK1qjq4MdDmewBniZs0dd2kENiEwa6tSGaDGYvY35v7A
56GuTy1O5A+yzSzlTnGa2c7S15s+FJW4sfpWAc5pBjupKjEqB5XCXUAJvxdCK8aZocCc9OCkWlx0
v+hq/5fijgp9sa38f2NPnpRAYCKCss+Byk35uUaf56E3lqZQYuN2WLlEe7+vS2lnzV6XNoMfJwqq
7W0W4uBv/2GZL4DrknD2oQZyNyqTLXBwXvr6eEaBZ1HxF2itDKacX/12pctXbOVJ8f1mYRrf3K1u
VDk7Ejwah+wdxvEASIJGDeorosCrvWDqR0r1WPz+Ps5a+uppTf3Ktpr4hUCzsOOzJq0M+wTxTpTc
UXGQMOjGEtIPDEVLmAu4ldhRwh30ebG+ge7z0W20UwPfZyexs2JJ5bUxAtqTPOVMP0tUKRUe8nb1
0rIUqO6ECSQ9doHWtdZEjehxsNuH3niBzhcxixFlgDOPJ32Zvno4zS+8/dHplMNdC/Lg/vQ5DNQH
68TAapXKHInDCrgWOGCErliex6nDoIgTtdOUaJVa1vnbkuxFZWbFgoGmA7dhHTGu+KFY0LHsShS3
XrCjhXIr6SWp5gzUijjfzQm0S0tkkJb58duC7afEGkO5xVRRNbQ+F6uu7QCxi8iuIE1EJnl0h/L7
076P1g8+IVUaHWXu1JFS06Wy35birDmabJkMRBjKFX1hEPrQj0sW3XEOucu1amA/56Rd9Geat35Y
PM4fCZcCMk3+sHzagLq3IkuO8JphgrAFXshcBSxUYsa9NF5htouTz94Gr3de2513zxpluL3j4XVF
6znJWFnGDHyXUt+Mo36a0b68D+nmgYtmPYxarMvLTQ/Db1ZyXo64wQ1EFnbxJzDpoLTTeFylCpHO
9g6E33wPV4f42jaU9RB0KVdryUEfYqdQnS3J3k7ndguhN30MR4FhxN55mmNyIP161aKPIArpg/rg
BJ+K+fLJg8eHu/myOcsv7b3MxTxd2cSLPtd44LBXaifRh5saaCSz/WENW5ONLu/hVDwND2TsE5OH
BlQxtl3b00LreFTberr/3lZ9/zVa41KNloAF/1SzW7wBoRnGD/3C+v9GHjvlD7jiXXBVZjYerP8z
X2u50TRNQrskgaWJ8zMTsZ1kLvze3ATy4XLZVFRXg+g0h9gCQZNKC/tZ/7/wY1XDLKCJAO+NvOBO
Dm02zRJeF6Y+ieI4M0xoJdi5oVqrBWY4LXWorxEwdCJlzm9e+PAh9s+NDtFL5w0TM6VDw4jcDWVQ
L7dxfEYocwrmPjvHwL9AWF1lnLeC26lKhgHUfFi5emI0VyagZi0S7pyUqNHE9F8szHq78LeI3EfI
6gxd/BjP0zS2ST3iL99k4PmzoILUDCuM5tLgR6uYCndboiRmJLzrTmkXsT+oKLV8FM7yYROt++Wa
f0vNJkYBVjHPh61UvFKxcA1dU1T8bxFa9pLMNof9/fyQ0RuEfsl+/eCDLBjvwhEFL0NQa433jq6J
gVFl9LDjEcJu9BT41LVGb3qE/dq3IsDJ50n3LFzQPF018C0yRjI9ymAlKdadKIPVOrNkyQnoEuvN
K66ObZxon/i7bUmvWz722C9lrVhEHU52B4e0OgqM3+GXG5p33+kc1Yoy/C+kaVEvm92J0+rTIGVR
DefT2l/dRZX9TXO2pjENtZ5AqijW2u6uBU4THpQRVg7WTkHPcCPWIel6iiNKLNlIgh15YYEwhmpu
S2cmOp1xI05u/GTvK17vpSGjr9xk9W0PICSYSQ1vfvaoXEW07kZGGfina0wphtzIVXm6WVQHDg33
j1fyzc4iKO6avmAq62gCkAGE68w0llJ1mcYXI35vwXVJcB8YdqRSRby2Fw2cPgZFOx9xOxRoRIGD
amyvk3Tqs5C5GCT+8V7xCwWTxTK8mM2aSVjPN8J05OOewrBgVWzcv+Lj5pLkvIaD30NplYhzI7KU
Dw7f+Uq+InA4m5/pEZtQRgWfJAXvsHBdgClm969u1ifsxJk+ryXXwMqw/8sltKzkOxuT9tzqIwL3
mOtgvzSlldn/VDdj1YiOVXeY1fOLzJeP0g9VjPN6t1bDt9qB+PGJdPjoiXs7awI5IMwEHBPOPHVa
zzeLLhjgY7+QC3IhFioYxB2EnZftgLKiJVhlNp/uLmWTlmloTc4QvewBQ0DB9lf7fVaTn13uW52M
br0uubmllKp4TMKC9SV9yXLfZDnjBFVxq6aG2HV6oMeFU3UivLvjtqxDuZQUnVRXejpcwU3keEVG
5id9sop2kS/4ZilnJCa9K4dfuZeCdKdyh7zcbnR1kyl5n3iY5O3wS9q08ZGZI1+6uKCd1kX/bMPm
Gx8tljFxfxWVIGhb3dAIH1ri3WiGqj4JEPZkCRyuNlqQeYg8e4pWEm2OZvR2GF7Q3chsKSvxo+7T
PNnfT3G4jT9JHUOhTm5n1O41ye6o/zEshUiziGYBONMCK7/jN9e+AbQ8D2ea58o6QRzlP2gquLDc
BWOEKlTprCPGS4Rop0CanAjMT0YL/BrBp4SHl4q7P7pNCpuVqCW2Pv6XZSzNH9PbmM03pCNHe+sc
VvnMUvBsrT/R/jQlBZCqZGYlfz+RaSZJhcwG0CGXe/YEXv3qN+qe2/blN168FMb3jBBaFaSkkR23
sIG7cAJxiGIzQsNzcrSXnm+D6rW6h+VfZDijofZNqVyKLBh818OMvJLyqjvdKNe5fIrHIkvfmv5z
rvuy/3qlk1EyFoCrysYKor+6G4DPoA6kFuY8RtHfd5/LfdxppcFkVqj2iH4egA+0vSePfP4CbOI+
ed075rT5WMWQw2msvau7vslNGdK57sk7T2THR+AdXtXDgRAGqn+PWmr0ybGzVpoOf2/aABJ5fOmo
i441dmJhyB3S+AW3v8hjSC/4OG65GZX3+d5rPwaDMZviR0rZNKv8OAYijw3WyC3HIUbDo3W4P9hh
YUqPqwePv+v18QeGSeK0pOVf+DMusAmmcIoiRRg032EJww8Ht2HB5gIEao6S22seUvDgt+a56xQK
iyQ3OMZZRWMEuXySd0qXxTbJUN0Sqegrr3eAChoWQmxjgW+B5YLzTDKBqTy4aiwOrCu1PO7+cfVG
Qxn05GBMQfaDqIUVOanE8nhYfRsEcloj/J8VKVACQ5VGDSSSPFCuY58tNMy9YlARodKNvZ5QpuOu
jb+T5foPv9IwM6MNOdHloataM6e9UrowFLLr60bkSA32ionrN1C+RW0BSdOcpcrAsZvn0ZJ9jweB
Orh6+HFTfVeO95EjpfxgFmWNMl3TgoRSAuGKHaGrcTOQjL6a+jo02lLa4KNicOthvPjCPYTToz89
mo8gAk7d53uCR2pl/Fj+bby/rScgDUUuQ93fxzdzpIIANUonZB8gK9xWGKABPYQLF11oUSBOCx7M
co4CoG9u80PZXfk9iPMa0BJeERx9KypD2s5Fc0AQFkNIFewkdztWbSLBhutsm15VQmKJVmTcWlEY
9vMyQsQC28PooRITpqfkvNsjy1bpOKjfsn48KEjI0IHoz74DplmRzieyOtlGzymiWzCQbuMFkde3
80j1LtgNpMB12tcnWrbuWqqj6TTjys0U0GK48dKgwDWhbCUPTeH60IGS/GKR61zeTfNAOOYoFElZ
mHOHZgQKel5aubwg2ybUIuDRv9FUQKThEye5qcLrNLNDEiplWaAVXEIfb6xLUP/NUZUiFy2dH76q
DE+M4TZ1LfhONvgFMr23RPhgRSrj/18tSfWqWXdSObKJZLIX6aUrWef0VfL+OqbEP1m9x8mmm66x
G+e5vRT2cE2i8QYVULzY17xwzV+wkY3Pkd6yqb/G7Z2SitjYoV+zFAvl33BQiNlDomWrAfP3dNQy
ZuTN2G0qnXN7wqZpL2flFYpzC26o0+J/pT4OT7F6W8OVpwhhgvCb4600C3FUwbhNTjzPO2Esk6sW
y6M6Z0YJ/y/o8JrbbFeKleHuIJjgWRplETuFSWZ/7/xEADFaw6cO/EVz6HJwUbedcrhTK1eAyFSv
kukj7VLdX54FPPLVZ6l4u2OStzXhAM5vfFWOCD5ARArz66pEspEjEVY8kZigAKRcHnFlJNC+tEC9
ytwCWNukxNcT8Nai9TYfQL0E0qVFZAgcRAJAv7LE8KzCL2pRAs9gH+3Ll2JUYMoyao8cz4yTe1PB
9Z+idaMfQKSULPHDofIh+Ce9uid+iV1FoQU5uB9Co7w9Qm54Ymv/QbV6YeRFAmkRzsU8GUuvbbKh
0guzpDpPlN9WTpp3P0AHqnXwIORD9QPIFzpL54AHuD0fqmqTi0pBCl5yYwWyPAsZcWQ/Fxx2zbBr
Be3HsZLoCHIY6Jx28g8cjR462G7PhMSw2TJF1D7Q8KbnmPTAECki9Y4D/lCvkGXsNrr2vJNSZIdm
QulOC86OlykOkM3IYukpNCrI8C+mYuCae+ZUQN00S729SC3cbr3U+OSkYPRjVbmhAD80zBBeEfYz
g9qSCh5WZuloHRwj4mtFpWMmJTYAGsx6AEDtGGFNgq8fsCBGlutmhR9UXwqJWUAL5NGZMB8uzTuc
6RE0/ru5bQzYFicm/ES0bCC7yhwABdIOl1Wp3RZNU2a9FXd9Fxku8tNdWTr4r5qQtW7SkwzWz3z8
WZYNNwKn409FUZVUcQ6IslndqDqBy3Ce6DsqpV9sqnt1KX1u18LVo/NOB0aliek83U0FwGa0gBmL
ramFub5kLF58AgKrIZtNwWOTbbgZbLOIgUk98qmjRv7Vjz8eqXrsSFxjqTsBswufCyMOIGrg6z72
wfeHHUiQB7y3wrxShl+oLPy12binmFIJlJkAirEUdVnhxa6zWKFvoZ6hKL/Kwl6/n/FqMv4S7rOS
zRiUwvH3htYjVexhV46xmlVr35hlylm8e2DMSAUiEKFQaOSJ5I09oGhtFKTtn6P1SZD6ugp5lNZh
Lw+g3STK7vNsHzf1MMcByeUlor5lcd7zfKyi+yCL6mUuEdxcpbsA6sammjObfJcai3ffPtxO+Y3H
ndvjNKBzVpppWW/UXqlpdHAOJ8arUnfRZyaGg1F+/K1BpZDUarLRZzhtRbdyMrX+bA71DA8Mw5lu
Twmy1Pp9ZbYcbPUHaehaAxI+W9mxe/xdsZZ2W+slBfhGDXNceRI5GUi4xWXjB2SeA2dNTl9VxdEj
sJioPPB3xLdmhd5CfiIb8dPlhK6kZ0c/0O5U10pO8A731nb+oPMC0LRghc9Pa16bAYBpzJce5h1z
eMl+SsELYbHrdXYtru8MTDd/6PFwMeFlanywIrnH/uu6oCacCEyPFd3qSTziD1vgFqbpskuL3M07
HsXiqHUR0LF8OMWxzkXG/5poi8fvgxQ7kWldLTHkPZJQpdutYORae44zQQIZWSgE66B5KAuY42np
vdJkA6EdxnqIUlGDINEMXUA/fbF7q1H1paGIfpikx44cEAmQ0f22N0pdZLeKjFQS6zV/VrCexJL6
sn+4lRj8CAS4+WNW+92qc9Un37S5PQ0+as8lMtIyCfqyWI2uc9vWG6wQYFPB81OknGWVaSd9mxAt
PwQ9VwaBRNbmocjxNA140jCNanZfK48RoGPKNmmmXyoChXXcA7w46NSAKXCnd/Yholy+iGd4FU7p
DdDEbo9YLIjHLol2oKEtURZF9BT/1dWoI0juy4E5wDisYvpQ8quYBAG9y2GJEKUQwTqVBFQX5LR2
H4xF0qBK1PAMdu97SSz7h4ezWUHSC59FkRyZiXS2zemOLpTaRgHiC49cikrnw1jruWbZEjS/FOH/
UNDNEHr75XdCg/7TDQ9ev4FW8CkE52kRW0Ea4dHIVMqkFfeXlPDFQuCsRPPLCXTfNq4KwACG6Pnc
zQpPjEbkJKIcgasBqJEHMMCftKoDq3Im12RMAmDY57pDVu9n5xALLXfRBz8b5hwBVUy6N05GlyIr
2RCqcPV0TlAA95gdDXq1IZiBx89qjhkSgC8JYMDkFN697xloQpwDYAkrOiBg1oJWvFJgQIH1chqo
GiNid3QU9F7s5GIyKkkJq0NDFXwBks3+0OzcNmW3fKwAOOFUvOUPoYZR88twhmVbhyBLwrYpw/Jl
9eL348b4Rd10JNXLWRBd370kAwxocFHWJ+kiwJkkh7g2B7xwcYea1WkemMToqw9uI0GrXAPJjIye
k1XoKQPHnyb792/E
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
