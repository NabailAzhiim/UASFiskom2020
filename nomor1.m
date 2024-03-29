# M. 'Anin Nabail 'Azhiim (2106629761)
# UAS 2020 Pak Adam

clear all
clc

# Data
t = [1,2,3,4.5,6,7,8,8.5,10];
v = [5,5.5,6,7,7.5,7.5,7,6.5,5];

# a. Integral numerik metode trapesium
A = 0;
for j=1:length(t)-1
  dt(j) = t(j+1)-t(j);
  A = A+(v(j)+v(j+1)).*dt(j)/2;
end
printf("a. Hasil dengan integral numerik = %i \n", A)

# b. Fitting polinom pangkat 3
# Metode matriks G
# Matriks G dan V
k = length(v);
G = zeros(k,4);
V = zeros(k,1);
for j=1:k
  G(j,1) = 1;
  G(j,2) = t(j);
  G(j,3) = t(j).^2;
  G(j,4) = t(j).^3;
  V(j,1) = v(j);
end
# Matriks koefisien
C = inv(transpose(G)*G)*transpose(G)*V;
# Buat data baru hasil fitting
tb = min(t):(max(t)-min(t))/100:max(t);
vb = C(1)+C(2).*tb+C(3).*tb.^2+C(4).*tb.^3;
# Integralkan data baru secara numerik (metode trapesium)
B = 0;
for j=1:length(tb)-1
  dtb(j) = tb(j+1)-tb(j);
  B = B+(vb(j)+vb(j+1)).*dtb(j)/2;
end
printf("b. Hasil dengan fitting polinomial = %i \n", B)
# Plot data dan hasil fitting (tambahan)
plot(t,v,'o',tb,vb,'linewidth',1)
legend("Data","Fitting",'fontsize',20)
set(gca,'fontsize',20)
xlabel('t','fontsize',20)
xlim([min(tb),max(tb)])
ylabel('v','fontsize',20)
grid on


