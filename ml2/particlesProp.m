function [mass,radius,position] = particlesProp(n,rit,lef,top,bot,xb,yb,rb,nb);
    radius = zeros(n,1);
    position = zeros(2*n,1);
    for i =1:n
        radius(i) = 0.2;
        mass(i) = 1;
    end
    sumradius=0;
%random
    i = 1;
    while i < n+1
        position(2*i-1) = (rit-lef)*rand - (rit-lef)/2;
        position(2*i) = (top-bot)*rand - (top-bot)/2;
        k=1;
        for j = 1:n
            sumradius = radius(i) + radius(j);
            dist = sqrt((position(2*i-1) - position(2*j-1))^2+(position(2*i) - position(2*j))^2);
            if dist~=0 && dist>sumradius
                k = k+1;
            end
        end
        for j = 1:nb
            sumradius = radius(i) + rb(j);
            dist = sqrt((position(2*i-1) - xb(j))^2+(position(2*i) - yb(j))^2);
            if  dist>sumradius
                k = k+1;
            end
        end
        if k == n+nb
            i = i +1;
        end
    end

%state-generator
% k = 0;
%     rows = ceil(sqrt(n));
%     cols =  ceil(n/rows);
%     for i=1:rows
%         for j = 1:cols
%             k =k +1;
%             if( k <= n)
%                 position(2*k-1) = lef - rit/cols + (2*rit)*j/cols;
%                 position(2*k) = bot - top/rows + (2*top)*i/rows;
%                 disp(position(2*k))
%                 disp(position(2*k-1))
%             end
%         end
%     end

%2 particles
% position(1) = -3;
% position(2) = -15;
% position(3) = rit/2-1;
% position(4) = bot/2;


end
