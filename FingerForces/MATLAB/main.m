%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                               
%% Finger Forces
%% #### -------------------------------------------------------------- ####
close all;
clear all;
clc;

%% Import Files
filename1 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_1.txt';
filename2 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_3.txt';
filename3 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_4.txt';
filename4 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_5.txt';
filename5 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_6.txt';
filename6 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_7.txt';
filename7 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_8.txt';
% filename8 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_9.txt';
filename9 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_10.txt';
filename10 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_11.txt';
filename11 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_12.txt';
filename12 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_15.txt';
filename13 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_16.txt';
filename14 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_17.txt';
filename15 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_18.txt';
% filename16 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_19.txt';
filename17 ='force_measurements/forceMeasurement_Only Flexion/FlexionOnly_1_20.txt';

filename21 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_1.txt';
%filename22 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_2.txt';
filename23 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_3.txt';
filename24 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_4.txt';
%filename25 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_5.txt';
filename26 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_6.txt';
filename27 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_7.txt';
filename28 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_8.txt';
filename29 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_9.txt';
filename30 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_10.txt';
filename31 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_11.txt';
filename32 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_12.txt';
filename33 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_13.txt';
filename34 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_14.txt';
filename35 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_15.txt';
filename36 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_16.txt';
filename37 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_17.txt';
filename38 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_18.txt';
filename39 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_19.txt';
filename40 ='force_measurements/ForceMeasurement_FullAbduction/FullAbduction_20.txt';



[pFlex1] = importData(filename1);
[pFlex2] = importData(filename2);
[pFlex3] = importData(filename3);
[pFlex4] = importData(filename4);
[pFlex5] = importData(filename5);
[pFlex6] = importData(filename6);
[pFlex7] = importData(filename7);
% [pFlex8] = importData(filename8);
[pFlex9] = importData(filename9);
[pFlex10] = importData(filename10);
[pFlex11] = importData(filename11);
[pFlex12] = importData(filename12);
[pFlex13] = importData(filename13);
[pFlex14] = importData(filename14);
[pFlex15] = importData(filename15);
% [pFlex16] = importData(filename16);
[pFlex17] = importData(filename17);

[pFlex21] = importData1(filename21);
%[pFlex22] = importData(filename22);
[pFlex23] = importData(filename23);
[pFlex24] = importData(filename24);
%[pFlex25] = importData(filename25);
[pFlex26] = importData(filename26);
[pFlex27] = importData2(filename27);
[pFlex28] = importData(filename28);
[pFlex29] = importData(filename29);
%[pFlex30] = importData(filename30);
[pFlex31] = importData3(filename31);
%[pFlex32] = importData(filename32);
[pFlex33] = importData1(filename33);
[pFlex34] = importData2(filename34);
[pFlex35] = importData2(filename35);
[pFlex36] = importData4(filename36);
[pFlex37] = importData1(filename37);
[pFlex38] = importData4(filename38);
[pFlex39] = importData(filename39);
%[pFlex40] = importData(filename40);

Flex = [pFlex1 pFlex2 pFlex3 pFlex4 pFlex5 pFlex6 pFlex7 pFlex9 pFlex10...
    pFlex11 pFlex12 pFlex13 pFlex14 pFlex15 pFlex17];
Flex = Flex-0.5;
xFlex = [(1:length(Flex))/185]';

[m,n] =size(Flex);
for j=1:n
    mFlex(j) = mean(Flex(370:1850,j));
end
MeanFlex = mean(mFlex);
xMeanFlex = [(length(Flex))/185 15]';
yMeanFlex = MeanFlex*ones(2,1);

Adduction = [pFlex21 pFlex23 pFlex24 pFlex26 pFlex27 pFlex28 pFlex29...
    pFlex31 pFlex33 pFlex34 pFlex35 pFlex36 pFlex37 pFlex38 pFlex39];
Adduction = Adduction+1;
xFlex = [(1:length(Adduction))/185]';

[o,p] =size(Adduction);
for j=1:p
    mAdduction(j) = mean(Adduction(430:1910,j));
end
MeanAdduction = mean(mAdduction);
xMeanAdduction = [(length(Adduction))/185 15]';
yMeanAdduction = MeanAdduction*ones(2,1);

figure (1)
h1 = plot(xMeanFlex, yMeanFlex, '--','LineWidth',2,'Color', [0.0 0.0 0.0]);
hold on
h2 = plot(xMeanAdduction, yMeanAdduction, '--','LineWidth',2,'Color', 'b');
hold on
h3 = shadedErrorBar(xFlex',Flex',{@mean,@std});
hold on
h4 = shadedErrorBar(xFlex',Adduction',{@mean,@std}, 'lineprops', '-b', 'patchSaturation',0.33);
legend([h1 h2],{'Mean Force - Flexion','Mean Force - Abduction'});
hold on
grid off; box on;
set(gca,'FontSize',26)
xlabel('Time [s]');ylabel('Force [N]');
print('-dpng','-r300','forceAnalysis')


% % Appendix - Finds time lag
% plot(pFlex21)
% hold on;
% plot(pFlex23)
% hold on;
% plot(pFlex24)
% hold on;
% plot(pFlex26)
% hold on;
% plot(pFlex27)
% hold on;
% plot(pFlex28)
% hold on;
% plot(pFlex29)
% hold on;
% plot(pFlex31)
% hold on;
% plot(pFlex33)
% hold on;
% plot(pFlex34)
% hold on;
% plot(pFlex35)
% hold on;
% plot(pFlex36)
% hold on;
% plot(pFlex37)
% hold on;
% plot(pFlex38)
% hold on;
% plot(pFlex39)
% hold on;
% legend()





