// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Nov 24 17:24:16 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top Add_Sub -prefix
//               Add_Sub_ Add_sim_netlist.v
// Design      : Add
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Add,c_addsub_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_20,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module Add_Sub
   (A,
    B,
    ADD,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_mode = "slave a_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_mode = "slave b_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 add_intf DATA" *) (* x_interface_mode = "slave add_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME add_intf, LAYERED_METADATA undef" *) input ADD;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_mode = "master s_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
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
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Add_Sub_c_addsub_v12_0_20 U0
       (.A(A),
        .ADD(ADD),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2608)
`pragma protect data_block
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
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10432)
`pragma protect data_block
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
WQ==
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
