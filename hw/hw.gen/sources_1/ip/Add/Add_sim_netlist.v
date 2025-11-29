// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Fri Nov 28 10:59:19 2025
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
  (* C_LATENCY = "2" *) 
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
