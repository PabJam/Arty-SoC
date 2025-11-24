// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Nov 24 17:24:16 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Add_sim_netlist.v
// Design      : Add
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Add,c_addsub_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_20,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_20 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2672)
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10592)
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
