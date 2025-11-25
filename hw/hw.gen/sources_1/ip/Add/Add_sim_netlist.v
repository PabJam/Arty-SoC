// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Nov 25 10:15:25 2025
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
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_mode = "slave a_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_mode = "slave b_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_mode = "master s_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire CLK;
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
  (* C_LATENCY = "1" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Add_c_addsub_v12_0_20 U0
       (.A(A),
        .ADD(1'b1),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10912)
`pragma protect data_block
NX5k8E6a+EQmzqK1wZO1eK8A3Kl6Px1171nJ048syGMjovsKbNKJ+PhIK0mFsljp+x1QQwz9xhBS
DnZ6tog96lv9cOTc2emK06NhZfc5wpVURJoOEMpSY1E6uHm6cV/IHoOZLVaC08T0IOKjkqG9/oxB
MO2QJgoF7EtZ/86dedijQ0+qwWYWgd84HgsQCep/goWDGvsPyFNU5KqBAJtuUd3Jd5zHPq6iAQ73
8O9bPmUPRby8mR1BCIz4803MgoOPMrSEBsKGi9VHgMgiSxS8ITw7MDDajdBPqmgF3yCmP60RK2Ok
bfpdumCRfhWEja2PUJhd4D32leYA2zTO1g0DTt7elJSz+/2m83+y2wGZsfGKAb0sGER24tsPLfW2
FA+FshKVqD4k+JoJ4KqJUKm+hvyKoIKlrGsMG7z76+Q/rCvXabUIQUjXi1IUgy4mq699wW+L2cTC
nkGWmiATGlI0lIaPnsQHhAkOtaz7Ew80M9DwqV5+OkywS4oV1CyQTf3ktjyGa2CmMxjzxZI5ahk/
/9wyDhxYmkgzmMnKX2APoDeykiF5x68bq45yRttzFx+4QYvyGACbKlNl3FXj2Sgg3AyIEyrJSiBd
3A7LMt9lUd+PxtATZmTAS7tvAn+Y18cJv8TdniNNc717EJTQg60k04zcuOshhk8jFjAN28BKINWA
Lya9Yi2osrN+q36RMWdPSp/caZ94QEF1ch9021CikfP2L/ouqd9bpgD7gZCPKF6JM72BTDehSMza
n3u+1n4pINoPKdsIkqJQEBonwf6bxsT5WPfajmV7sbvTjTSPmPW8HyS2+q+xL9A2Kti0Pvx/Vy+H
C7ik/JVoW4WsS3MZF98ytgHSmMpdr2wnELaYSHWIFquCusdNpmpm4xEa3szTO0+xgD5VAgsaHFwY
9DRnttYDTb7/fZTXzc4fSnZY6zJbzHrIvQhP0QY8aHbYdUDSU8lJqNW9l4p5UGRGleLhgT2pZ46B
QJUufKY0vmy8u8N0FaSODdz5bI45+G4SrPSyRRci92MPPBbbdVDS1cTE8uhKYrTYG00qlpvcusUL
c4gKaljJnqts0ENewKF7p6foPit1DHdwGROIzts7VJSlWZozEwqcQEwA88LPDPtW4QRQ3YEvkDka
+9Gwe3GL2NxO3QsXmJck9WZINNDne3u+OkKoBvpO0QKJTWc4SAP4KSS/dO1bdRaWHOD4ctUku/TL
TRsy7/rp9W1bZ2lRrsa3o+sHlwaMhqairSXf5vaDwpYzrCbH13m1/5OEb53Rg/EdSlYkAZIxmBEY
N5mIHi4CU15ruRlQJ4ljTGx8+a5zLJApxOh9POawucfAvrskPV1rUaUGdJp5KqeMz2NGuAYAosVt
DsDlIJqAmb2NzwDRm9IRojWSFwgaiVDRRe1jvMHMykREnppWJDCLywVnRcijYBtWrOrzOIVjWLC1
q0dPa7r86ojbdLDCRgkyzOziTpnX2auDaGvWY+1suZLGECpgMMsPyR4iqlBSvvNnsyPuNBCcPeP4
mADYgG4lggtyuNuS1ZqkGZtwDU5lvqoaJVsUoluaoG3kMQuLWGmx0rMJWTc7p5MHp+ka5dXkd9ro
NR71qcW/48NYi3dWhICs1/ewKqhXsaQUXBt1dXf/VpSl79/Cy5ywoYfanADvANpFoF/uCZ8RSmpO
mMrPAHulgJhqMobVktlrFcUsb9CC0OR3q6J5kBydCpYRecydgk+otMgPb0bL7ufGnBOJ89xMjvYm
zOn5AGSx/OD2JBVSxu9eTv8Z49fO6+IxpqNiS4ZJxK4oL80lq85uGKIBWQsAQeH70K/nqMEDZrcm
YK1uSgxnQv7d58YG7EnfOMlOc56OTGtTdFJIMZSz5x/Lkzi7t8M6Dhr0tfy1viS2jc54+KggmXsG
lBmu6MnLCXbAk9VHklFe7g5FgvkQVFup7cG7A2of02Tgt7c5dChjl9vByME4rcGXWd6ivM4Ex7lL
xe7ry4v5r1Ua6Uql3a3040m0MNsJhgtqL45s3J9Xwm7Z9Mg59BHjYnNNzXg9fOCwgFJxJ3L5MsK3
g9ZK8TZIOEiqkeS2f9heVQ4zGlGQ+6BVna8/HTL1pA6jOKhGrDdyrBCPnHxK4BlTgQdJBIDEm1j1
J0Gzjbz0JRiWsVFk/PR5RmscTFwDOUzV6oPCaZSBIY/cRoipYkcUQDTE8IjJxTi5HI3BJ1qZrgBJ
wRk7PeQog4Cu8p1Veow7dvuTBIc1BrydSvb+yD8AqxrZQhv+nvuIDWfMIBhvuOH0fnLoprka4olz
PD92Jru5RrmPMfQPv2JlxNHI83FBBxge6TDbJmw8O41fAFlUPfYP1q4u8Wj1RCA4vcgGl934wbb1
Q2VABFxft2dj0IgaCQrs9RgLBlNIocB/bN84xSbq7q4dy0zDQ6XCkjEGZfCqUBY+szfgrAXAzwjN
Gbmi0hGFYIN8oU0XRAlUe2L9O+mCFSK7iFsZcRK9y3lZWCXCRxIfK+d5VNl5U1JQknfmAUBHOPlJ
EQUBJg/IA7tOr1875fy0unOZ3yfUQfjxj5Fh5bcsHhlKLQKbaNOC1tGZspIKEzrdvBnPu6QfuEC7
A5q15TZP4Ra1g4VLi0Bmd8jbhNZvGSCb/7SvmiTQi3HEBgyjIJrLXrOfPqN+y97EkuH+hgqP+3wS
G+v3+SWz8I4gBTiZSyq8CLMvERnh5ZPswzzzp5dqXjpZLro5rwYeIjJk7iHfkejl4FbHRybQZsx5
xijRM2Dl8T2/JEr+PgeKf/jTdZyl2TnB8gn+gU+QnkmMBIVdTuaQBioYHFvBzm+FLyZ0FIddefrl
lo+ABCSwbvNo+9w2eMDWP0xzATz6z1AbXjA9v8syj/ISeMlRPbassIjoMnnMSGXJ7foyaNKAoUZP
wo8YG4/QOx5rzUnNGG7C3bvb2/cF6zM8TCXbcY/wFrfzfUa7DoTpfOea8VqiDEEEawUD6dCMru9K
Qstybe1r2lnXsfGVwq+3WwGS24wVaaqEiRbB5Iv6cJt7xNm5Y3Z7BXTh/pk2U9RN/H9zQgf7Jyea
rUzeDUcylUyFJnaG9PEGj/GjitDJY5RMZbtmCDiWlGyq+8/scRqTerNeZdTRkGPw3fy1bMisq94y
4xOJyiUGmmF12izBBKiRBJ4AEFU6wroSpFAjWmF3LWD7iDh68v3AqqUAJ6M7/8T9NGrSKBtwh9bx
S+164ogfhNIg/p1p7ps6+b7apJIxiGxrp/hUTVU+KVJmfhVluk1ylqzgHRKQX5DATKkPfwstryl5
sPirTp3XoV/qVu0vAHbUunQmNFkh0Hp3fdL4YzOwQ5FEII1f9QK4x7Pb+QA9BVpENKAidvSPAScX
2HRZsh4RddVw8fd6BmEd8tBpxNibqNVxr7mjbv5GS3ytn11XODH91u0TCwWvuKJ2b/f2gzX407Ou
4tg6pp5tbAC5aq+SsHLR4jP9o0PDqe06Pj/ajoChs3UHx6XYc6oDrRncj4oI6YiV71GDIo9iAyNX
5rj28uZ6oBPJfXjXThSx4JiySWJXfS8Do9jI5TRoeZ816hBJLtHsPvuVTS9/UoHrxO9p/jJHkpH5
cghATsWqDbQRVRJAZnK/oNEA/EVdcpTOQqf7jZZQ3M63BEr1YM2DqRBJdPzSbmCwT9CYUEPGdgQY
M2vu1B8PSnStv0WRLroTHqxEty0O8AuqrzR0xEvNxevFjntTKI71nf8XgZWat8BtSPeFlAnO+Gwi
ZhqgDB2hmsO6sHNspejsUJrLiF/mJxhqZNPQQEocTJJzS6mTehqYDFzLP3PzSFgdoIs0E34nFcF4
JSIwwGu8TOVISN4eagpdtxU+zmMR2BtjkuXzTdnYZ8Fhb7i8GS/fMC6xxSs5S14ypZPYfzERS62O
hLsiZBlYJMN1oE5xV03wJaMi6lVWYaF332zxbdbO39rOFXc4vL+BSvTQ5c5APuVClvfa275CQ3HW
i3SX547OczktD5Qab1dY60PDJjB8YMP88ccpX6gd+VWftr3ZAzlfTlyMMscZ5bKyTOAnP4sY+BMt
oRpjbLr17QnqymGsh/5PiqmzuZHgN0UnTt3Atkl4H/Cy3ECW9yDc4PiIGFVtFH0iT+z5ggsMrWHv
lnwaB2u8cHCCEF/KFjXb/Xn5nVFuZBPtr5tyg+0nbOx+o2gI1a78jrBsxSVAXIe5Yd4JCDpGFc64
kmDZ3NCVwKQf5CADXq3uX+F0B8WycQIACtxfzHfgc9kg/n37CdIj5HrkLhDf38154W4EQvtz5EmQ
+CDxOeGOHD76SCYgR1VPtmJXaoayEL5PX/Jickc+Y5AH9cgO4mD2UuxX2SY2FzBdrvZFdt5rBOTJ
SlTbNnDGHV0rKKG5sdCdVJf3kwIbGDUe6UnfpLSc1Cj76cTKtyut/dezHXniUOYS/49YYrSkQ9t/
73ZkJoc8kmr83n24kq4fTaOsZ3mJaA37uBXWgiPSBKW0RrhAgTm02HmZSlJhjLktboDMnyK2j3s2
+xadeVfjGc7HJRujpzJVbQtFEXWXJibsqTcUkcnjGPxe0pJSn72x6P3KEZBqapfwJq6FLWXbyomw
p94g3ekH0TiLMtKU+pAR98/wy4kTas7dgLrCHNAjfGKl0ZWVVok6BKre1Un8i7jEeb27IDgTaOv3
QcmwcV3lrdIf29zFlxFl3esp6YaKW/nqzoSYjz08bPind/td75mwd3mMqBv8lIWArqN3xUS7WHBS
FgH1zv8Mi6IBp6+QukyT4rjIwBCzC9ZunS50rvYoQ17hkdxc80lkhikK7iqmj71YxNTvFIx4DrpG
xiTfHEzuhJgTtF+PT0wsL/RaJvpjIaYpASdY9cpOXkQZkkYWZTWGF2iwhqhjdHsQUwx6HnjX8tut
yMe1TBGS0JXyD2VzpuXsOPgBh0+LfDWVddo5hOB4QwrcWJjvdWUaacG08DNnAJCHTxPxApvCKkr8
GBErqBbpFkULB6i328x72AjkiFZWaMLYi1xs+75KWrWd3wDltsHjxlL+DIZED9m1aak1XW0r6TzA
D0AIyCINRuXyvwRZkkNnHKZ19QUxWzTf85erqrw+6w4XeAP8tlDg2Z8WdcKdsR8sBhmZcsp0GYte
P6tub89DBMmjff2iH5+4A12oqh1Mdo3FQloopIFeu0Ejp03MKg3OkAC0eXL2I/pYTHeBIhxx75d0
N8WTg54bQ36ReVuIQas8IjWnHfE8PB2Azywmv04O5j0PF5pF2sdL2VgqOjcaB4AOItEr2qDq2a92
IgfSCBsBCkd0a7xLgFg0MzUDUs1yk7Y1rQNXHptwu7YjFWRwy+wrQrVwUUj0mjmSrRNnzA+W6onS
FJFfBmid73oRLx/tTCAZ0LTXTS74ejZGJizp26WwQjEdodgUcHhYiPX18aJBRSMVVW6AqUhcBM5V
2qU/+02nLyHZhY7X8keGaf2W6Qtzds9+KwZVqEBgtE3DCg7rXzEnnK+cFSSx9ss3jtI4dH2KiwhE
7BVbvw05wCrlQKb0x+v8rTqK79uG9GwZ7vyBS5xJx0TpGdLoAjOyMbUKxuk4rJbX9fnB8/2rwD6i
MFVDs50OZAhsNM/oHR0kakxF0A1sxuHvMo2513XyHPof5Je3AG8ejlYA9vJ0nuhHcmzufHJTx4un
/cl08qIz2wFjDlX+yaBpraMfBq1aqSR5eTT6ZqPlXGuZtHTIe+5ml8PVLCoiKk85GzkuPh6XVY28
3a87GkuuSo7LijG56+3sv76LWkqrK8MbwgsPro2Xya28pJMEU6IoIv9h8BzYnW6kqtw7ap+wBiCX
oGQ4JtOykx1CqYIHWfRa9VMXE5xOxRj38/NDIQ61Uunf9Fp6WByw8GUCYTBeiJ2eLCL5KI3/omZ7
luV+oRuMpK6ge4d12HSgu9zSRO1vPyKlbMjF3wkUtGquaaob5OX5DF7ri9Ct+BVYReS/RFYzqBT0
STEigdk0rbqqRZ9uGv8a/pjLzfWU1ogf0wHj9Z5twsyFX5m5NMBc8wo+U/pZgbW+2Ep1O8aPHhi3
KJ7j9c7deu+VO/kNGj8TXcPFIorpCEfLcZGvjtgHhZchTiYEZSj9DMfOOVWZMvcmCttsHAtuoxfE
ec/im8glh2kRBRKG3mq3t1EvCWieOgI6sHIfhHelPLHilvQj0ICo8zrp2yjRpoMKvUv0AvmwtThO
lbHwWuGtEIBSimELaKsVht3uyfPQuz6PLd3AUePKiAdD3CO6jAOMIDy2HA6j0Q3J8DnwPFi6gTCe
LmTnqGrtsR0zfaO+Tjar0cICcdTHNvHf2dRbqJlpQQBlNTd9BKLR6Cz1Uf5V5YBouOhdF9SB6EXV
CUIS2Lawhh24vzyuA42O7VAn6sp76F74TbRZvRovzvd0+hcISQmJJvA+6Tht7DDVPrFcFgITNr2Q
2d21YthErNAw518LdzvbexZoFkXU3I/gQ+O0QNA9fCpakB2yd4v71JyjyUuj3ZRqgLrLslttVcEy
DrdwAXpfBGVgKD3RNJpT0TV3CLWmzqf2cfvnYPflUmjOiJJaS3SP7bufHx8ZmnhfCafcqiwfO5Eu
KwvtFwtYh5nNyLxnRybkY1q5qS9p9vbFUOuV9M82XKgQz6CbfbVpwiAr6MrMCG+2yxkLE2gK+fVG
50tBEpG+eM5NQTTvNPomuPxX/Bw7J6+efdMmqkQortyYRvBOel5gsQLLngyZ3URoEyyH8D2/2TWB
1FXOkpe1TMRViD+kLfviOVQrBR4G+v9X2V9KsG0si65oQZz4PB8z8aV9vB9HtUGv82j2kRlc54Wv
iBytl2mneaUHan/Vw9uSJuzWIHMox2M13p2SL3rNVjINbYvgqY8Zs7aajrQqIvNmhPSe8tZfEdAZ
tscB+k3sshTTo56MquabaEajfUUm+D7BQ7jij4/h64piN/htTt9bwp10G1MJNrsTXEekjqGPIZxX
vCbnmsm3Z/+flyHCR/t/0Gi70bd7Ubv6e5BNyuRmXjeDif8wGxhKIx5zDXgBJ0NL+cE4a669UO1T
kUX3MxuCXxrllIYEkG7NjW1gLjOKRdRtwB7j2ggvMX3MWcVjN34ux3XFIEDlzrqvv0sh5OIn/hGn
ChDyez/kqg/fZC/rCbsRoT6EFvjz+ljbUv/HIHwRxL5viImcfUC1cDnUml+HBM/lcoo9S9VoybZW
SeROOBC+lw2YxmqASE0tHw71saFD+rUfWqL/Z0uurqgEjrpecQqv5sLviQKkg5lFvmBTt/1AvAQp
4F/5YZaraanozsq1MG9/i0fz3KBqSDyTGCyfNamxCY0l5E5MeTZZcK7YBWeECc0NP63q0R9KTvDB
4oAO0UhpJbV0oWd1KeKq9TOBao6SdxmmPCfuGrCuyMZbvyosGzcs8FGtPkTF6y2zQyWUYaGB69UR
EM+TZBDhoGwlOcD95tRgLTIiMcOPFChnCyf9rPMzSJkUgxR7xYzzB7e8dM9pp58pA9T71QWrkueI
jV5amIvALOB0hSNOz4EHATmnuhdjrmLtGKpOic6ULGEOc6037uU/tothI1nk/plEP+mBy5W1j7nV
SP8dimceAns5eJmIogh9nRE9hPTQyzZrtQuC8l4uFBqytQNhwOZr18V1QV87yp1QMBCrn+/+NuIh
DMmaUbphrVJD4pio1QfeyrotbQXqZVnz55VChf58nUqnCTGMd9bI7nSFNrR3lrJU1qVOhyQE7elQ
70uFHLIpDf21Kb9NFrH3ai//uriJ+jx43rEXYYTbUuA63HEOp8so0L9hkCe7+CiwMR2p4d/sTzvK
77RBMxuB1GNAlNSWakG/cJZKaG4e4H+Jb7cmMcaMZg/nUnYeZIBJm1C89GMl16tC+NGe/8stSp+e
3fPSUnhM6DQq9W+WS5vi6CVhziPlgdtHiIBEUW8Vm9pPyGXOlDzdFHsQMjVJyHElSUvtYwyk5fQH
hC+Jf3dYqEkWzTiHdSUgZd4Zine7m1JyBNltkR4dfdBc9A1eF7NXrU2F6oLdwyyRFAtQVTPYFi9N
Rg4cMqTmfUrx8sq0cbGZzN0KV3pdvApZF5q+8j8xmecb9wYFiWqVHzgT2CMqUwT9I4Yxau686j6s
1/ZSm7V/jS9KlPRQhtA7lCsjrHRlopQcccZqkBc8JrV/qbxBrbDFlBiPydMK8z9rIbLqpF6aYTRT
ubQ8Jb396UUHdW0V9s5aZHI542gMJXSctbgZ1tOqLm/e64J1F5R+iANr8AgDDpBE3jttxzSy1w1V
LHIPyqI+aQTBxM/gHeOqXuwlpzEhVKqd3jNySgtF3sFrinJes7xlMcfYhJhfN45kpnpvcY5+oZ4h
SsSpnvIrYrz3JPEywnBf0DLG2uQ5D3H8gOfnCDRkrXm2XttIiV4ToygiUOmWLrV8xPmc49EtgMOD
KYkIkPybnyqx5lsyLSD2VJIO7IgW8rnkb0YFNcx17tHQ5blVQDp/YZhmt+GwchMUMfW2onyehsnQ
yjogseodHZhzO8JmUXzZUzXf7c/Jkwh9vhUDIsDZYQuUAq00TlK/ygSFm5xjuDprCswXayUmZiX2
hNpmxe0NDTgiSwX48r6auevugL43BTFff/nunpGjFaxOQH56t4GAr8nw0HVyEYemZvHotWdMqaV6
jYK4IcKc9ghxDU/zrHLAf5W5oUtFqa6OSS1Lj038QCxu0wNRSbC4IlVVkhqY19hxmaMUE+duO/ds
aOt6pWZbAQVqHRnm+bJlnGhJrTgEhZGauyLmvFCgc9N7SKIMkOHtPWJFRa8CQu59MbDdcOdV5IMk
y8wVZPuqpt3VHS0DuNfe4xiTMmU+IxtT6Vja8NxX2QS2NtxZSkdVFlhIN35n39GNGBnoAfOQzgSd
XmU12x6BP4klaP8aAP9r/VwuX2/dJ4/otALl/1cNv/1b0GtfO0j3D3tjQr5GL74pZ/fZsMgREjNO
DPHZ2G6hbXOuziOqUl8BEC0K1wjINd8oKhN94hsrrd0lwRPGs6aH44Iqf8OONvkQEQ9SotEzU+XQ
BCSdei/4rCLARkHGBLl5vBmmdj8qeeA6W1kNq3MHNM1084zSvu1crbEDlPoWnrHgtgaQnxn5wQQe
5BwN10ukRkviGE2gbCk7HxzKEeLGsaLOJXi2SMqqhrvj/94Tzng1vW4PY72ctNMOLNm23/nqQPXe
+7iQQQz3K4kWvGG7ewiVl7DuNZsfGmAaGAqhZ6uRLJgwfXHJQyFUPrDpMDosfCjSl9KD4NeGmvaO
KDh07leWUfjwkPpvlRCCUNUV0BE5HSg3A4anhh9TXqisveexJHH5XgwWninDGvCenqT6LxLwQXZA
SS4NyJFIjAPFh9wLgKTk6OY1sOyXwSryWrEoeIkGxCvOXDNulsm0CS2+cjJQZN23EdvfwM7SyS3D
rODB0a7ysBxDo032yqXiejTAtw1uxumMbTWAN57CEYn+ZOqOfuqgU6hv5iayOGCtcmSBaih+C0u5
3ia+sfEeKHpKYADC3BS2Nww7OUchFVE3+b3r49hrD7WZqWDo+f2wy0uGSYwokxCiA5/+VMf2fnEW
6ySoiluZCS+09ACASTLaUw6XztmKkx7Km+DLYVGeu8LUwMqTaaNqySmJ1NUIEpdehdIIwYFBon+V
7yTTxFtxc7RYFJeq4GVy/EqhRzs8EOQtje3SOvbc4Lln5iYlhwPGNIi5Z8ljN6Kx3rOqlGgVvinp
PT2wXTdfxIpIZgDS2UBs3myPAtb94oFy7urshE8d3xC6g7Z89KNc4LlbOGtrwbUvst8N0f57f5Gq
pw7+ZqYGTPl2sKlnsQIBNZxCTtaQyAUgwLtO8BuEte1IC/ek33fcRMJW476CsnD29z/V/bId0zNv
vuMj2xjF4isgm/MOm0MlwfZwWpySI7dXl89aruQhQA6gzyewFjdSYY10uq8eWjDy0cntxrOXWP31
qp2TORldpOza81PJSt+u+CScMhbEQOvr+G9UyeD2ejnl+CJa7KQyg9BQ1lnerGuzPSBOdG8PHU1T
sSnG7XaLueytpaqnFwB3ldHIKaZpMudbkjMvG8D935E7c/kNyRgV0bqzpDX+J6T+AgpAbEDCgdPo
4y1spuuw9aXWmzsbGpIjqNsVGKJO6vGLrv9zmJxePbFaIBAITHepRz9cF9P0e1sBk5mGV/tZvXPS
IbTh31phZ2SKdW1x2s9yezpLYABClyhZz15qlhYKr3M/2Y9wxrQ7dK/ySRydDufElfHCZ3HSHDcH
JiXZVq6DUC4kq/aohTH8boffTRcnPl9373bL6H/OxXJT8H/AEbd9iF64DxS2oI/+/QYRfFx79jaN
JdwCi3144Rt1CIYa6wXex5//J5ifWr5cPL5zh0MMmdBh2UWg2JrPN0M8q27co/ylBrwLVLYEIjwD
ahht91PfHNbeQ/vs2x4oPCTxOXaVQLBT5gnr6E18DK+2XryPrUqdO9df83JczpDLU8TkThXRNWAV
jHNJOgwrGB4U2h7+57ke18Ica267Aw5i/kMJCX+SclCoqfXzAxfHSD6kdBHvy40NW/KeKO0otm87
W6OdzCqosjWhoRpiZ3Nk2Vxa4iuThXQktIdsHkO3nU5si8MENoRxpLaPayMbgEUUOarpDOoNcHxs
YBfE7MEcu7ItRYcufEjvO77oQdPe5R7S9eCOLzCTVlm6KruEd6szk4jg6qJEgLD3MO2uGrqvjm/P
zJEsVKmhCZ+QWifc9FRSuNeZzzCRqdarcFMwTrRYa2m2eWEmPBZp4g9NmgVSzOQxLMTehIVCYSNy
3hODdjl3OBUYQKmpEmaEQs/EeRkPX/dWuGTEVKubnmG5smpzcuLmlt8lba85b6pp/tkCxJCipiax
WczNRp/CR1IIyfa/UsRG5KrIkrkKP+rYFZ714O8eZlTFtv3h77ReFK0Iv7i0Z2L92m+VF78lrcV0
DzYsySvGqf6tSjxu6KWBxV9oLnOS6Eyj3UlAPZIALBpUFULvOvnpgAP4rlJREfXXNGqnjsMkoZYe
HMqa5inQyA/6XT1qBmpGXTtZORkmaIbKvYZ/lCPaEpL9FaejASbhTivn+Rj/Q3J5QDmZP8ejmMcv
KrmRriyxM1P/kZ9zREzuNiG2hjkBFbzIi80MIrrF3FY6jZvTCTvsBJTnDRQAHUQ9qxsoa1yjum99
ypnR4qUkey58oVgQJ4i1RoYA776v8ccSGtT52exChpTtf/lmELbiLGXNw4xlYe3qwqa9++Mu+dUW
wfd1nG5uHMO6JTX8RR5abzw3c019UAEmUUL4dL7263KbfuW3OI3SkP0lnHPxYqLO9IuFyAbApJDm
pe5FpYG4yNiIC4cKXeSzzvqwtvAxqpKkdmfVD6VyUvd3v5VNglaxtIma4al8PMTcHk+eojYClF6k
LXGO3hv/Cucin+WCQbL0PQPPtGD4fY+YrgQlFzAF7baBN09SwEDO6zFtT9fSToAUGdUFKb/auJXc
tz0QYdyTFfrKyPL2G2DGp9jGcKeQ3B2czzOuckKZ7HamCB6/QzXBN92rwWc/+n6qfHKIwylb8VXv
/is7fWMi0Yu0LVY8xKpMVuKkbXL54/k0MJhIfVJdNwfeELXF95FtjMjaOXRxNwZFrrGOcuZT/a1l
5ZOOULqV5h4jhnBjRmk6Fj73rrHNMPox1U3UP9+brgm4wEbD7eps3M9DmBzYNh2UL62WU5NanXwp
F5yw/iCTVVdMFRF5joO2826jQ59VA8+tFzt/01D7/NgMxqfIgkm1mHlcoCtTbGcKrjAvizIF/YfJ
7kVsjoPQpDjKQClJrR7ErRb7seMj409pb0D/bkezhfPEvNfl5ixUc7+yusan9MgE/28tC0XwMm0R
Izd5INPGgdsYtMwqj8PER+IE+V2jTYLy7R8+6JtTRpGAFrsfIkRpH2AUW9xCSFV6XS92VrM7xQdy
4TRKJRcvHea648cp1KrKww2gTKj0yzis325qo2rpPnKcjwMnmx63ndzh7bYFljj8U2PGXv+Jv5tE
z8bYJ3EqH0wRtEgbMDpTN2PriKyRefQzcLLY+y1DUUQMKK2p54NNd9otW8kicJbxzqLu841bvNg/
52ePcHJas8PyEfzKU11DCTLvikehP67nqFKF1/Yn1LcdRKVryiyaOEQeVmOHFKuKPcZtrt/+seHJ
6TGfMo7i2zdaNCCdXSiUmz7w4XX/02qlPrGNN4GP+S0XEyRYpNPfWK/YtryxVdwP9TU81U4D3AeO
WRDqRx9BLXpOCb7fmCBnj9KFXkxXmeCYlaJ5DwEHCowpQnTDWW3d8jMeQqL5Sz9ojc1u3fK7T3HZ
kzjNtgy4fgRVMECw3UISYWf22calk2fo7xEG+OIcm98MTeChXvlmMSi2rtvoXkjrpioCcDpVlug0
ptE2mRrMF0wRuZpmalxP02esXTCM5tFfOuh5xdEA8IomJzv+YkU922LrOq/MCiQeDauaFyreOyVo
RrdglX+lXPt0wkjo9qKsk5bjkrYgU7xSQb9KFQTW/QFNBSaefNqYB3Gp9KVO0wlE6Jq6i02ghAbk
a3SRY89gMfeFne/2y9kIxFG+2B8JXsVmSzseNIJXEdf4LVrJYhA6i6szOoiTKuM7M9xw52kdUPqW
NsnHfG3/7tyvXaMVt1dh3RnuCyEJZPGsqCqAM/k9fs17+tiGX1Eq7UiIZkyjAl5b/oboQn0kSGD9
QONNcu+vDOnNTFvDmtm32cRSDmHpVcj56YwgxFq/AEPiAB/lKaomnUQWv5jxgt+lMpunXFskbxEW
UwdMeX4B6vZGcQSrTBmvhQLwwOitzvgD+8ZZb1Urooe2AyHQT8wEI5HGu4ThllnOkPBrQqex3g4p
zIlmPiKRx1CPjS5o0GMMyAJm7UQ/FK9E3H8fABW6N6du38K0kGwfpp8JaHgZZb7d3+psHKx2dzVy
jb6pd2WL6dNJOnuadMhiiX3pPJ5k1J6d+J9C23SJFipN7XsODHzgXjFUV5YUzOzhxOUH7rImyZYY
z4uWNCE06kpRS2pASzHgfd0XhEPBVuYW21dLMHNmuD/vFhnR4osnjdpRztlQQ9Oqme2CZuo1CeSi
gkaXV2P076l3csx7m0KEfgcKE8MZz5xcNhl8asX/98QWQ4mMxkj7oQ/OTjOXQyygmjgEXj8Idug2
Jbybfw0jJuSUgt3GyYQ3jNLkLSqceGzL3p9FrqFPmrsvVku4EF4D8fCsI8FkTADqRUwCHoIbMUIJ
nmsvPvoaaTZoeaH0vIcusHKJBjBawrClaPQmXFonh1fcvqpB+RFWFR9PWmAlHMQf9vs95/z5u+qb
acXXpJvVo+/7+Ypwfsw59dvkUD+zbZRBavN1waaqBsDcaj0reUYb2+ZAUwBSXUDb6gDRSETdNteH
13Rz+t6lvZh37FzXkzaexAnwiCJQpDpQfeig42Xk7TmaQD2aiHkWbjoABbIoFnljQK4SH66QZIBQ
8eCnQX13UBGr3Xsx7QpxRS1x9MHHKI5Hdmxu48U52wpHLjIWRvc+8NrYAeb7AVf4CyEIrOv9YAy1
Y6Q/9AThQtYe9gvz7CAG7CDPVs83RHLboy3dkY+6EmRct6ufTIqs0VhW/MD6fM5HsY+OCVa/cFXv
KDaRnlA5hGmwq9pGhraHyQhEVySrRffKdW2m+KRGKPWwMcV0Wmx68v8wtqq9Nkc8TDbBogS1PuAB
RoqfRf6ksRkAtj6L7IgHYsicUOD0dxHdoZlQf7F2x8AhIAoNhIyivfLWlRokr+WfAiC5UPAnf/vR
lw4771Dew/2M1uhvhXTyMB97Rtj1+tFSuP6iSZ9Yia2MEM0VGM62q3MuM1khtgbsQK3KhY6r9nKt
1SOQKnvJaez8x/SwVk9XVw66HNDINfzfToSws8RyaFJ/Bi+Kew0WjekaS/XOwQUIgtoZJ81SSwXx
Lf0Wb55Lb0UYKC28d4iYk0vp7hFa5nwXqHjd/uoI68pZK6BzIK82BHdEcsZ6j/AnMBc1mEgwgTMH
qEFSp5O5Y4TM4oylypLm8OoBu0dwZ1eIhlThC7TLC2JhsS12PO6Lo3VnuhN8OcipM5nFhOm/J1q7
Zy5r84/oIYDaUkJw9BzHI9Rf7mH9EV90QJCPBAP6Zq0LPxk3BcIilCEPRN71Nh7ADehZ9jtyn8r5
0YrGQ9l6r9DiNZbymN9xOnUTdHNYT6yJuYX5+CmUh/d5Ca8KHtecGV0c30x2/uNroHQNtWjWCWNo
lGJxQHoKfj3q2OjHhJbv4m2u7bN1/+V2N6FMI0jkoMs1IgWNtxuARaf0XSV2mPp4vMRo3mQbZElk
8DnhFExN3I1Jrpv05tgVicStfqXu0f4Yv6YYJPFP7DoZq3dUZJxJxvkEDSLABBMYD2fB4tqqh5EW
onnm7irYFWPShFdgRh6OHCuiVzuzRepVNaVdPnqybsJLZw91IXVjbKiUnwA4/Y2r6UmmcT0YmZ8m
VvWIE+MtbA4I6f976tvVuDEFwF2Ql7ctiuTGASeDNmGa7AB/jbsjmalhRi4qv6j8ECnhf5c5aiMo
y5OW0lWfgbpXOSsYTn+PzZ7CbnXqXfaMUv2OFpxtPEZrIC2pOmJZQbzIXg5lg83att83OpDttVaF
DzlV5p3P70PQuYyzv8/073I9scUERRViaw==
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
