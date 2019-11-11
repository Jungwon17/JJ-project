clc; clear all; 

%%


cd(['D:\Backup\code\sessiondata\GMM_cell_list'])
load(['cellTable_191015_final.mat']);

% Hello
% JJ meeting
% you can see my change



%%
win = 1000 ;% 1s 
step=100; %100ms
%% IT
D = [T.mouseLine,T.Session,T.cell_list];

% D_IT=D( T.Response == 1 & T.MouseType == '1',:); % Type 1 도 포함
D_IT=D(T.class == 2 & T.Response == 1 & T.MouseType == '1',:); % Type 2셀이면서 tagging 된 IT

%% IT


for ii=1:size(D_IT,1)
    
cd('D:\Backup\code\Spike_matrix\Spike_data');
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_IT(ii,1))]);
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_IT(ii,1)),'\',char(D_IT(ii,2))]);

load(char(D_IT(ii,3)))

LL=result(idx_LC,:);

for i=1:111
L_FR(i)=sum(sum(LL(:,step*(i-1)+(1000-(win/2)+1):step*(i-1)+(1000+(win/2)))))/size(idx_LC,1);
end

RR=result(idx_RC,:);

for i=1:111
R_FR(i)=sum(sum(RR(:,step*(i-1)+(1000-(win/2)+1):step*(i-1)+(1000+(win/2)))))/size(idx_RC,1);
end

% 
% figure
% plot(L_FR); hold on
% plot(R_FR)
% plot(aa)
aa=[];
aa=abs(L_FR-R_FR)./(L_FR+R_FR);

absol(ii,:)=aa;

end

absol2=absol;
ma=nanmean(absol);
% 
%  figure
% plot(ma2); hold on

%% PT
% D_IT=D( T.Response == 1 & T.MouseType == '1',:); % Type 1 도 포함
D_PT=D(T.class == 2 & T.Response == 1 & T.MouseType == '2',:); % Type 2셀이면서 tagging 된 IT

%% PT


for ii=1:size(D_PT,1)
    
cd('D:\Backup\code\Spike_matrix\Spike_data');
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_PT(ii,1))]);
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_PT(ii,1)),'\',char(D_PT(ii,2))]);

load(char(D_PT(ii,3)))

LL2=result(idx_LC,:);

for i=1:111
L_FR2(i)=sum(sum(LL2(:,step*(i-1)+(1000-(win/2)+1):step*(i-1)+(1000+(win/2)))))/size(idx_LC,1);
end

RR2=result(idx_RC,:);

for i=1:111
R_FR2(i)=sum(sum(RR2(:,step*(i-1)+(1000-(win/2)+1):step*(i-1)+(1000+(win/2)))))/size(idx_RC,1);
end

% 
% figure
% plot(L_FR); hold on
% plot(R_FR)
% plot(aa)
aa2=[];
aa2=abs(L_FR2-R_FR2)./(L_FR2+R_FR2);

absol3(ii,:)=aa2;

end

absol4=absol3;
ma2=nanmean(absol3);

%% Type 1

% D_IT=D( T.Response == 1 & T.MouseType == '1',:); % Type 1 도 포함
D_t1=D(T.class == 1 ,:); % Type 2셀이면서 tagging 된 IT

%% t1


for ii=1:size(D_t1,1)
    
cd('D:\Backup\code\Spike_matrix\Spike_data');
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_t1(ii,1))]);
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_t1(ii,1)),'\',char(D_t1(ii,2))]);

load(char(D_t1(ii,3)))

LL2=result(idx_LC,:);

for i=1:111
L_FR2(i)=sum(sum(LL2(:,step*(i-1)+(1000-(win/2)+1):step*(i-1)+(1000+(win/2)))))/size(idx_LC,1);
end

RR2=result(idx_RC,:);

for i=1:111
R_FR2(i)=sum(sum(RR2(:,step*(i-1)+(1000-(win/2)+1):step*(i-1)+(1000+(win/2)))))/size(idx_RC,1);
end

% 
% figure
% plot(L_FR); hold on
% plot(R_FR)
% plot(aa)
aa2=[];
aa2=abs(L_FR2-R_FR2)./(L_FR2+R_FR2);

absol5(ii,:)=aa2;

end

absol6=absol5;
ma3=nanmean(absol5);

%% Type 2

%% Type 2

% D_IT=D( T.Response == 1 & T.MouseType == '1',:); % Type 1 도 포함
D_t2=D(T.class == 2 ,:); % Type 2셀이면서 tagging 된 IT

%% t1


for ii=1:size(D_t2,1)
    
cd('D:\Backup\code\Spike_matrix\Spike_data');
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_t2(ii,1))]);
cd(['D:\Backup\code\Spike_matrix\Spike_data\',char(D_t2(ii,1)),'\',char(D_t2(ii,2))]);

load(char(D_t2(ii,3)))

LL2=result(idx_LC,:);

for i=1:111
L_FR2(i)=sum(sum(LL2(:,step*(i-1)+(1000-(win/2)+1):step*(i-1)+(1000+(win/2)))))/size(idx_LC,1);
end

RR2=result(idx_RC,:);

for i=1:111
R_FR2(i)=sum(sum(RR2(:,step*(i-1)+(1000-(win/2)+1):step*(i-1)+(1000+(win/2)))))/size(idx_RC,1);
end

% 
% figure
% plot(L_FR); hold on
% plot(R_FR)
% plot(aa)
aa2=[];
aa2=abs(L_FR2-R_FR2)./(L_FR2+R_FR2);

absol7(ii,:)=aa2;

end

absol8=absol7;
ma3=nanmean(absol7);


%% Figure

fig12=figure;

mean_ab= nanmean(absol);
mean_ab2= nanmean(absol3);
mean_ab3= nanmean(absol5);
mean_ab4= nanmean(absol7);

rr=[1 0.1 0.3];
bb=[0.1 0.3 .7];

plot(mean_ab,'Color',rr,'LineWidth' ,2); hold on
plot(mean_ab2,'Color',bb,'LineWidth' ,2); hold on
plot(mean_ab3,'--k','LineWidth' ,2); hold on
plot(mean_ab4,'--k','LineWidth' ,2); hold on

set(gca,'XTick',[0:10:111]); % 축 간격 조정
xlim([10 100])
set(gca,'XTickLabel',{-4:1:8}); % 축 지정하기
line([40,40],[-1,0.5],'LineStyle','--','LineWidth',1,'Color',[.5 .5 .5])
line([20,20],[-1,0.5],'LineStyle','--','LineWidth',1,'Color',[.5 .5 .5])
line([80,80],[-1,0.5],'LineStyle','--','LineWidth',1,'Color',[.5 .5 .5])
ylim([0.05 0.4])
set(gca,'YTick',[-0.2:0.1:.5]); % 축 간격 조정
set(fig12, 'Position', [400 500 400 200])
xlabel('Time from delay onset (s)');
ylabel('Target preference');       

%% SEM

% Type1

time=[1:111];
cnt=1;
idx_nan3=[];
for i=1:size(absol6,1)
    if sum(isnan(absol6(i,:)))>0
        idx_nan3(cnt)=i;
        cnt=cnt+1;
    end
end
if isempty(idx_nan3)==0
    absol6(idx_nan3,:)=[];
end
S_ab=std(absol6);

SEM_con3=S_ab/sqrt(size(absol6,1));

color=[0.5 0.5 0.5];

fill([time flip(time)],[mean_ab3+(SEM_con3) flip(mean_ab3-(SEM_con3))],color, 'FaceAlpha',0.3,'EdgeColor','none');
SEMfigure1=plot(mean_ab3,'--','LineWidth' ,2,'Color',color);


% Type2

time=[1:111];
cnt=1;
idx_nan4=[];
for i=1:size(absol8,1)
    if sum(isnan(absol8(i,:)))>0
        idx_nan4(cnt)=i;
        cnt=cnt+1;
    end
end
if isempty(idx_nan4)==0
    absol8(idx_nan4,:)=[];
end
S_ab=std(absol8);

SEM_con4=S_ab/sqrt(size(absol8,1));

color='k';

fill([time flip(time)],[mean_ab4+(SEM_con4) flip(mean_ab4-(SEM_con4))],color, 'FaceAlpha',0.3,'EdgeColor','none');
SEMfigure1=plot(mean_ab4,'--','LineWidth' ,2,'Color',color);


%


%% IT PT SEM

hold on;
time=[1:111];
cnt=1;
for i=1:size(absol2,1)
    if sum(isnan(absol2(i,:)))>0
        idx_nan(cnt)=i;
        cnt=cnt+1;
    end
end
absol2(idx_nan,:)=[];
S_ab=std(absol2);

SEM_con=S_ab/sqrt(size(absol2,1));

color=rr;

fill([time flip(time)],[mean_ab+(SEM_con) flip(mean_ab-(SEM_con))],color, 'FaceAlpha',0.2,'EdgeColor','none');
SEMfigure1=plot(time,mean_ab,'LineWidth',1,'Color',color);

% PT
time=[1:111];
cnt=1;
idx_nan2=[];
for i=1:size(absol4,1)
    if sum(isnan(absol4(i,:)))>0
        idx_nan2(cnt)=i;
        cnt=cnt+1;
    end
end
if isempty(idx_nan2)==0
    absol4(idx_nan2,:)=[];
end
S_ab=std(absol4);

SEM_con2=S_ab/sqrt(size(absol4,1));

color=bb;

fill([time flip(time)],[mean_ab2+(SEM_con2) flip(mean_ab2-(SEM_con2))],color, 'FaceAlpha',0.2,'EdgeColor','none');
SEMfigure1=plot(time,mean_ab2,'LineWidth',1,'Color',color);

%%
box off

set(gca,'Box','off','TickDir','out','FontSize',11,'FontName','Arial');
set(gca,'FontSize',12,'FontName','Arial')

%% ttest

for t=1:111
    [h,p]=ttest2(absol(:,t),absol3(:,t));
    tt1(t,1)=h;
end

for t=1:111
    [h,p]=ttest2(absol5(:,t),absol7(:,t));
    tt2(t,1)=h;
end

%%

% cd(['D:\Backup\code\Spike_matrix\Absolute\Figure'])
% 
% print(gcf,'-dtiff','-r600',['Absolute1']);
% print(gcf,'-depsc',['Absolute'])




















