// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Fri Nov 28 11:10:59 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Add_Sub_sim_netlist.v
// Design      : Add_Sub
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Add_Sub,c_addsub_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_20,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    ADD,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_mode = "slave a_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_mode = "slave b_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 add_intf DATA" *) (* x_interface_mode = "slave add_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME add_intf, LAYERED_METADATA undef" *) input ADD;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_mode = "master s_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire CLK;
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
        .ADD(ADD),
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
3BDu1wKOVNQq
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11264)
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
