%total of all the categories

as_total = 537;
bg_total = 450;
cars_total = 578;
cars_bg_total = 686;
faces_total = 225;
ms_total = 413;


%%%airplane_side precison and recall

as_tp = 521;
as_fp= 0.03* ms_total;
as_ic=as_total-as_tp;

as_precision = as_tp/(as_tp + as_fp);
as_recall = as_tp / (as_tp + as_ic);
as_fm= 2 / ( (1/as_precision) + (as_recall) );

%%%background precison and recall

bg_tp = 0.93 * bg_total;
bg_fp= 0.01 * as_total + 0.03 * cars_total + 0.01 * cars_bg_total + 0.02 * faces_total;
bg_ic=bg_total-bg_tp;

bg_precision = bg_tp/(bg_tp + bg_fp);
bg_recall = bg_tp / (bg_tp + bg_ic);
bg_fm= 2 / ( (1/bg_precision) + (bg_recall) );

%%%cars precison and recall

cars_tp = 0.99 * cars_total;
cars_fp=  0.01 * cars_bg_total;
cars_ic=cars_total-cars_tp;

cars_precision = cars_tp/(cars_tp +cars_fp);
cars_recall = cars_tp / (cars_tp + cars_ic);
cars_fm= 2 / ( (1/cars_precision) + (cars_recall) );

%%%cars_bg precison and recall

cars_bg_tp = 0.96 * cars_bg_total;
cars_bg_fp=  0.02 * as_total + 0.01 * cars_total + 0.01 * bg_total;
cars_bg_ic=cars_bg_total-cars_bg_tp;

cars_bg_precision = cars_bg_tp/(cars_bg_tp +cars_bg_fp);
cars_bg_recall = cars_bg_tp / (cars_bg_tp + cars_bg_ic);
cars_bg_fm= 2 / ( (1/cars_bg_precision) + (cars_bg_recall) );

%%%faces precison and recall

faces_tp = 0.98 * faces_total;
faces_fp=  0.01 * ms_total;
faces_ic=faces_total-faces_tp;

faces_precision = faces_tp/(faces_tp +faces_fp);
faces_recall = faces_tp / (faces_tp + faces_ic);
faces_fm= 2 / ( (1/faces_precision) + (faces_recall) );

%%%motorbike_side precison and recall

ms_tp = 0.94 * ms_total;
ms_fp=  0.03 * as_total + 0.02 * faces_total;
ms_ic=ms_total-ms_tp;

ms_precision = ms_tp/(ms_tp +ms_fp);
ms_recall = ms_tp / (ms_tp + ms_ic);
ms_fm= 2 / ( (1/ms_precision) + (ms_recall) );


%plotting of prescison

total_precision = [as_precision,bg_precision,cars_precision,cars_bg_precision,faces_precision,ms_precision];

x=[1,2,3,4,5,6];

figure;

str1={'Airplanes'};
str2={'Background'};
str3={'Cars'};
str4={'Cars','Background'};
str5={'Faces'};
str6={'Motorbike','Side'};


stem(x,total_precision);
hold on;
title('Precsion value of different categories');


text(0.9,1.01,str1);
text(1.9,0.96,str2);
text(2.9,1,str3);
text(3.9,1.01,str4);
text(4.9,1.01,str5);
text(5.9,1,str6);


ylabel('Value of precision')
xlabel('Categories')


%plotting of recall

total_precision = [as_recall,bg_recall,cars_recall,cars_bg_recall,faces_recall,ms_recall];

x=[1,2,3,4,5,6];

figure;

str1={'Airplanes'};
str2={'Background'};
str3={'Cars'};
str4={'Cars','Background'};
str5={'Faces'};
str6={'Motorbike','Side'};


stem(x,total_precision);
hold on;
title('Recall value of different categories');


text(0.9,1.01,str1);
text(1.9,0.96,str2);
text(2.9,1,str3);
text(3.9,1.01,str4);
text(4.9,1.01,str5);
text(5.9,1,str6);


ylabel('Value of Recall')
xlabel('Categories')

%plotting of Fmeasure

total_precision = [as_fm,bg_fm,cars_fm,cars_bg_fm,faces_fm,ms_fm];

x=[1,2,3,4,5,6];

figure;

str1={'Airplanes'};
str2={'Background'};
str3={'Cars'};
str4={'Cars','Background'};
str5={'Faces'};
str6={'Motorbike','Side'};


stem(x,total_precision);
hold on;
title('Fmeasure value of different categories');


text(0.9,1.1,str1);
text(1.9,1.1,str2);
text(2.9,1.1,str3);
text(3.9,1.1,str4);
text(4.9,1.1,str5);
text(5.9,1.1,str6);


ylabel('Value of Fmeasure')
xlabel('Categories')












