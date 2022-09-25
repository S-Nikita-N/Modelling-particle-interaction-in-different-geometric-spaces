function [forceX, forceY] = friction (v,n,radius,nu);
    forceX = zeros(n,1);
    forceY = zeros(n,1);
    for i = 1:n
        alpha = 6*pi*radius(i);
        forceX(i) = -alpha*nu*v(2*i-1);
        forceY(i) = -alpha*nu*v(2*i);
    end
end

