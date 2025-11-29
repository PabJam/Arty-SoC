// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Fri Nov 28 10:57:22 2025
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
  (* C_LATENCY = "2" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10864)
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
