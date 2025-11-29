// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Fri Nov 28 10:59:18 2025
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
xauNBSVWKkPu
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
