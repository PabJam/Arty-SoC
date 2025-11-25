// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Nov 25 10:15:51 2025
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
  (* C_LATENCY = "1" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Sub_c_addsub_v12_0_20 U0
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
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
OO5g9bfSnnWISCbzbo0Vsy754PbE5pLokA==
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
