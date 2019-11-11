clc;clear all;


cd(['D:\Backup\code\sessiondata\GMM_cell_list'])
load(['cellTable_191015_final.mat']);


%%
win = 1000 ;% 1s 
step=100; %100ms
%% IT
D = [T.mouseLine,T.Session,T.cell_list];

% D_IT=D( T.Response == 1 & T.MouseType == '1',:); % Type 1 도 포함
D_IT=D(T.class == 2 & T.Response == 1 & T.MouseType == '1',:); % Type 2셀이면서 tagging 된 IT



for ii=1:size(D_IT,1)
    
cd('D:\Backup\code\Spike_matrix\Spike_data');
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_IT(ii,1))]);
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_IT(ii,1)),'\',char(D_IT(ii,2))]);

load(char(D_IT(ii,3)))

LL2=[];
RR2=[];

LL2=result(idx_LC,2001:12000);
RR2=result(idx_RC,2001:12000);


FR(ii)=mean([mean(mean(LL2(:,3001:7000)))*1000,mean(mean(RR2(:,3001:7000)))*1000]);

sl2(ii)=size(idx_LC,1);
sr2(ii)=size(idx_RC,1);

LL2(sl2(ii)+1:100,:)=-1;
RR2(sr2(ii)+1:100,:)=-1;

LL(ii,:,:)=LL2;
RR(ii,:,:)=RR2;

end



clc;clear;

cd D:\Backup\code\Decoding2\ITPT
save('IT','LL','RR','FR','sl2','sr2','-v7.3')

%% 0.5 이하
ff1=find(FR<0.5);

LL([ff1],:,:)=[];
RR([ff1],:,:)=[];
sl2([ff1])=[];
sr2([ff1])=[];
FR([ff1])=[];

%% 15 미만 제거
ii=25;
ff=find(sl2<ii);
ff2=find(sr2<ii);

LL([ff;ff2],:,:)=[];
RR([ff;ff2],:,:)=[];
sl2([ff;ff2])=[];
sr2([ff;ff2])=[];
FR([ff;ff2])=[];

%%

cd D:\Backup\code\Decoding2\ITPT
save('IT_FR5_25t','LL','RR','FR','sl2','sr2','-v7.3')

%%
ot=25;
%% std 확인
sl4=[];
cnt=1;
badcells=[];
for ii=1:size(LL,1)
    
    aa=[];
    aa=squeeze(LL(ii,:,:));
    
    tr=sl2(ii); %tr는 그셀의 트라이얼수 ii는 셀 인덱스
 
    for bin=1:81
        if std(mean(aa(1:tr,(bin-1)*100+501:(bin-1)*100+1500),2))<0.0001 |...
                length(find(mean(aa(1:tr,(bin-1)*100+501:(bin-1)*100+1500),2)==0)) >ot
            badcells(cnt,1)=ii;
            cnt=cnt+1;
            bad=1;
            break
        end
           
    end
    
    
end


LL(badcells,:,:)=[];
RR(badcells,:,:)=[];   
sl2(:,badcells)=[];
sr2(:,badcells)=[];




    %%
    cnt=1;
    badcells=[];
    for ii=1:size(RR,1)
        
        aa=[];
        aa=squeeze(RR(ii,:,:));
        
        tr=sr2(ii); %tr는 그셀의 트라이얼수 ii는 셀 인덱스
       
        
        for bin=1:81
            if std(mean(aa(1:tr,(bin-1)*100+501:(bin-1)*100+1500),2))<0.0001 |...
                     length(find(mean(aa(1:tr,(bin-1)*100+501:(bin-1)*100+1500),2)==0)) >ot
                badcells(cnt,1)=ii;
                cnt=cnt+1;
            
                break
            end
        end
    end
    
    LL(badcells,:,:)=[];
    RR(badcells,:,:)=[];
    sl2(badcells)=[];
    sr2(badcells)=[];
    
%%

clc;clear
cd D:\Backup\code\Decoding2\ITPT
load('IT_FR5_25t')


tt=25;
nn=15;
it=100;

[acc1]=fix_decoding_tag(LL,RR,sl2,sr2,it,tt,nn)

    bb=81;
    cc=[1 0.1 0.3]
fig1=decoding_figure2(acc1,it,bb,cc)



box off

set(gca,'XTickLabel',{-2:1:8}); % 축 지정하기
set(gca,'Box','off','TickDir','out','FontSize',11,'FontName','Arial');
set(gca,'FontSize',12,'FontName','Arial')



cd D:\Backup\code\Decoding2\ITPT
save('IT_FR5_15c_25t_100it','LL','RR','FR','sl2','sr2','acc1','-v7.3')






