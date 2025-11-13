// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Nov 13 14:02:53 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim d:/Projekte/Arty/hw/hw.gen/sources_1/ip/Sub/Sub_sim_netlist.v
// Design      : Sub
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Sub,c_addsub_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_20,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module Sub
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

  (* C_ADD_MODE = "1" *) 
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
  Sub_c_addsub_v12_0_20 U0
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
dztUAsYItwJ8b6zv3Zc0c2BY
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
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
rjqMmxDWfppcg732
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
