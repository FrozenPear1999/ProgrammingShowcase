    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 8;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (gdactc41oo)
        ;%
            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% gdactc41oo.UDPReceive_localPort
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% gdactc41oo.UDPSend_remotePort
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 76;
            section.data(76)  = dumData; %prealloc

                    ;% gdactc41oo.On2_Value
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

                    ;% gdactc41oo.Off2_Value
                    section.data(2).logicalSrcIdx = 3;
                    section.data(2).dtTransOffset = 1;

                    ;% gdactc41oo.On3_Value
                    section.data(3).logicalSrcIdx = 4;
                    section.data(3).dtTransOffset = 2;

                    ;% gdactc41oo.Stop_Value
                    section.data(4).logicalSrcIdx = 5;
                    section.data(4).dtTransOffset = 3;

                    ;% gdactc41oo.VelT_Value
                    section.data(5).logicalSrcIdx = 6;
                    section.data(5).dtTransOffset = 4;

                    ;% gdactc41oo.Off4_Value
                    section.data(6).logicalSrcIdx = 7;
                    section.data(6).dtTransOffset = 5;

                    ;% gdactc41oo.VelL_Value
                    section.data(7).logicalSrcIdx = 8;
                    section.data(7).dtTransOffset = 6;

                    ;% gdactc41oo.Some90degrees_Value
                    section.data(8).logicalSrcIdx = 9;
                    section.data(8).dtTransOffset = 7;

                    ;% gdactc41oo.Gain1_Gain
                    section.data(9).logicalSrcIdx = 10;
                    section.data(9).dtTransOffset = 12;

                    ;% gdactc41oo.JointAnglesOffset_Value
                    section.data(10).logicalSrcIdx = 11;
                    section.data(10).dtTransOffset = 13;

                    ;% gdactc41oo.Gain1_Gain_en5x1bbj1v
                    section.data(11).logicalSrcIdx = 12;
                    section.data(11).dtTransOffset = 18;

                    ;% gdactc41oo.Off_Value
                    section.data(12).logicalSrcIdx = 13;
                    section.data(12).dtTransOffset = 19;

                    ;% gdactc41oo.On1_Value
                    section.data(13).logicalSrcIdx = 14;
                    section.data(13).dtTransOffset = 20;

                    ;% gdactc41oo.Constant1_Value
                    section.data(14).logicalSrcIdx = 15;
                    section.data(14).dtTransOffset = 21;

                    ;% gdactc41oo.Constant2_Value
                    section.data(15).logicalSrcIdx = 16;
                    section.data(15).dtTransOffset = 22;

                    ;% gdactc41oo.Constant3_Value
                    section.data(16).logicalSrcIdx = 17;
                    section.data(16).dtTransOffset = 23;

                    ;% gdactc41oo.Constant5_Value
                    section.data(17).logicalSrcIdx = 18;
                    section.data(17).dtTransOffset = 24;

                    ;% gdactc41oo.Constant6_Value
                    section.data(18).logicalSrcIdx = 19;
                    section.data(18).dtTransOffset = 25;

                    ;% gdactc41oo.Constant_Value
                    section.data(19).logicalSrcIdx = 20;
                    section.data(19).dtTransOffset = 27;

                    ;% gdactc41oo.Constant_Value_g1ilk0nir1
                    section.data(20).logicalSrcIdx = 21;
                    section.data(20).dtTransOffset = 28;

                    ;% gdactc41oo.AngleDirection_Value
                    section.data(21).logicalSrcIdx = 22;
                    section.data(21).dtTransOffset = 30;

                    ;% gdactc41oo.Constant4_Value
                    section.data(22).logicalSrcIdx = 23;
                    section.data(22).dtTransOffset = 35;

                    ;% gdactc41oo.Constant6_Value_egs3yvu4uo
                    section.data(23).logicalSrcIdx = 24;
                    section.data(23).dtTransOffset = 36;

                    ;% gdactc41oo.Gain1_Gain_kjyov1dkru
                    section.data(24).logicalSrcIdx = 25;
                    section.data(24).dtTransOffset = 41;

                    ;% gdactc41oo.Constant7_Value
                    section.data(25).logicalSrcIdx = 26;
                    section.data(25).dtTransOffset = 42;

                    ;% gdactc41oo.Constant1_Value_od0pbunfoi
                    section.data(26).logicalSrcIdx = 27;
                    section.data(26).dtTransOffset = 47;

                    ;% gdactc41oo.Constant2_Value_nax4lfw4cg
                    section.data(27).logicalSrcIdx = 28;
                    section.data(27).dtTransOffset = 49;

                    ;% gdactc41oo.Constant3_Value_nfsj1wgnzf
                    section.data(28).logicalSrcIdx = 29;
                    section.data(28).dtTransOffset = 51;

                    ;% gdactc41oo.Constant4_Value_johq0ssnue
                    section.data(29).logicalSrcIdx = 30;
                    section.data(29).dtTransOffset = 53;

                    ;% gdactc41oo.Constant5_Value_dbc3r2jhlx
                    section.data(30).logicalSrcIdx = 31;
                    section.data(30).dtTransOffset = 55;

                    ;% gdactc41oo.AngleOffsets_Value
                    section.data(31).logicalSrcIdx = 32;
                    section.data(31).dtTransOffset = 57;

                    ;% gdactc41oo.Gain1_Gain_kz244j3cwy
                    section.data(32).logicalSrcIdx = 33;
                    section.data(32).dtTransOffset = 62;

                    ;% gdactc41oo.y_Value
                    section.data(33).logicalSrcIdx = 34;
                    section.data(33).dtTransOffset = 63;

                    ;% gdactc41oo.x_Value
                    section.data(34).logicalSrcIdx = 35;
                    section.data(34).dtTransOffset = 64;

                    ;% gdactc41oo.z_Value
                    section.data(35).logicalSrcIdx = 36;
                    section.data(35).dtTransOffset = 65;

                    ;% gdactc41oo.linkoffset_Value
                    section.data(36).logicalSrcIdx = 37;
                    section.data(36).dtTransOffset = 66;

                    ;% gdactc41oo.Constant1_Value_l0syhhr3qo
                    section.data(37).logicalSrcIdx = 38;
                    section.data(37).dtTransOffset = 67;

                    ;% gdactc41oo.Constant2_Value_ndb45e0il0
                    section.data(38).logicalSrcIdx = 39;
                    section.data(38).dtTransOffset = 68;

                    ;% gdactc41oo.Constant3_Value_mko2xvybz1
                    section.data(39).logicalSrcIdx = 40;
                    section.data(39).dtTransOffset = 69;

                    ;% gdactc41oo.Constant4_Value_cdn4ejs4cy
                    section.data(40).logicalSrcIdx = 41;
                    section.data(40).dtTransOffset = 70;

                    ;% gdactc41oo.Constant_Value_ekzteqkvd4
                    section.data(41).logicalSrcIdx = 42;
                    section.data(41).dtTransOffset = 71;

                    ;% gdactc41oo.Gain_Gain
                    section.data(42).logicalSrcIdx = 43;
                    section.data(42).dtTransOffset = 72;

                    ;% gdactc41oo.TmpRTBAtMATLABFunctionInport5_I
                    section.data(43).logicalSrcIdx = 44;
                    section.data(43).dtTransOffset = 73;

                    ;% gdactc41oo.TmpRTBAtMATLABFunctionInport6_I
                    section.data(44).logicalSrcIdx = 45;
                    section.data(44).dtTransOffset = 74;

                    ;% gdactc41oo.Grippper_Value
                    section.data(45).logicalSrcIdx = 46;
                    section.data(45).dtTransOffset = 75;

                    ;% gdactc41oo.Constant5_Value_ht10l3yzwb
                    section.data(46).logicalSrcIdx = 47;
                    section.data(46).dtTransOffset = 76;

                    ;% gdactc41oo.Constant6_Value_i1lh4bx0q2
                    section.data(47).logicalSrcIdx = 48;
                    section.data(47).dtTransOffset = 77;

                    ;% gdactc41oo.TransportDelay_Delay
                    section.data(48).logicalSrcIdx = 49;
                    section.data(48).dtTransOffset = 78;

                    ;% gdactc41oo.TransportDelay_InitOutput
                    section.data(49).logicalSrcIdx = 50;
                    section.data(49).dtTransOffset = 79;

                    ;% gdactc41oo.TransportDelay1_Delay
                    section.data(50).logicalSrcIdx = 51;
                    section.data(50).dtTransOffset = 80;

                    ;% gdactc41oo.TransportDelay1_InitOutput
                    section.data(51).logicalSrcIdx = 52;
                    section.data(51).dtTransOffset = 81;

                    ;% gdactc41oo.TransportDelay2_Delay
                    section.data(52).logicalSrcIdx = 53;
                    section.data(52).dtTransOffset = 82;

                    ;% gdactc41oo.TransportDelay2_InitOutput
                    section.data(53).logicalSrcIdx = 54;
                    section.data(53).dtTransOffset = 83;

                    ;% gdactc41oo.TransportDelay3_Delay
                    section.data(54).logicalSrcIdx = 55;
                    section.data(54).dtTransOffset = 84;

                    ;% gdactc41oo.TransportDelay3_InitOutput
                    section.data(55).logicalSrcIdx = 56;
                    section.data(55).dtTransOffset = 85;

                    ;% gdactc41oo.armMoves_Value
                    section.data(56).logicalSrcIdx = 57;
                    section.data(56).dtTransOffset = 86;

                    ;% gdactc41oo.TIM_Value
                    section.data(57).logicalSrcIdx = 58;
                    section.data(57).dtTransOffset = 87;

                    ;% gdactc41oo.Constant5_Value_plp2fa3e20
                    section.data(58).logicalSrcIdx = 59;
                    section.data(58).dtTransOffset = 90;

                    ;% gdactc41oo.Constant6_Value_feq0mqtkvh
                    section.data(59).logicalSrcIdx = 60;
                    section.data(59).dtTransOffset = 91;

                    ;% gdactc41oo.TransportDelay_Delay_epsxa5yibs
                    section.data(60).logicalSrcIdx = 61;
                    section.data(60).dtTransOffset = 92;

                    ;% gdactc41oo.TransportDelay_InitO_euqepslcnt
                    section.data(61).logicalSrcIdx = 62;
                    section.data(61).dtTransOffset = 93;

                    ;% gdactc41oo.TransportDelay1_Dela_muuoion0vc
                    section.data(62).logicalSrcIdx = 63;
                    section.data(62).dtTransOffset = 94;

                    ;% gdactc41oo.TransportDelay1_Init_jibi3r2clc
                    section.data(63).logicalSrcIdx = 64;
                    section.data(63).dtTransOffset = 95;

                    ;% gdactc41oo.TransportDelay2_Dela_gqrcdf1eww
                    section.data(64).logicalSrcIdx = 65;
                    section.data(64).dtTransOffset = 96;

                    ;% gdactc41oo.TransportDelay2_Init_ctlmx5jait
                    section.data(65).logicalSrcIdx = 66;
                    section.data(65).dtTransOffset = 97;

                    ;% gdactc41oo.TransportDelay3_Dela_mz1f0zbgyc
                    section.data(66).logicalSrcIdx = 67;
                    section.data(66).dtTransOffset = 98;

                    ;% gdactc41oo.TransportDelay3_Init_nzueti0ljy
                    section.data(67).logicalSrcIdx = 68;
                    section.data(67).dtTransOffset = 99;

                    ;% gdactc41oo.Constant1_Value_pwhe0gw213
                    section.data(68).logicalSrcIdx = 69;
                    section.data(68).dtTransOffset = 100;

                    ;% gdactc41oo.Constant2_Value_ejoqpgv2ji
                    section.data(69).logicalSrcIdx = 70;
                    section.data(69).dtTransOffset = 101;

                    ;% gdactc41oo.Constant3_Value_lcleawr1lx
                    section.data(70).logicalSrcIdx = 71;
                    section.data(70).dtTransOffset = 102;

                    ;% gdactc41oo.Constant4_Value_mwwrewolew
                    section.data(71).logicalSrcIdx = 72;
                    section.data(71).dtTransOffset = 103;

                    ;% gdactc41oo.Constant_Value_bnaip2qh1m
                    section.data(72).logicalSrcIdx = 73;
                    section.data(72).dtTransOffset = 104;

                    ;% gdactc41oo.Gain_Gain_hc0pt5w5zy
                    section.data(73).logicalSrcIdx = 74;
                    section.data(73).dtTransOffset = 105;

                    ;% gdactc41oo.q_angles_Gain
                    section.data(74).logicalSrcIdx = 75;
                    section.data(74).dtTransOffset = 106;

                    ;% gdactc41oo.Gain_Gain_lgvdfcmyx3
                    section.data(75).logicalSrcIdx = 76;
                    section.data(75).dtTransOffset = 107;

                    ;% gdactc41oo.Constant_Value_ln34bkcsep
                    section.data(76).logicalSrcIdx = 77;
                    section.data(76).dtTransOffset = 108;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% gdactc41oo.UDPSend_Port
                    section.data(1).logicalSrcIdx = 78;
                    section.data(1).dtTransOffset = 0;

                    ;% gdactc41oo.UDPReceive1_Port
                    section.data(2).logicalSrcIdx = 79;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section

            section.nData     = 8;
            section.data(8)  = dumData; %prealloc

                    ;% gdactc41oo.armStopped_Gain
                    section.data(1).logicalSrcIdx = 80;
                    section.data(1).dtTransOffset = 0;

                    ;% gdactc41oo.ManualSwitch1_CurrentSetting
                    section.data(2).logicalSrcIdx = 81;
                    section.data(2).dtTransOffset = 1;

                    ;% gdactc41oo.Manual1_CurrentSetting
                    section.data(3).logicalSrcIdx = 82;
                    section.data(3).dtTransOffset = 2;

                    ;% gdactc41oo.Manual2_CurrentSetting
                    section.data(4).logicalSrcIdx = 83;
                    section.data(4).dtTransOffset = 3;

                    ;% gdactc41oo.Manual3_CurrentSetting
                    section.data(5).logicalSrcIdx = 84;
                    section.data(5).dtTransOffset = 4;

                    ;% gdactc41oo.Manual4_CurrentSetting
                    section.data(6).logicalSrcIdx = 85;
                    section.data(6).dtTransOffset = 5;

                    ;% gdactc41oo.ManualSwitch_CurrentSetting
                    section.data(7).logicalSrcIdx = 86;
                    section.data(7).dtTransOffset = 6;

                    ;% gdactc41oo.Manual2_CurrentSetti_lka4xuozuk
                    section.data(8).logicalSrcIdx = 87;
                    section.data(8).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            paramMap.sections(4) = section;
            clear section

            section.nData     = 20;
            section.data(20)  = dumData; %prealloc

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator_BitMask
                    section.data(1).logicalSrcIdx = 88;
                    section.data(1).dtTransOffset = 0;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator1_BitMask
                    section.data(2).logicalSrcIdx = 89;
                    section.data(2).dtTransOffset = 1;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator10_BitMask
                    section.data(3).logicalSrcIdx = 90;
                    section.data(3).dtTransOffset = 2;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator11_BitMask
                    section.data(4).logicalSrcIdx = 91;
                    section.data(4).dtTransOffset = 3;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator2_BitMask
                    section.data(5).logicalSrcIdx = 92;
                    section.data(5).dtTransOffset = 4;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator3_BitMask
                    section.data(6).logicalSrcIdx = 93;
                    section.data(6).dtTransOffset = 5;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator4_BitMask
                    section.data(7).logicalSrcIdx = 94;
                    section.data(7).dtTransOffset = 6;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator5_BitMask
                    section.data(8).logicalSrcIdx = 95;
                    section.data(8).dtTransOffset = 7;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator6_BitMask
                    section.data(9).logicalSrcIdx = 96;
                    section.data(9).dtTransOffset = 8;

                    ;% gdactc41oo.jywuzvjfs1b.BitwiseOperator8_BitMask
                    section.data(10).logicalSrcIdx = 97;
                    section.data(10).dtTransOffset = 9;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant1_const
                    section.data(11).logicalSrcIdx = 98;
                    section.data(11).dtTransOffset = 10;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant11_const
                    section.data(12).logicalSrcIdx = 99;
                    section.data(12).dtTransOffset = 11;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant12_const
                    section.data(13).logicalSrcIdx = 100;
                    section.data(13).dtTransOffset = 12;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant2_const
                    section.data(14).logicalSrcIdx = 101;
                    section.data(14).dtTransOffset = 13;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant3_const
                    section.data(15).logicalSrcIdx = 102;
                    section.data(15).dtTransOffset = 14;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant4_const
                    section.data(16).logicalSrcIdx = 103;
                    section.data(16).dtTransOffset = 15;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant5_const
                    section.data(17).logicalSrcIdx = 104;
                    section.data(17).dtTransOffset = 16;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant6_const
                    section.data(18).logicalSrcIdx = 105;
                    section.data(18).dtTransOffset = 17;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant7_const
                    section.data(19).logicalSrcIdx = 106;
                    section.data(19).dtTransOffset = 18;

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant9_const
                    section.data(20).logicalSrcIdx = 107;
                    section.data(20).dtTransOffset = 19;

            nTotData = nTotData + section.nData;
            paramMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% gdactc41oo.jywuzvjfs1b.CompareToConstant_const
                    section.data(1).logicalSrcIdx = 108;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(6) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% gdactc41oo.jywuzvjfs1b.Constant_Value
                    section.data(1).logicalSrcIdx = 109;
                    section.data(1).dtTransOffset = 0;

                    ;% gdactc41oo.jywuzvjfs1b.Gain_Gain
                    section.data(2).logicalSrcIdx = 110;
                    section.data(2).dtTransOffset = 1;

                    ;% gdactc41oo.jywuzvjfs1b.Gain1_Gain
                    section.data(3).logicalSrcIdx = 111;
                    section.data(3).dtTransOffset = 2;

                    ;% gdactc41oo.jywuzvjfs1b.Gain2_Gain
                    section.data(4).logicalSrcIdx = 112;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            paramMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% gdactc41oo.jywuzvjfs1b.UDPReceive_Port
                    section.data(1).logicalSrcIdx = 113;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(8) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 15;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (bsw1rym1ozn)
        ;%
            section.nData     = 24;
            section.data(24)  = dumData; %prealloc

                    ;% bsw1rym1ozn.fr3jsaah4w
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% bsw1rym1ozn.nc3xco1ddz
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% bsw1rym1ozn.ckwsf1c3dq
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% bsw1rym1ozn.hcefxkke2t
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% bsw1rym1ozn.j5ey2uf3ci
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 8;

                    ;% bsw1rym1ozn.h5ciax2eh2
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 13;

                    ;% bsw1rym1ozn.aoj2wrqsxb
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 14;

                    ;% bsw1rym1ozn.d1uequfayr
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 19;

                    ;% bsw1rym1ozn.ew5nkgcbiw
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 24;

                    ;% bsw1rym1ozn.ahem1qxylb
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 27;

                    ;% bsw1rym1ozn.nn5aqkty2z
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 43;

                    ;% bsw1rym1ozn.i55rf11wpm
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 105;

                    ;% bsw1rym1ozn.pakydbv4tt
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 110;

                    ;% bsw1rym1ozn.f3p2ychfz5
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 115;

                    ;% bsw1rym1ozn.nwebwgmrx1
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 120;

                    ;% bsw1rym1ozn.frhhxkfplq
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 123;

                    ;% bsw1rym1ozn.i12x3x2zpw
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 126;

                    ;% bsw1rym1ozn.ekrpqcunri
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 127;

                    ;% bsw1rym1ozn.os4iei1obw
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 189;

                    ;% bsw1rym1ozn.nm4ovrj4tn
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 190;

                    ;% bsw1rym1ozn.gh4ncawy4o
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 191;

                    ;% bsw1rym1ozn.daf1o5x5bh
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 192;

                    ;% bsw1rym1ozn.g1z1nbmsgn
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 193;

                    ;% bsw1rym1ozn.gqevhuhjcp
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 194;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% bsw1rym1ozn.ox04emirgr
                    section.data(1).logicalSrcIdx = 24;
                    section.data(1).dtTransOffset = 0;

                    ;% bsw1rym1ozn.hyfnrzdedh
                    section.data(2).logicalSrcIdx = 25;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% bsw1rym1ozn.ozzkvinen1
                    section.data(1).logicalSrcIdx = 26;
                    section.data(1).dtTransOffset = 0;

                    ;% bsw1rym1ozn.jbkduoyr45
                    section.data(2).logicalSrcIdx = 27;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% bsw1rym1ozn.mt1nlfcvai
                    section.data(1).logicalSrcIdx = 28;
                    section.data(1).dtTransOffset = 0;

                    ;% bsw1rym1ozn.ekrpqcunriy
                    section.data(2).logicalSrcIdx = 29;
                    section.data(2).dtTransOffset = 554;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% bsw1rym1ozn.owvij4ih5g.dsllwyo2vi
                    section.data(1).logicalSrcIdx = 30;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% bsw1rym1ozn.nrq2bqyndg.dsllwyo2vi
                    section.data(1).logicalSrcIdx = 31;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% bsw1rym1ozn.l2gpd4g0af.dsllwyo2vi
                    section.data(1).logicalSrcIdx = 32;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% bsw1rym1ozn.jwa5svs5uz.dsllwyo2vi
                    section.data(1).logicalSrcIdx = 33;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(8) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% bsw1rym1ozn.jp2bcbkw50.dsllwyo2vi
                    section.data(1).logicalSrcIdx = 34;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% bsw1rym1ozn.atiep1e4mgg.dsllwyo2vi
                    section.data(1).logicalSrcIdx = 35;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(10) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% bsw1rym1ozn.ig20ky352e.flimyxfmfa
                    section.data(1).logicalSrcIdx = 36;
                    section.data(1).dtTransOffset = 0;

                    ;% bsw1rym1ozn.ig20ky352e.phyabtgdfl
                    section.data(2).logicalSrcIdx = 37;
                    section.data(2).dtTransOffset = 1;

                    ;% bsw1rym1ozn.ig20ky352e.khw5bxdol4
                    section.data(3).logicalSrcIdx = 38;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            sigMap.sections(11) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% bsw1rym1ozn.lsagyhgyj3.flimyxfmfa
                    section.data(1).logicalSrcIdx = 39;
                    section.data(1).dtTransOffset = 0;

                    ;% bsw1rym1ozn.lsagyhgyj3.phyabtgdfl
                    section.data(2).logicalSrcIdx = 40;
                    section.data(2).dtTransOffset = 1;

                    ;% bsw1rym1ozn.lsagyhgyj3.khw5bxdol4
                    section.data(3).logicalSrcIdx = 41;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            sigMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% bsw1rym1ozn.jywuzvjfs1b.hxbxomd51w
                    section.data(1).logicalSrcIdx = 42;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(13) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% bsw1rym1ozn.jywuzvjfs1b.mgfmwkusfa
                    section.data(1).logicalSrcIdx = 43;
                    section.data(1).dtTransOffset = 0;

                    ;% bsw1rym1ozn.jywuzvjfs1b.ekrpqcunri
                    section.data(2).logicalSrcIdx = 44;
                    section.data(2).dtTransOffset = 9;

            nTotData = nTotData + section.nData;
            sigMap.sections(14) = section;
            clear section

            section.nData     = 10;
            section.data(10)  = dumData; %prealloc

                    ;% bsw1rym1ozn.jywuzvjfs1b.fa2yquewpl
                    section.data(1).logicalSrcIdx = 45;
                    section.data(1).dtTransOffset = 0;

                    ;% bsw1rym1ozn.jywuzvjfs1b.nft2hrbfgy
                    section.data(2).logicalSrcIdx = 46;
                    section.data(2).dtTransOffset = 1;

                    ;% bsw1rym1ozn.jywuzvjfs1b.ltuiw5aypr
                    section.data(3).logicalSrcIdx = 47;
                    section.data(3).dtTransOffset = 2;

                    ;% bsw1rym1ozn.jywuzvjfs1b.mhqchbezow
                    section.data(4).logicalSrcIdx = 48;
                    section.data(4).dtTransOffset = 3;

                    ;% bsw1rym1ozn.jywuzvjfs1b.jqhzzzhcru
                    section.data(5).logicalSrcIdx = 49;
                    section.data(5).dtTransOffset = 4;

                    ;% bsw1rym1ozn.jywuzvjfs1b.lytytl4rfo
                    section.data(6).logicalSrcIdx = 50;
                    section.data(6).dtTransOffset = 5;

                    ;% bsw1rym1ozn.jywuzvjfs1b.ala00fdawp
                    section.data(7).logicalSrcIdx = 51;
                    section.data(7).dtTransOffset = 6;

                    ;% bsw1rym1ozn.jywuzvjfs1b.bxrkfndset
                    section.data(8).logicalSrcIdx = 52;
                    section.data(8).dtTransOffset = 7;

                    ;% bsw1rym1ozn.jywuzvjfs1b.f1ly52hyv4
                    section.data(9).logicalSrcIdx = 53;
                    section.data(9).dtTransOffset = 8;

                    ;% bsw1rym1ozn.jywuzvjfs1b.kz5xhsvmba
                    section.data(10).logicalSrcIdx = 54;
                    section.data(10).dtTransOffset = 9;

            nTotData = nTotData + section.nData;
            sigMap.sections(15) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 7;
        sectIdxOffset = 15;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (lnzta3sxbyy)
        ;%
            section.nData     = 14;
            section.data(14)  = dumData; %prealloc

                    ;% lnzta3sxbyy.gmtg232s4a
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% lnzta3sxbyy.hjkyoofgsn
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% lnzta3sxbyy.msywirdbb4
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 10;

                    ;% lnzta3sxbyy.bfdqy4yii2
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 147;

                    ;% lnzta3sxbyy.bdt2ezbqlo
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 284;

                    ;% lnzta3sxbyy.lddvwm1xlu
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 421;

                    ;% lnzta3sxbyy.pw2hpbvjma.modelTStart
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 558;

                    ;% lnzta3sxbyy.azpchxen5t.modelTStart
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 559;

                    ;% lnzta3sxbyy.alandz3rsj.modelTStart
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 560;

                    ;% lnzta3sxbyy.a4v2nkjsgq.modelTStart
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 561;

                    ;% lnzta3sxbyy.ioaebkl4c1.modelTStart
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 562;

                    ;% lnzta3sxbyy.dmpbvwz1sz.modelTStart
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 563;

                    ;% lnzta3sxbyy.j52xctdba1.modelTStart
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 564;

                    ;% lnzta3sxbyy.c0b4w1os3a.modelTStart
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 565;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 11;
            section.data(11)  = dumData; %prealloc

                    ;% lnzta3sxbyy.bjnxil4clo.TUbufferPtrs
                    section.data(1).logicalSrcIdx = 14;
                    section.data(1).dtTransOffset = 0;

                    ;% lnzta3sxbyy.bfcurlum0n.TUbufferPtrs
                    section.data(2).logicalSrcIdx = 15;
                    section.data(2).dtTransOffset = 2;

                    ;% lnzta3sxbyy.agy5wpgdjz.TUbufferPtrs
                    section.data(3).logicalSrcIdx = 16;
                    section.data(3).dtTransOffset = 4;

                    ;% lnzta3sxbyy.lqa21nu01c.TUbufferPtrs
                    section.data(4).logicalSrcIdx = 17;
                    section.data(4).dtTransOffset = 6;

                    ;% lnzta3sxbyy.agvxw3evlt.TUbufferPtrs
                    section.data(5).logicalSrcIdx = 18;
                    section.data(5).dtTransOffset = 8;

                    ;% lnzta3sxbyy.c3vsadjgdg.TUbufferPtrs
                    section.data(6).logicalSrcIdx = 19;
                    section.data(6).dtTransOffset = 10;

                    ;% lnzta3sxbyy.b43mjc15il.TUbufferPtrs
                    section.data(7).logicalSrcIdx = 20;
                    section.data(7).dtTransOffset = 12;

                    ;% lnzta3sxbyy.esicqw45wj.TUbufferPtrs
                    section.data(8).logicalSrcIdx = 21;
                    section.data(8).dtTransOffset = 14;

                    ;% lnzta3sxbyy.hqmmoba1br.LoggedData
                    section.data(9).logicalSrcIdx = 22;
                    section.data(9).dtTransOffset = 16;

                    ;% lnzta3sxbyy.nr1p4es3cl.LoggedData
                    section.data(10).logicalSrcIdx = 23;
                    section.data(10).dtTransOffset = 17;

                    ;% lnzta3sxbyy.n02lmzyek3.LoggedData
                    section.data(11).logicalSrcIdx = 24;
                    section.data(11).dtTransOffset = 18;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% lnzta3sxbyy.m4awglybyf
                    section.data(1).logicalSrcIdx = 25;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 8;
            section.data(8)  = dumData; %prealloc

                    ;% lnzta3sxbyy.hbewzqprs1.Tail
                    section.data(1).logicalSrcIdx = 26;
                    section.data(1).dtTransOffset = 0;

                    ;% lnzta3sxbyy.my5qf3xmun.Tail
                    section.data(2).logicalSrcIdx = 27;
                    section.data(2).dtTransOffset = 1;

                    ;% lnzta3sxbyy.o0eldui1qa.Tail
                    section.data(3).logicalSrcIdx = 28;
                    section.data(3).dtTransOffset = 2;

                    ;% lnzta3sxbyy.otkhfn5ukf.Tail
                    section.data(4).logicalSrcIdx = 29;
                    section.data(4).dtTransOffset = 3;

                    ;% lnzta3sxbyy.garnkbeajs.Tail
                    section.data(5).logicalSrcIdx = 30;
                    section.data(5).dtTransOffset = 4;

                    ;% lnzta3sxbyy.cmomknl4zg.Tail
                    section.data(6).logicalSrcIdx = 31;
                    section.data(6).dtTransOffset = 5;

                    ;% lnzta3sxbyy.hfosdrtyd3.Tail
                    section.data(7).logicalSrcIdx = 32;
                    section.data(7).dtTransOffset = 6;

                    ;% lnzta3sxbyy.aujiryohb3.Tail
                    section.data(8).logicalSrcIdx = 33;
                    section.data(8).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% lnzta3sxbyy.phnuwliwxt
                    section.data(1).logicalSrcIdx = 34;
                    section.data(1).dtTransOffset = 0;

                    ;% lnzta3sxbyy.ozva33uhts
                    section.data(2).logicalSrcIdx = 35;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% lnzta3sxbyy.jywuzvjfs1b.ilqy1smwes
                    section.data(1).logicalSrcIdx = 36;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% lnzta3sxbyy.jywuzvjfs1b.l4qpti4xvl
                    section.data(1).logicalSrcIdx = 37;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 402920179;
    targMap.checksum1 = 1861796376;
    targMap.checksum2 = 2915443079;
    targMap.checksum3 = 620932328;

