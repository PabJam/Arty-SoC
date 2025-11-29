// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Fri Nov 28 10:57:21 2025
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_20 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2688)
`pragma protect data_block
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
l6mRgbZbvuUh
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10928)
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
