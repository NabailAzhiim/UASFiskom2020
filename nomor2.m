# M. 'Anin Nabail 'Azhiim (2106629761)
# UAS 2020 Pak Adam

clear all
clc

# Karena y(h)=y(0) maka hal ini menunjukkan bahwa kondisi awal y'(0)=0
# Anggap sistem 2 PDB dengan variabel pertama y dan variabel kedua y'
# PDB pertama adalah dy/dx = y'
# PDB kedua adalah dy'/dx = y'' = -cy'-y
t0 = 0;
tm = 10;
h = 0.1;
t = t0:h:tm;
y0 = 1;
v0 = 0;
Y(:,1) = [y0;v0]; # Syarat batas
c = [0.5;4];
F = @(t,Y,c) [Y(2);-c*Y(2)-Y(1)];
for i=1:length(c)
  f = @(t,Y) F(t,Y,c(i));
  for j=1:length(t)-1 # Metode Runge-Kutta
    k1 = f(t(j),Y(:,j));
    k2 = f(t(j)+h/2,Y(:,j)+h*k1/2);
    k3 = f(t(j)+h/2,Y(:,j)+h*k2/2);
    k4 = f(t(j)+h,Y(:,j)+h*k3);
    Y(:,j+1) = Y(:,j) + h*(k1+2*k2+2*k3+k4)/6;
  end
  y = Y(1,:); # Ambil nilai y
  plot(t,y,'linewidth',1)
  hold on
end
legend("c = 0.5","c = 4",'fontsize',20)
set(gca,'fontsize',20)
xlabel('t','fontsize',20)
xlim([t0,tm])
ylabel('y(t)','fontsize',20)
title("Grafik y Fungsi t",'fontsize',24)
grid on


