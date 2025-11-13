// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Nov 13 14:01:58 2025
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_20 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10320)
`pragma protect data_block
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
OXvh
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
