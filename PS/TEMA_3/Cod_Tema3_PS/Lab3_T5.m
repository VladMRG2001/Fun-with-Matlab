%TEMA 5(Modelul simplu al unui instrument muzical)

clear all;
close all;

%A

%Testarea sunetelor deja predefinite 
%[y0,n0,Y0,f0,yp0] = musical_tones(0,'',1); %valoarea default -0.95
%[y1,n1,Y1,f1,yp1] = musical_tones(1,-0.95,1);
%[y2,n2,Y2,f2,yp2] = musical_tones(2,-0.95,1);
%[y3,n3,Y3,f3,yp3] = musical_tones(3,-0.95,1);
%[y4,n4,Y4,f4,yp4] = musical_tones(4,-0.95,1);
%[y5,n5,Y5,f5,yp5] = musical_tones(5,-0.95,1);

%Numarul A reprezinta numarul de sinusuri
%Varfurile se vad si in spectru in graficul DFT la magnitudine
%O sa afisez in pdf toate graficele cu polul implicit (-0.95)
%2*6 grafice

%B

%Polii si zerourile de la tema precedenta cu care lucrez acum
[poli1,zerouri1] = PS_Lab_3_Tema_4a(5,9) ;
[poli2,zerouri2] = PS_Lab_3_Tema_4b(5,9) ;

poli1abs(1:length(poli1))=abs(poli1); %val_abs a poli1
poli2abs(1:length(poli2))=abs(poli2); %val_abs a poli2
poli_abs=[poli1abs,poli2abs]; %val_abs a polilor

zerouri1abs(1:length(zerouri1))=abs(zerouri1); %val_abs a zerouri1
zerouri2abs(1:length(zerouri2))=abs(zerouri2); %val_abs a zerouri2
zerouri_abs=[zerouri1abs,zerouri2abs]; %val_abs a zerourilor

%Se vor testa polii cu abs(poli(i)) si -abs(poli(i))
%{
[y01,n01,Y01,f01,yp01] = musical_tones(0,poli_abs(1),1); %o val din poli
[y02,n02,Y02,f02,yp02] = musical_tones(0,-poli_abs(1),1); %negatia
%pt poli1abs(2) e tot la fel, pt ca e nr complex

[y03,n03,Y03,f03,yp03] = musical_tones(0,poli_abs(3),1); %o alta val
[y04,n04,Y04,f04,yp04] = musical_tones(0,-poli_abs(3),1); %negatia

[y05,n05,Y05,f05,yp05] = musical_tones(0,poli_abs(5),1); %o alta val
[y06,n06,Y06,f06,yp06] = musical_tones(0,-poli_abs(5),1); %negatia

%Diferenta se vede la grafice
%Se executa asa 
%}
 
%Acum modific functia din laborator
%Functia muzical_tones_editat este modificata astfel incat filtrul sa
%admita si zerouri;
%Apelarea: musical_tones_editat(instrument,zero,pol,draw), unde instrumentul este 0, adica user defined;

%[ya,na,Ya,fa,ypa] = musical_tones_editat(0,zerouri_abs(3),poli_abs(2),1);
%exemplu de rulare pt al 3-lea zerou si al 2-lea pol

%[yb,nb,Yb,fb,ypb] = musical_tones_editat(0,1,poli_abs(4),1);
%[yc,nc,Yc,fc,ypc] = musical_tones(0,poli_abs(4),1);
%Cele 2 instructiuni se observa ca sunt echivalente, astfel algoritmul
%modificat nu altereaza rezultatele originale

%Initial credeam ca este o problema, dar mai intai aapr graficele, apoi
%apare intrebarea daca vreau sa redau scunetul si abia apoi se updateaza
%variabilele pt zerouri si poli in workspace.


%loop pentru a testa toate combinatiile de zerouri si poli
%de tip +-abs(zerouri(i)) cu +-abs(poli(j)).
zerouri_abs_all=[zerouri_abs,-zerouri_abs]; %abs si -abs
poli_abs_all=[poli_abs,-poli_abs]; %abs si -abs
%{
for i=1:1:length(zerouri_abs_all)
    for j=1:1:length(poli_abs_all)
        musical_tones_editat(0,zerouri_abs_all(i),poli_abs_all(j),1);
    end
end
 %}    

%Exemplu concret cu toate combinatiile posibile de +-zero cu +-pol
%[y_1,n_1,Y_1,f_1,yp_1]=musical_tones_editat(0,zerouri_abs(1),poli_abs(2),1);
%[y_2,n_2,Y_2,f_2,yp_2]=musical_tones_editat(0,zerouri_abs(2),-poli_abs(3),1);
%[y_3,n_3,Y_3,f_3,yp_3]=musical_tones_editat(0,-zerouri_abs(3),poli_abs(4),1);
%[y_4,n_4,Y_4,f_4,yp_4]=musical_tones_editat(0,-zerouri_abs(4),-poli_abs(5),1);

%Se poate auzi si diferenta de sunet daca se asculta in difuzoare