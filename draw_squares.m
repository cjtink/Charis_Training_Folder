close all
clear all
figure(1);
set(gca,'xlim',[0,20],'ylim',[0,20])

disp('choose five points')
[x,y,typ] = ginput;

x0 = sin(linspace(0,2*pi,20));
y0 = cos(linspace(0,2*pi,20));
col = ['r';'b';'c']

for i=1:length(x)
%     fill(x0+x(i),y0+y(i),rand(1,3)); hold on
    fill(x0+x(i),y0+y(i),col(typ(i))); hold on
    text(x(i),y(i),['S',num2str(i)])

end
   
%% selecting reactions
CON = zeros(length(x),length(x))

disp('choose two points')
[xr,yr] = ginput(2);

[~,j1]=min((x-xr(1)).^2+(y-yr(1)).^2)
[~,j2]=min((x-xr(2)).^2+(y-yr(2)).^2)

CON(j2,j1) = 1;

% arrow([x(j1),x(j2)],[y(j1),y(j2)],'--')
arrow([x(j1),y(j1)],[x(j2),y(j2)])

