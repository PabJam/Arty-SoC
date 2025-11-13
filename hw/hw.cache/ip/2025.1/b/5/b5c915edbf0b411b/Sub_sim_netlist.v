// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Nov 13 14:02:52 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Sub_sim_netlist.v
// Design      : Sub
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Sub,c_addsub_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_20,Vivado 2025.1" *) 
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
KfR+
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
