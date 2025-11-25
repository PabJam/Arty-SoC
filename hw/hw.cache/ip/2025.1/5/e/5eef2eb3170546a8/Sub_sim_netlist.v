// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Nov 25 10:15:50 2025
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
  (* C_LATENCY = "1" *) 
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
1GsgMGbryZ9k
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10992)
`pragma protect data_block
OX1Kj4Wc6UsVyZRqgJmqqTROnGGyEwVkd/dw8NWt7AnrRHhn1j2masC8dmKmDtPvrgq5iJZVb+n/
334ff9UFL4hqw5wO4DRwl50OBYGjRXpN2bKO11NRUCdcGp8LDc/8m6+4c6Zr41nImMMEQbpMIDsI
dbkGAX2jSRDmHFO6SFJvS2p9p2s9W5CFOlbI4Q0I3DRkB0TmZ36bcGN4NflSSMkwYOwUL3rQMGjb
WXt2nnE2R2ImNcAB3XOPGlLYCsmFuSeORqxa+jZnllXz5ZCGlnroRWLbjf/0knyDWBaUYjgBkB04
UbgNRU5WUWvRdzT3qXA68/cetTAwG0oRozL6Myr3obtS2xB9Mcv4tWm6ieIKTKb4p/SmDt928BgZ
bAJebO3C0YZ0Bf42+L8SBf+CQtDUIu1uxTMqiu7o1Ii5OEytoDDZizs9YZq029Fhdjummf4RQzYp
HprnRTsLGc1GfRBge3v6eUvtI0Q8KZ6r33FyXCeqLvbrz+lVq1VFKkxtHW/3QHZ7inIypSP5ulhy
xWS69T2pTTBi4YZhaQJ9IyeEYxJchrRkPjvtrPRyeVqoqn2yVTzaYXuCbLbQsS8FcA0Rvpm+cRCl
no2KWb/rmwpgDMeVDjhzUK/Ykmxm+2guwlazmo2bifAeIrOfOtGkmuKpR4aJxrqiNsXX7nao962P
Ek2WH5LLrSslwTO3eo0NurLiJfNpyCG0KmYLIAezoUcJty8G4Se0/k9ckWVhNLviepcPwAlB1/FJ
EqRjCyjc7id/UXTbeev5Qq8ybQnTGiA2P/SSFxMbkQFmab+O6hqbndTCPgLeRwPKcCzj95BY5FJz
5SFfcWA/BgU10zWQPGUhDSUj8Yz3SAWD3slVUu/X72WKEJrFNVIggtHAF2jnLbcXmxAUe6uNC4iD
393BcPUdc08OGKbav2fCXuGKVFSAMzV0V0mx0dZ4g0JVHPebByVyI72kV1tn88mTP55r0MOLgpTJ
GQD4Ao47vY8SOMSRKoZZD0Pdb5BGX1rCrlpd6h1s2+r3e1Uv1jHrAxAwmeH3o4qtIVsW8hqBBrwl
F8f4WNLUFZGmysKSgSfRHiqJzNxXTlXVjFb6qPN5Kf7J1j3jZy4l5mi7hqvJZTo1ToZ7uIpBvAHs
eT1b0b+nGEBRFkW0r0x0xsNIpu0IUlhULuETVUNh4/v9wJWdwZoTquNZeL61U7gaVbE6F4JFOc+h
zClb3eLWADNKcIZtYLP8hm79Y63JG94/Ojdh4ZsOF1qrVpRIaPdVCPg1gXtY9LzgSBsZ4C9BUeXq
aUCL0vi+0BdbZPCmpDdkthzwWavMfoVF8B+0JVBDR42+UjiFUPFakI8sr017t0rNiPhK9J8t9iH2
aLZMh1K36JvLCoRwDBxYUCiwGAzRpWsdBmSEeKQoINyJI8OlOFCtO7g7YdbeCZHlkIvAZjOSPMsJ
czXOa/ObuUpEJJAKrphUc3snPPaO4d98NYzLdhacqWwKLP/xub2MDLvpUKyj3PHKvI/0jI63aSeL
fQ2vhF64NiMpbZAKPgn96RjnNwO8lVrpmRObe13hNwuHhitMO5uylTeEmKTh+/MDY+QNGqNG1kCI
4nW1/hGPeef/Nen4zHG6Jbcmh8lBPKQlJ6lBd/TWs956hwmZhzrd3zySdWL8F0ISTpxnnwdjf+Bk
yCxZh7a3plAuHkdNA0/dNsk30u9/DqDszyLUlf41MG59ru7Cebn+ELIBYjOhbSBXEBdA+ouROq3i
QHqYdXUUyJqmidp8Kp8z7NzIFpT8EtK/p1Lzw8z9eN4m7geFNmh0+kc3G4jHXvra+sKAUgM1Ds1j
56Uj/FZYvOLEfd9oTX1e2QZBRK4XMd6hEaI4mFVxP4CXEGz8dIRyMYKkLbOWBaliQcQrFsNlOQyV
E6tes+vTpefuPqMNoJ4g8T6PU9+k90H0dn3GmlqUIz3ESJFmI8Eq9TUi/niCoLKV0t2lmt6N4UQf
p9t696njzn0MoAeFI+MmsbNDJZeiTrfkRkI8U81Sx+DWtm6DkV7sCEPedeZiZjVyTpv9wLp/tRE5
7MpV0piw1+tOafcKbzX8Hy1gBx9ns8aHXgTrT9tRnzdpivzUplbF7afa5X6DXIC8o37a5h9b2+xr
8YQnG2upy3M74Icd2O+ZtzbAzlxRgJd+140FukxkAQfSVKnuKCZiScul7dU1akklXHr4h+MbRboO
+3i4sQhLXw3wxUFf1TGQOAjAuoBaikFVatFKoJeh+8hYEoBkG+h0n/l548/xkFdRgVckMMF4qE4X
wGvF/R+PNDA3D1a36nfKvgEMQr24ir/5zlyOEWRTjf+2DGx7uwCw4FQZy8pOzZtGWTHzSADhOcFs
A6G0hhjM3oXsxoSphVqktmM3+9xOkfujD+qp34M1jj/x3R5GoL8vPCMWerlsfhxrF+5/9ZG72ZfE
6IdmZdEWPgr0+6OQEu+CpLmTCcivmeLKzcsw0rB6LUXRsE0tclR4Y7wBjVwK5zoDV5bIZKTbAIdu
RbmxLnGZpLMAGkx23XLdzzlUK9wpeiiKuuN93ZLdn/do2MTfX4FpFI4+ILIUSqv+ALCMr4xTqnFe
LFXAVA2Y7ZCpdbTApIMILQ9EoNBZKAUqbtBDT7qc644zuiNGRNixatATSfjVGtKpbOoaywOUhY7l
YICPkLPJWOXNW5SmGktxIykoDpXu7y2Gg6AvsoykPjtBdPKLG7ovGaEiD0xnzsYYHPIUxVQRbCGq
AXUMU3eDQrH1HrokFq/OHXLapNrPb+0KEYZyK85u0XW2SdtqJp12VW7L8eCsM4mAxRF2HFLOduoh
4sDuqkr4q0bGWO/2fQDXCSKLzxmGr0ySSfTskN828MTb03TehOe0qVnBGxHQq2zzplSAXxUFEqsd
1l7K5HxXc+gBm/JoWTE4uUq7FCJydPkxIJ/HlWjBCY/vcgG+2SnKbg3DQ3ISxEvVzapd3vHhNhux
1uBPkMT9q+x5b2CiQf8/bDRFiJKWQLoRbE4UmdYPkGN/PKcJ87AEN4DmmMOn8cAqqeniUKK0EtHt
8G/QTgyqY8+c93rnKvYD/CAfQHRr5QLAo7RAxHwmggFmKCL4tlraepf+MaM2Cp0KP10L2AVmGUtM
DrqwXhJ296g2D44SZKPctAwktgKhcTcaBAJ10qDxfo4maOeltinYBuT1cnkrbZ2JQ/cHBaONeRcc
II/Wouaf0ycmTT/Xu2W+m3g2vfNpF+KgIeBQyI0EqkTVPbb5Wvv26CTLTJr2NF7Gd7MB7j2I+My3
rU5Psu7cjF1Ctng2+QSIsaZdmRyzI+plvMmOlgFFOYZngjRn8oyDJY7zbSfoJUQBY0SU7F72YuOK
KUO2k9PO8yq1WOk6V6jlTVgRr5i7B+gpBL//GHWhQcbO4kD04ICrWUEtz1ci55gnSnqklvBum8uS
miVcYlFbzKaK0Fn4bluO4VzZidg7Oxd/tNsiLSBPZ8Q+n1rSuSSHDECxQqOWDNA/pWHbukiM1SPL
qvNlKuAyhv3zMhOnVAbKzH/2zKGmsmRGT9qvIX2UPLKPk3lOQaoOM0yaBkUmVht+fXHf5TQyvm3V
l0eYUqD0hvNbIAitvJ29S0xBOV+tMUd52qT+m7TshWZ6/6i5v/6xYxOmHbsxvrmO5hqb2IwUueCm
ZSa8JtRTSsUllJWtWgAD2tansZXfbObLdma3FDsAlaFVIcgrHjCwnbfrSgr5MV7MSNxXBR5S3+1e
i+twI6zxGkPzrWvVO36pTUbClEUPc0JD1zWOuXf4AT4VIiDlawEJ8gGozu8rDjYQeeP2q75w8pxm
iDJOpE1yZb7bCixeNHXUqe+bUlPVDPl9rLP09rH/fMszKkENQh348qLG3YTwOA6TyOucWsuf2NhQ
5oZY3ivYowekHrVPqW3qh/bPmuv4k0LbU3jlabsi5bkiqhS4rluCe5RBv6fIi/MXhJBwK6VvDSxr
0e2MRtDcBCnm6cr7ZEbHUIjyuu+S3GEkTE6svMWEBgy+u/VlpnIgq29nSnENUJWllUMHSgPYwarK
8vy4b/pbWg+vc3+hp1D/OBRmGPqEyvkW2HwrgStf0gkZeM82+2QSIgE+P4ZBncG7lvVbetOeA5Tf
DWZ9yBxrWFdJu4xn4NKJ8j3HwhUowM+xRN0tRYspRmcCPsrTp1ON2D1RMH02EZvmtgQwV+He23Gv
+++I7iU/CQFB4nb1H5QL19hfgfeo2K5BJkeRBPwC/QLjLnw78w+IYK5eTSlPhreLg+ohsQeOTpdD
b82dznyBiLf4/CtMau0/j6Lx6Xn46IhfdBPvVgYEVprE6u4qXoLYz+T6tixysTg+i4bI0TCjjJ0+
2oXK2jUe3bcnN2YvRd/F/jt2jwrdTRXQ/gzzYgynLKEOtwzYRlyPDNNTaeHxsqwJsxWWWmcP+Pk0
nTF0CModbCz9Tl9c9aPhvlgu7yf9nWdVIlxrv3Uawdf9kud8tkvPzYvSQDfdw50RQ4JATHx1eeh4
y/yx6Sp/RVgZx+u5Icx3pweqsKsxJlCh5bnwYFaMBC0uKApVhygtihSJUzOPo1SM1/xH8lOha9x8
YIq+oyWs5pbjyd07q6lAZpKfv4wDhXvTC54M5HvC0FbdXR+yrQbT9yxv0AngQh8kP2CFjdWNuIzT
hiOAV1XrpF6gjARW9Ev5O/9/1UFsMZToUiW5U4Dg2QEafxhLXW3AEPT2vpwU2aGSMhYgOICCc47V
+DB0d7ypJ1u5v8WTXYTI7ovtOpXT0jQxFLRlUaLYr7OtFP0PG0ykjgz9gAYiU3QkguSrpM0Ak2/f
S8g8O8M2VcEsGZXPKRnwqcQOuNg4QcgoRmjKrAPHBK1Yyxlvzs9M1tdy8lhWGvPKkYgI3WSQeUHb
uF3WjNxHLIMImPUeAPoOkUZg+FWpK1zMVz45CzdtxFTNIolwuoYHIshpbPY7VaB2MW8uJU3zps57
oTSuZW3hyI8zlySIbwnmwj+RpJIDiuBw3kfJG/g7VAdlzjO0kz+PjHuq3AfU4W8lOqB0CWvradBH
wgzKtKPkY2vIdwcejoRNRNzDbBfLDdM0MenO8wI5kKnkcGaKMOKMv6SVZ5gjl0SF3y9NQmRPMTGU
Ulp56j69mMw1MlZegb3PNpeAMWbqsmTH+0xhkLDQ5rUILeNjbjnzS7D8aZ9YQumXezD6elAO5f2Y
jhRAQyYfadQ4ZUobZ/Ba2F6p5rMJz/TB7o0fDQuCyZUhlIr6swSrTumSCY7hiEND0jsk05pkqBeO
1e5CVkCI3hvYOtcuNa5WuC9xSMlV5xjmHHFH/PdIuLCq4q7WiNwAY5HhYKejAjR/vQEWy2sVAK1K
xvV6we27EKjDGmHZBi0L47eFYC2xoNmxOhJUek2VMv+j7AutF5yMJJvZFkC97eFKcjHZZKH4GqDc
TZYSMhGTt4OeKQAg9/YbCUOcuCW5qn6uI/A2jXKEAsnoAb8wGt/Cpjfy/ntYenSEo9EH5Dum/TB+
0Iu7MdQ+FzFdmffGLfHIpqo/FO0VHidy0IsS2jyqQb5njXGw4U6vuzwm22mLPQWu4Zqe8xEKWgAe
9kh7FtPAadmwNS6ulhN5kC7Mk3xgAH7wiAfiXmoIZLHTzke+/zV3rmvtJBcNbQyDKRfJkaEoljAd
7jY0j0K6+S6OSO3lg2Zwicv19ZowZFglL35vjFcYPgc+Xr6oiP7XA/kOBWlamkr3CUKbU8ncrDgq
cBtzMEf8+/ablMHiWkgtd9M1s57EiTrrxJYNo3huNOnhNHq35XaPYPVqvzzUeGHGnM3qBZ3Nrnts
6jAxQtkofBKo7iSbYWC97iGpEV1xhcO4nzFzoeKrcEioulMkiNQKKhPPuCvnk2uB/QV2KbjMKk9T
tbDDmIzO9Xy8OBI4veyo0KOmcCE/8+Ci69d1F+FnVtQHUL7KZ/4tJxKw5fYpsn2UjQW5yOqutUJk
F93XZQY2MBHmjJyErdv77tTLJsfFH/kggoqMfmnAs+516FFdygQZnKkv94ZrcHVAlfTDlMR3pZdU
6iEFWw4DCOTjqmuT4AShslkMG4CCTd1iVFsSdkL2RVNjFg6714nIdm3I/UoDE5exI9uGsWAqSxiV
qfbY+M5vK48XQlmHdoEIJ+j7v4if+bQxxZIE6r5NasG27DeG/AfeTuvJLQgmjNwYhIcJ/wohZW73
NucbZM60ZrUZt3HjdxyZC6hDUKdlmroR8lEIm4Gt6iu+xA5UN6fZHokus0UhjL8hWbt4OYkmSMF2
rbcN50lMXDz17M1iwT9LNNyj3f/GfDe5yzkWWDccDZ8W0QMGcyRWTEZjexlCn1g5LINurILU41fo
73hOVJLwCKkdUtmYOmS8aaqYODMHU+TTl4Zrwqy9dro+srvmiriPgGNfdX4StUGjq09ixGDNNDBk
Ttikb6EsuhwIiuztGl9MjZzIK367XDMNYF0wlM0YfYexW16E1+3YgL10ctvxFN7kO/zIE6vret95
KjeaMdKbTz/KiJffLQIA9E8wVhHaY44BzvV4Pj3F4dNraH1lEtCbOE7P6VRUho+dnCy2bTKsjwRD
gBIQ91rBenGEz/V+fyooC6xOhKPSvBbt9UEkvqkBa+RF82ozE2xwihKOse1ZTXrBNpSIxLDoyJYW
hqSYIIhxLf+BizWSaeR37vAoRTGmuyh44KL7Ep3XQvElvA05GUYGbIkoMsGBfViRZJkhd7VGGoyb
ky/NSJRrUWKms1DO+P7oGycx9EZ3Rf9HioyKp6Fr3ZLps86vASHlFibOJeXrvp5guti6Ij7Jl+es
PK0YGhXsv33MtgkPnSgaDcWHspXblg7ScSPnyEhwUI6cxoFZyVKUeTMRObBCRkb953Zu93IXSM00
AYtsWZqMJZkP7g7IJ0jLrW8w/BzQAsxwMCgwgDFq2awfckOesf523uS5DIQ//I7Vr2VeWd+nn3OI
iGf47ntkLFTEQb+YAXHxsz7Vi8r/QszW33gSoIPORi1ECxa6Ni/3emCfK2kGSs8xaLts4kYOqCGp
1nhRZr1aReThEtmrbLY8bml+mNtBI+zjna/0dJlOW+JpXgxvd0hxe96DZI2pyFxm2KwXL/d9/CKu
sPaSq94uHnVbLgR0slK2PaUkRwemstQUPt5Rh/Ex6S4Py+BRMnMLrctf/uau8MN2guEcvst32NH0
y8Wr+MFEUUmGBoSxLU3JbbCq2x2hSysYEk9USiqB7XzFgWFWkVqia6dbiQEjD3MTt9qZuBDqxZfL
8mzckPsJ13cMR2X44N8eQWBpT7caDzuWIF19xMgrS1UOC+5UQGuwBAmcDZS8Cpm7sGfJ3XQVUkEP
uXEyIo+1mrss+u6SZtGaJNXgSkT/Ht3OVcNrps8m/Xedi7l9jN72crdj36YuNyFM1QELbXNBfztI
3y2lybZrReA+I3gTVGQ5TMHVmxm0MxtPPT88nDCvITpUCEQoHUg3JVYBLdI3zckFw011f14/Xaqk
NczsC1q0D01/lzdvisXCbrHv9b4vg1Pn19/8FPRrAGRVzSmnRGXWmLa0iPeFu0suDeBRHQRofOEN
TqbrtCGUn4wGzr+QUqIctuM5wPUj5z1Yu5WRSc4cfdx6bFrTQEOeI9cMDRcMebwR96Cw7ylzk2jm
DY0yDGWGAmjW/+mbQLq8ZGv8PsJKO8DOldzhYw3QkWQf+fIvtMxqiGV5hIVCDUeidNcap+ibf0gO
Pjh6jgLgW83WUu+MBpnRKJjda+QQAHOzHctuuzg/PAJ55cwBqP2Yyg3USB8X8tT5hpUANwT09fc8
ymHKFRdzvXkjyri9rFf/AwTP6HL+C3aUI7AmBeHzxxU8BpzG6/pSl4FmZoK5bFhVEfvwatN+Bk6f
2Xw1AbD4iJo1RZTjmJG8jqUsCyzGet6oFAJc2ZfcX3b/CNlDV5CzAX4fSMvTdS2CDbz1MN1yb3Hy
ksHD5APB03oDTyfUMHKgUXS+glhI6nilt6RmVuTMK1KT/qSludkB92DJQC9zG1y2XinKUMDPUq35
LeVvBK839dOXChFN1hJgvet51n5ToLorVywFYJctO8JeUlU1/8dXEqexesS1RllwiNT6ct0/tBK0
qAAoWjj+igi2uQUY9bL5H6evYADp6BiJjjmoKqR2g24RsHUhc3ucRLWZQtP9xrIfWtZK3STELYaA
TapztG0peqRbhY7wB69L9w2OD5KCskYhfMI9K199WBNN+R9fFKNFlIm0XJZ85xDW6w8XkD97+Pkc
G6un6xjuoOZFZUeHF/MQR/dsbIJ96BfubP71Wl2FOdH4OdBXp1k+8iFotkI7/ycIqKD2J2uO2Uq0
0tr4OxMjS9MdGEeCM4jiR1wRKxXMXDkYOVYVusua25888fXjX9curgIFQu2rE9kOO/+QT6f0qlQT
7OPwi9kQ1TQe2aP1ytzV626L0A60gBOEQcWk3DNGu5tjkuzKjuYXoYTUOAz8N02pnEvN2QYCBHcW
EeA8zciHdqRMN7F9jmTxkKv2AY/c//3sRDW/VR0nO5Mplb7DJ7OU6E0ekVqSsmrww9SzK0vDEcBu
4F+sii6bjWx4wNfLoBvynT6Xu6P7xNDtOVlx5tD/qLOF3BQ1364B7ikabuWzoK5t/vhzRO4yPQ0R
jkaCjF1P+05NtZ/UIZcwyWrTRkRiJjI5MHi2PApcO7SkHMIag5q/3V/Y4t4VpHHxBJws2YBd9ocf
5VdYJ+D1rSzMqpG1Im6tp+tTQ2npPoHrgUn6tZcucdp7m66DvLAO/4+LxlT4Z6jBn4Y01KNBdgD2
hIgU/+HHStdvkPpKfthvI6GweXnE6Bx5UV6r2wz8Gymhy4T2LFtPM2NSOy6GRCno+Kn3E4FfpAIq
vsbMXaGH7LOQXx7+VXjLK8raTNTcJjd6j6FlVWPX6LD+rlB4q2bX6HelRXg7oGkEkFeGQe6D4lGX
4ytcVn9PyNYBdeJNpFFfShHe6YLWl8PknNWT9c9auIZCaMWB3yRkdzAsWnmFhpj4Efk5lL6Lv+rx
R8jkYOOME6qSkHj/5M9lOs9A3qVKajrNu/B1uQW6s7pUm//TsPgbOF4/iVU17Q2vq1+sLNlDePJk
NwkJnK9RIDFlQtNyLYGO5pByoxt1H2SNFdia116cbC+oVZVe/jptYknm/lt5wx23JK1+LP21+V6n
vZ9kl503Kxl8a2oNb73a0KGSkIToUsQGJvGDawUnZauvf0+Lf7KkjFwg8akQ+O6q/9C51I0jdnKw
upL3/lU15HH0KYFIwzHrdCIJRGcTIBRhh2/bHCmIiP+ckZ6rPe35+LHbrcJ3H0OYM0yystBsgp53
YPILgQfYcx2W0HM7OFh6BySpTPPVesemti/X0qn+2pbrufNZympUDz4feZdz5cwd8pxoX1ahZE0f
h3tyEf0YQGX5UlF4wkfFWgAay9HYEKVu+WJvrQpKOwjIZbv6Z5MsAgcRy7O2ZNkD9uQ5+Rd9GwhR
113W7yC02nBJu024rd1YaWXwxgpNuLuJCwiU3pX/UBkk2/Eh9mh2H3VMQ8f2mvUsT8IfsvA2SYue
1a4EWptbxg4n3R6Hp45aWibMvyR4Ut9RyTi0fddNw44VDfCgLxbxRyaxtb9Yg4MlsZAaRiV8KnhY
gbP2UoxEBYitzvnBoQvPQbb3WEuBM9egM88iZq0cwqiWi6GfjR7+EGXBbtEl9FP0EKiH1trSGSNG
dizKBYssqa/IterA34lE7qn7dmFuBooRFmaMedGtVYXNYi2rRGYY/NYy4bmD3GiEr0+17q/GWheh
+kNgnFMpIjbMZ9gt81TNpqA4F2dYNyHaejZpYJwwpjrXDAO/C6nPzDo7+KN0IbSPvhv+1/QCNPrt
ifStSUWcJpKVmgXqFN/l6FaPe7nKfw66KXtnF72BiuMU6LqIYq0Pvm6glwp1zrbn0uPikSYpwFuR
rfjN1munXfNhjaFWGmNMpHYrQpLoB+3dbssm70l1/7SpQXnBRtAFf8s1ekk1MyJAWHHyOmZTDCFj
ekDXrgIoXUkzpiTN8lC5eMw3LRGsuMhIw8zkpxnFbc6BY44SJiiap+awJJmXRBLM9IZ69EBUi8mZ
cSJ0pP2yBhUxGGnAVj3VuiT2GtJKOxh9yojeHvBaPdaojls5DyZ+A65Yva7wAskDkyPvgeDGFuBd
8t5NBCd7axAoksQhIZk6ENDxRHD6ugZrRV9rie+27kJWxa8FOyhoOmau2hjT5a/Tw+y3Kx9TykuP
n3cc0LkboDUc0GRbmVl+lM9amcbXncSmhL6r4wxA8KjoJXeSzg7VPTJdm+rqOyZWC9Zsm0fgTzYq
b4YBEf0KaQwdbWHjStygHAHDdmarCBHLTHUAMIsZh/m28KJlQAbay2wxYhjSg9wJP4GrNUVBEP/h
lPQysf+OpjwkrErwZN5mIakPqfTmVd4n0nIofnZdUOYAt9xXOgpumvnnazA7XmXHmwmOqdOjIp2g
YA/2jAKD2kcRaKpXkhibJGVL6aLbQuj8/TcPR/kmymTqnXoUHs++rvd1mafQAlBqETNuFaS08Mfm
iCNj03Na7WDcsb437WQ8ckIqSmgBnyWpWy0ckBXS0/mf7BmD8W1oXcFxO+7oyatHGUT039IMaZqu
vmVEL1zOMkLqLkcfYL4rciJeQI/tt4d9IQ4fv70yAeQY4X2Fr+LSdH8NUAEMnnUhfEgl0gTd4XGd
o3LRX66gEm2hlS2aXnfLk9uk/fmHFVuNd66wtqWVM0bI/rPlVb9XlOCYPqMmewrZvrrf5YOdum/z
pEy0UMnTeDEsFCIy/xn0/UJ387Ec+luQSx+oeUmD0yML3rr/LZLN1H33C/wMtZOtT9V+IzsAb+CQ
k1qITsdfpl/Dc/vLiGPcnsMFBq6jZbdW7r4Ri2fCQrX1s8Vp5NpyT8VFLF9b5/c5+agGzp93+7Q7
kDerP2WJX30purkyvG2roAcSpwQR8LoH9WmIuPCkS+f0887Uhut8NYnEBSAZuFwfqxeHE9JFr0Qe
XgkTZZie1n0nTe9Ju/XgGJXVnqkLbF08FfwrvltyfGFeH4QdowiGlZCabdzCFuWP0Hc1/df4G6Qi
O5vzmrahzEdY5gfZ35FDkfFGMhxe2bVKBKEccrLIEHfINkqM+m6AWAp33Sp3LA+gHHxWc8wOiJJ4
no/e+8AAIQQk89RHnBZFOKQrb3hQo9AaxiZpQj6Nu5ETvWnUhr2AE/vYznMgm5+N32rAEyTwlLH+
004/Sg3xDAT+yXMkaK1FYnAV92wQP8Br0GNUI3OXDPg+Y3fE95qTfKJeDcY7Eb0i66ibm4rYzW+0
XUZ7wYcn2RLF0PE+njubeZRdVsmZV9BTij7QlSGdm/bSt2ZyIhgmEPyK2sSMMBlL0eBzUmQSE/0l
CIfzS5tVleAGvUn/rTcFATAl+uf9vlm9UlbAKhzUkEEuWlSA1PdPoCJt1hBLMEsfQWfSjfXwyms9
/D9gWChNkMN1LRygaZ+PIDznsXOrYvm1SB2RXZ2Tb0H+LoSpRqmPpxNy2E4URiMOIUVmE9OBmbyG
N2wOopF318pu1MYDY/9VsWbHQezUQpZ+Mwg1gjaSQ8E/qRH3Dg8mm0ok6hEreyu0GAj7T1LzFL1c
fOIyBTOSVv2Hi4xUaZdR06VY0OElfeVpwTHXlvEiF8/lTX9jkr0w3BFnnTgp+eoxmu/VZhPyUror
RRpLFDwk3T6fsMRHhdppUwCgBr02P7pHISzKdbfly7FTNU0JiOYll1hs7US6wGB9ylH8lGxTnzOG
TJRoYE/jPTEXAzYX2ClZ3jG4h0HbD5lK4daELJS3oZiN0gpU0HWg4gFCvDr4S5FtAtsfGRA9NCFl
H1R6KoCX0TRHnrLFK2oGV+SEUqpyviTmE9RRvAktdlxYWF7aIiU7OxFy3KgTHeAn7eH3MdtJ5aLS
Cw0/vGRhKBhlCex6h37hVp6uk2MgDTgh/wFFT11D7cSulpN6zRaozNM4oDVLcSixEdV8mGibxqiO
J99sTK81p9pIup9HJUDVs/294dlteVAJtnNm/Vh16e6wApd1POuel8NT3Sw2Tm2C8RGJ4HfNHdfh
r512Ui5gbSCSfHHgXGyY1+/sfuD8tqaCxmuwDUV1BhhbNdf4kP+I2N9Pi0AYT4Ymo7qWikiql8cJ
AHsnnOEQPpUZmkzkoVShKjw4miX3Ofx8EzJOZUm5yBETnpclw47JJKq4krAPM7Hj+0CAiaC0NH48
gNa0bfsG28ViQjHEGHjoiR5VZ4NwxBuJ9Xx6U8QtHi99w9eeJ96eyJUhPqr/cqmWETN0BJZWQTRM
ksuxjSnfvzDRxa09g5LuCwaGbmDytY6tR7TQBRiJTGbO4gJYZULg1JXuZF6r6R5OtgLkB66erHrw
HaIqUcZyFULKqmI3lskpggFBaPWEoBF9UzQERUnEpdmgu2l92NjsdrDtyQMfEziOz5+0EakpGt3w
68Dk2NbE4Mxw1IuGTy+oezIPHhEnZdPUBmHkLO2vdf+iXyAtdfu/wA0EVW0HnGc3A+VMsQs9EKZi
olXgWFSOFsDG6rH7KghnZUoMrocZEnmMqVxwT6BnjE/+LzRdrTmLMtrja12UfmCyi5KESCylUB1s
ilSOKhPgBMO4ABiR1YtPhYuCal9RAP0kFsShlOcGqlngF7fpiNROZFsqcZ5anzdUQSLwUUX32Kc/
A39pRrMTdkMuf1lCk8KDRnPAzunMXVCGyVrFtI/xl00kuYtUAjU9qmYhJIe2ANz6m8zPAzjsW73P
5aVI65xApR2BVp3WWKhAhe1ZJd/HJ+A+XyIfXwe7l+0gR+/Zxhv9zPK94m/fxsRm/r2eLLXyzBKe
vx8ewvr6PdW17E7NHS6QSXmAVrdTJpYLSGSVUh8JhQxm5JMxvNlW+rTP1eK4fiEfytcT8q79MqyQ
unjr2LIBn6k9amWriyosEic0kQ6XlZF4D6cgH2TOh+uBJSjdszMH3Rojg/EES3gEHayIZW4Oql74
a8xTstQIxPgqPKi5tBLYlfYfRzZinkoxoCefDEAvsrHEjQ60rj3fgCFAN6BslhvlHPlpVzpZYh9n
mopk5tp86Ko7lValtz97cXOOgLD656GO6V4CNn7XmSs5LNOGBmukOH2js6GQF+8IjXLKpBZnb4c8
zRSWUZFDH8gwGWPyelM811g2dCRW1EclLES6JMP8vrJ99n9bl4Zmd2EUVyOowsbQ3J0abCU2QaiR
hY7eEjp1tYSyZ0jKE/oB+81uYgkti/Vr+P4SOlkBzpF6NK7SPu8s7+gUwDGI2YWdDyARPDMolmDK
ZOerCJL/YgameEwlr8StqzBmT6yIw9VZ5e0fkr+MGb7nVq6P1CD0HZbQr+qwuEi/sjbZwsCH7Wj9
3YZxlV75hCRSXX9IEjcPnOh2bCFXekDy/92UqCUYVRSeBSGbS1qxTAb7mdY5oKa326Qjtrvs3GZZ
qYBAqVHHBsRo5QdaZqSFYD/Ji0a58WV0Fm3EBtflfIDnHxQGM1g9OsuS1C9o1gQO9rBxWhIKbdkL
fHeEoIjy8+C9BV8lywGE5IUf8sJIzjCTVM/FLiQ+ch161bfV9xnZjbzTnT6Lz523P4th0pAHVH64
ut2ndVlrO6uYmPObYiPwFL72h9wWbuL+7wdOxA03r5tmc5LlWG7McoV4YpoOf4o/HioLSkbEDShc
5TV5lyYS1y2Rxy3XUgBu5qgxwstS57sVpVMsdevog+H39Xh0aE6P2lh8F4SRsjwaNR4NijJmg3uB
fwDjDh0IaqaciZTBPPMPfCjXvXIp/65vjBwUQN7E80jl5/fxebroaMxgDLLXwuB337nSRchuueQG
8kcmZ/EbQYOa7pSw67bEZMdObOCUw65wPzWBjW50bYWv9TXo8wnXfJbvUC5+Wy9p9NoxxEv7UriX
m6CEuboi+YQeXAhTMeX7VfcqhMpfCJhF63yiJUh10IWzEQXI3P1GsibfsbxyBm4jqLzcc/iXlkbJ
kvx6x1UlZbGwtPKvftJqVrt41vMnb4mfNVPvvG460wE/iTylvGaxI2c5IYAjuf80IkHxKmUIGvMt
GA7+j+cVeNRWiclzS8XAQSarNe4sYlqBaC+m2EmTD4aVVW5OuRHoOverK/sl9XnCfqNPlotB6oO0
DVG7Fwo4gPkr2cVzpEUYOJUjRH9RSfPd+G1WXgJ6eubeuxubO9yjTL8Bft6ZkhJRXj/CzIKh2b77
Ke3xihPH7SfhuJgmOhlIiv1dds7wPKwc8/Smyi5FYbcgcfd7xWwi1KZkxk1Re4SuFMg2Vhd3hVib
ZNwEZst4XgETYhksRBdK3V283tAd8VnJ4sQwF3/NYV7K3CiTfhW7EmxSgHeNMuNRum6vL4l6bLF2
WK+sW1nR4savx33MWLwFJgHfR4u0JJPzdrIbeh0NCTshYRcfzqVWY6DsFqlLHtvoMMn5v/JJRuzM
O4J78hWaWJ3l0L/mmt23oijxsaWGTElQyNGBasEVEmoAs5tZ5glQWce+ZLtutDo2eLeeUt6X/lQz
oYxJfOzbKV/y5clkjR4OcTM80mEnR9s27PMAlWTYZx66vc4e7FcIjAY4dqmHRjjKm5S8vEsqWoFy
zoreOiUzsc+XcYgc4lDSqWO62L46p0yCmafn4wiebwIQR9q9e9+22GOdJjj4vmC+sbfFEZ36mo/8
2pu/DtG2hkUvs/Sog2b+uxGmdvtRROvruKUbz8QMjfyTiu99KJormXJYUDimMiAn
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
