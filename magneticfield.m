% Parámetros iniciales
R = 1; % Radio del anillo
I = 1; % Corriente
N = 100; % Número de segmentos de la espira
M = 50; % Número de espiras
dZ = 0.05; % Distancia entre espiras
mu0 = 4*pi*10^-7; % Permeabilidad del vacío

% Crear malla de puntos
[y, z] = meshgrid(linspace(-3, 3, 100), linspace(-3, 3, 100));
x = linspace(-3, 3, 100);
% Inicializar matrices de campo magnético
Bx = zeros(size(y));
By = zeros(size(y));
Bz = zeros(size(y));

% Calcular campo magnético
dtheta = 2*pi/N;
for m = 1:M
    z_esp = -dZ*(M/2-1) + dZ*(m-1); % Z location of the current loop
    for i = 1:N
        theta = i*dtheta;
        X = R*cos(theta);
        Y = R*sin(theta);

        dxi = -Y*dtheta;
        dyi = X*dtheta;
        rx = x - X;
        ry = y - Y;
        rz = z - z_esp;
        r = sqrt(rx.^2 + ry.^2 + rz.^2);
        
        Bx = Bx + mu0*I/(4*pi) * (dyi .* rz)./r.^3;
        By = By + (-(mu0*I/(4*pi))) * (dxi .* rz)./r.^3;
        Bz = Bz + mu0*I/(4*pi) * (dxi .* ry - dyi .* rx)./r.^3;
    end
end

B = sqrt(Bz.^2+By.^2);

% Dibujar el campo magnético
figure(1)  %
colormap jet;
pcolor(y,z,B)
shading interp
hold on
h = streamslice(y, z, By, Bz);
set(h,'LineWidth',1);
set(h,'Color','w');
title('Campo magnético de una bobina ideal')
xlabel('y')
ylabel('z')
axis tight

figure(2)
colormap jet;
pcolor(y,z,B)
shading interp
hold on
title('Campo magnético de una bobina ideal')
xlabel('y')
ylabel('z')
axis tight
