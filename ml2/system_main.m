clear variables;
clc

% Settings
%------------------------------------------------------------------------------
%--plane
rit = 8;
lef = -8;
top = 8;
bot = -8;

%--billiard
nb =0;
[xb,yb,rb] = generate_billiards(nb,rit,lef,top,bot);


%--particle
n =40;
isRebound = zeros(nb,n);
[mass, radius, position] = particlesProp(n,rit,lef,top,bot,xb,yb,rb,nb);
b = 0.5;
eps = 1;
nu = 0.05 *10^0;
dt = 0.0001;
dura = 10;
T = dura/dt;



% Initialization
%------------------------------------------------------------------------------
x = zeros (2*n,T);
v = zeros (2*n,1);
a = zeros (2*n,1);
%Position
%------------------------------------------------------------------------------
x(:,1) = position;
x(1) = lef/2;
x(2) = 4-1;
x(3) = rit/2;
x(4) = -4+1;
spd =4;
for i = 1:n
    v(2*i-1,1) = -spd +2*spd*rand;
    v(2*i,1) = -spd +2*spd*rand;
end

v(1) = 0;
v(2) = 0;
v(3) = -0;
v(4) = 0;


% Calculation
%------------------------------------------------------------------------------
for t = 2:T
% Sum forces
    [forceXpeer,forceYpeer] = particle_contact(x(:,t-1),n,eps,b,rit,lef,top,bot);
    [frictionX,frictionY] = friction(v,n,radius,nu);
% Accelerations
    for i = 1:n
        a(2*i-1) = (forceXpeer(i)  + frictionX(i))/mass(i);
        a(2*i) = (forceYpeer(i)  + frictionY(i))/mass(i);     
    end

% Velocities
    for i = 1:n
        v(2*i-1) =  a(2*i-1)*dt +  v(2*i-1);
        v(2*i) =  a(2*i)*dt +  v(2*i);
    end
% Coordinates
     for i = 1:n
        x(2*i-1,t) =(.5*a(2*i-1)*dt^2 +  v(2*i-1)*dt) + x(2*i-1,t-1);
        x(2*i,t) =  (.5*a(2*i)*dt^2 +  v(2*i)*dt) + x(2*i,t-1);
     end


%optional 
     %[x(:,t) , v] = box_boundary_conditions(x(:,t),v,n,rit,lef,top,bot);
     [x(:,t) , v] =  cylinder__Mobius_tape_boundary_conditions(x(:,t),v,n,rit,lef,top,bot);
     %[x(:,t) , v] =  tor__Klein_bottel__projective_plane_boundary_conditions(x(:,t),v,n,rit,lef,top,bot);

% not to comment
      [x(:,t), v , isRebound] = billiard_boundary_conditions(x(:,t),v,n,radius,nb,xb,yb,rb,isRebound);
%

end


% PLotting
%------------------------------------------------------------------------------
% wbplo = waitbar(0,'Running State Values...');
% movegui(wbplo,[300,400]);
% plo = 0;
% chunk = 0;
%pad = 0;
frame = 1;
skip = .1/dt;
figure;
for t = 1:skip:T
    draw_billiards(lef,rit,bot,top,xb,yb,nb,rb)
    for i = 1:n
        theta = 0:pi/50:2*pi;
        
        xunit = radius(i)*cos(theta)+x(2*i-1,t);
        yunit = radius(i)*sin(theta)+x(2*i,t);
        plot(xunit,yunit,"Color",[0 0 0]);
        
        hold on
        axis([lef, rit,bot,top]);
    end
    pause(.0001);
    F(frame) = getframe(gcf);
    hold off
%     if plo>=.05*t
%         chunk = chunk+1;
%         waitbar(chunk/20);
%         plo=0;
%     end
%     plo = plo+skip;
    frame = frame+1;
end
% delete(wbplo);
video = VideoWriter('system_vid', 'MPEG-4');
video.FrameRate = 10;
open(video);
writeVideo(video,F);
close(video);
