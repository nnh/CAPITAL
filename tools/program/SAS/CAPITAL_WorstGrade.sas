**************************************************************************
Program : CAPITAL_WorstGrade.sas
Study : NMC-CAPITAL
Published : 2019-11-22
Author : Kato Kiroku
Version : 20.02.07.003
**************************************************************************;

libname libmacro "C:\Users\KirokuKato\Documents\SAS\mymacros";
options mstored sasmstore=libmacro;

%FIND_CURDIR;
%let pardir=%substr(&curdir, 1, %length(&curdir) - %length(%scan(&curdir, -1, '\'))
                                                                          - %length(%scan(&curdir, -2, '\'))
                                                                          - %length(%scan(&curdir, -3, '\'))
                                                                          - 3);
%put &pardir;
%let raw=&pardir.\tools\input\rawdata;
%let out=&pardir.\tools\output\SAS;

%READ_CSV(&raw);


%macro ARRANGE_DS_a;

    %global list_a;
    %let list_a=;
    %do i=1 %to 20;
        %let ds=Capital_c&i._a_200203_1143;
        %if %sysfunc(exist(work.&ds)) %then %do;
            data Capital_c&i._a_200203_1143;
                set Capital_c&i._a_200203_1143;
                label VAR1='�V�[�g���p�����ʖ�'
                        VAR2='�쐬��'
                        VAR8='�o�^�R�[�h'
                        VAR9='�Ǘ�o�^�ԍ�'
                        VAR17='���������o�j���[���p�`�['
                        VAR19='����������'
                        VAR21='�D����������'
                        VAR23='�n��'
                        VAR25='��������'
                        VAR27='���M���D��������'
                        VAR29='��J'
                        VAR31='�ؓ���'
                        VAR33='�֐ߒ�'
                        VAR35='�l������';
                keep VAR1 VAR2 VAR8 VAR9 VAR17 VAR19 VAR21 VAR23 VAR25 VAR27 VAR29 VAR31 VAR33 VAR35;
            run;
            proc sort data=Capital_c&i._a_200203_1143 sortseq=linguistic(Numeric_Collation=ON);
                by VAR1 VAR9;
            run;
            %if &list_a= %then %let list_a=&ds;
            %else %let list_a=%sysfunc(catx(%quote( ), &list_a, &ds));
        %end;
    %end;
    %put &list_a;
 
%mend ARRANGE_DS_a;

%ARRANGE_DS_a;
data Worst_Gradeoutput_1a;
    set &list_a;
    date=input(VAR2, yymmdd10.);
run;
data Worst_Gradeoutput_1a;
    set Worst_Gradeoutput_1a;
    where date <= '30NOV2019'd;
    drop date;
run;
%ds2csv(data=Worst_Gradeoutput_1a, runmode=b, csvfile=&out.\Worst_Gradeoutput_1a.csv);

%macro ARRANGE_DS_b;

    %global list_b;
    %let list_b=;
    %do i=1 %to 6;
        %let ds=Capital_c&i._b_200203_1143;
        %if %sysfunc(exist(work.&ds)) %then %do;
            data Capital_c&i._b_200203_1143;
                set Capital_c&i._b_200203_1143;
                label VAR1='�V�[�g���p�����ʖ�'
                        VAR2='�쐬��'
                        VAR8='�o�^�R�[�h'
                        VAR9='�Ǘ�o�^�ԍ�'
                        VAR27='���������o�j���[���p�`�['
                        VAR29='����������'
                        VAR31='�D����������'
                        VAR33='�n��'
                        VAR35='��������'
                        VAR37='���M���D��������'
                        VAR39='��J'
                        VAR41='�ؓ���'
                        VAR43='�֐ߒ�'
                        VAR45='�l������';
                keep VAR1 VAR2 VAR8 VAR9 VAR27 VAR29 VAR31 VAR33 VAR35 VAR37 VAR39 VAR41 VAR43 VAR45;
            run;
            proc sort data=Capital_c&i._b_200203_1143 sortseq=linguistic(Numeric_Collation=ON);
                by VAR1 VAR9;
            run;
            %if &list_b= %then %let list_b=&ds;
            %else %let list_b=%sysfunc(catx(%quote( ), &list_b, &ds));
        %end;
    %end;
    %do i=7 %to 20;
        %let ds=Capital_c&i._b_200203_1143;
        %if %sysfunc(exist(work.&ds)) %then %do;
            data Capital_c&i._b_200203_1143;
                set Capital_c&i._b_200203_1143;
                label VAR1='�V�[�g���p�����ʖ�'
                        VAR2='�쐬��'
                        VAR8='�o�^�R�[�h'
                        VAR9='�Ǘ�o�^�ԍ�'
                        VAR25='���������o�j���[���p�`�['
                        VAR27='����������'
                        VAR29='�D����������'
                        VAR31='�n��'
                        VAR33='��������'
                        VAR35='���M���D��������'
                        VAR37='��J'
                        VAR39='�ؓ���'
                        VAR41='�֐ߒ�'
                        VAR43='�l������';
                keep VAR1 VAR2 VAR8 VAR9 VAR25 VAR27 VAR29 VAR31 VAR33 VAR35 VAR37 VAR39 VAR41 VAR43;
                rename VAR43=VAR45
                            VAR41=VAR43
                            VAR39=VAR41
                            VAR37=VAR39
                            VAR35=VAR37
                            VAR33=VAR35
                            VAR31=VAR33
                            VAR29=VAR31
                            VAR27=VAR29
                            VAR25=VAR27;
            run;
            proc sort data=Capital_c&i._b_200203_1143 sortseq=linguistic(Numeric_Collation=ON);
                by VAR1 VAR9;
            run;
            %let list_b=%sysfunc(catx(%quote( ), &list_b, &ds));
        %end;
    %end;
    %put &list_b;
 
%mend ARRANGE_DS_b;

%ARRANGE_DS_b;
data Worst_Gradeoutput_1b;
    set &list_b;
    date=input(VAR2, yymmdd10.);
run;
data Worst_Gradeoutput_1b;
    set Worst_Gradeoutput_1b;
    where date <= '30NOV2019'd;
    drop date;
run;
%ds2csv(data=Worst_Gradeoutput_1b, runmode=b, csvfile=&out.\Worst_Gradeoutput_1b.csv);


%macro ARRANGE_DS_2 (ds);

    %if &ds=a %then %let loop=VAR17 VAR19 VAR21 VAR23 VAR25 VAR27 VAR29 VAR31 VAR33 VAR35;
    %else %let loop=VAR27 VAR29 VAR31 VAR33 VAR35 VAR37 VAR39 VAR41 VAR43 VAR45;
    data Worst_gradeoutput_2&ds;
        set Worst_gradeoutput_1&ds;
        if "&ds"="a" then VAR1='A�Q';
        else VAR1='B�Q';
        %do i=1 %to %sysfunc(countw(&loop));
            %let c=%scan(&loop, &i);
            &c=scan(&c, -1, '-');
        %end;
        label VAR1='�Q';
        keep VAR1 VAR9 &loop;
    run;
    %do i=1 %to %sysfunc(countw(&loop));
        %let c=%scan(&loop, &i);
        proc sort data=Worst_gradeoutput_2&ds;
            by VAR9 descending &c;
        run;
        data Worst_gradeoutput_2&ds;
            set Worst_gradeoutput_2&ds;
            by VAR9;
            retain &c._max;
            if first.VAR9 then &c._max=&c;
            &c=&c._max;
        run;
        data Worst_gradeoutput_2&ds._add;
            set Worst_gradeoutput_2&ds;
            by VAR9;
            if first.VAR9;
            keep VAR1 VAR9 &loop;
        run;
        proc sort data=Worst_gradeoutput_2&ds._add sortseq=linguistic(Numeric_Collation=ON);
            by VAR9;
        run;
    %end;
    %ds2csv(data=Worst_gradeoutput_2&ds._add, runmode=b, csvfile=&out.\Worst_gradeoutput_2&ds..csv);

%mend ARRANGE_DS_2;

%ARRANGE_DS_2 (a);
%ARRANGE_DS_2 (b);


%macro ARRANGE_DS_3 (ds);

    %global loop;
    %if &ds=a %then %let loop=VAR17 VAR19 VAR21 VAR23 VAR25 VAR27 VAR29 VAR31 VAR33 VAR35;
    %else %let loop=VAR27 VAR29 VAR31 VAR33 VAR35 VAR37 VAR39 VAR41 VAR43 VAR45;
    %do i=1 %to %sysfunc(countw(&loop));
        %let c=%scan(&loop, &i);
        proc freq data=Worst_gradeoutput_2&ds._add noprint;
            table &c / out=temp;
        run;
        data temp;
            set temp;
            &c=cats('grade', &c);
            num=_N_;
        run;
        proc transpose data=temp out=temp_2;
            var count;
        run;
        proc transpose data=temp out=temp_label;
            var &c;
        run;
        data temp_label;
            set temp_label;
            call symputx('label', _LABEL_, 'G');
        run;
        %let nn3=0;
        %let nn4=0;
        proc sql noprint;
            select cats('COL', num, '=', &c)
                into : nn separated by ' '
                from temp;
            select count
                into : nn2 separated by ', '
                from temp;
            select count
                into : nn3 separated by ', '
                from temp
                where &c in ('grade3', 'grade4');
            select count
                into : nn4
                from temp
                where &c='grade4';
        quit;
        data &c;
            set temp_2;
            format pro_3_4 pro_4 percent7.1;
            pro_3_4=sum(&nn3) / sum(&nn2);
            pro_4=&nn4 / sum(&nn2);
            total=sum(&nn2);
            _LABEL_="&label";
            drop _NAME_;
            rename &nn;
        run;
    %end;

%mend ARRANGE_DS_3;

%ARRANGE_DS_3 (a);
data Worst_Gradeoutput_result_a;
    format _LABEL_ grade0 - grade4 pro_3_4 pro_4 total;
    set &loop;
    array change _numeric_;
        do over change;
            if missing(change) then change=0;
        end;
    label _LABEL_='�ϐ�' pro_3_4='grade3-4(%)' pro_4='grade4(%)' total='���v';
run;
%ds2csv(data=Worst_Gradeoutput_result_a, runmode=b, csvfile=&out.\Worst_Gradeoutput_result_a.csv);

%ARRANGE_DS_3 (b);
data Worst_Gradeoutput_result_b;
    format _LABEL_ grade0 - grade4 pro_3_4 pro_4 total;
    set &loop;
    array change _numeric_;
        do over change;
            if missing(change) then change=0;
        end;
    label _LABEL_='�ϐ�' pro_3_4='grade3-4(%)' pro_4='grade4(%)' total='���v';
run;
%ds2csv(data=Worst_Gradeoutput_result_b, runmode=b, csvfile=&out.\Worst_Gradeoutput_result_b.csv);
