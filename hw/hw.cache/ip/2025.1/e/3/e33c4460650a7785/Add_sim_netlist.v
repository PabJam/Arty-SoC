// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Nov 25 10:15:24 2025
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
O9e/XVl24Duc
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
