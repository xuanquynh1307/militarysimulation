function [fHandler]=InitializeGraphicN()
global EnvironmentWidth Target1 Target2;
fHandler = figure;
fHandler.Color = 'white';
fHandler.MenuBar =  'none';
fHandler.ToolBar = 'none';
fHandler.Name = 'Xuan Quynh, Tien Trung, Huu Trang, Dinh Kiet';
fHandler.NumberTitle = 'off';
rectangle('position',[-EnvironmentWidth -EnvironmentWidth 2*EnvironmentWidth 2*EnvironmentWidth],'EdgeColor','b','LineWidth',1);
hold on
title('LQ, KQ, HQ CUNG TAN CONG CAN CU DICH GIAP BIEN')
xlabel('X axis')
ylabel('Y axis')
axis manual;
axis([-EnvironmentWidth EnvironmentWidth -EnvironmentWidth EnvironmentWidth]);

plot(Target1(1),Target1(2),'o','MarkerSize',5,'MarkerFaceColor','b','Color','b');
plot(Target2(1),Target2(2),'o','MarkerSize',5,'MarkerFaceColor','r','Color','r');