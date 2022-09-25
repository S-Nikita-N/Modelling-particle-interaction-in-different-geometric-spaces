function [forceXi,forceXj,forceYi,forceYj] = cylinder_interaction(x,i,j,forceX,forceY,eps,b,rit)

    xj = x(2*j-1) - x(2*i-1);
    yj = x(2*j) - x(2*i);
    if abs(xj)>rit
        xj  = (2*rit - abs(xj))*(-xj/abs(xj));
    end
    dist = sqrt(xj^2+yj^2);
    forceXi = forceX(i) + (xj/dist)*4*eps*(-12*b^12 + 6*b^6*(dist)^6)/((dist)^13);   
    forceXj = forceX(j) + (-xj/dist)*4*eps*(-12*b^12 + 6*b^6*(dist)^6)/((dist)^13);   
    forceYi = forceY(i) + (yj/dist)*4*eps*(-12*b^12 + 6*b^6*(dist)^6)/((dist)^13);
    forceYj = forceY(j) + (-yj/dist)*4*eps*(-12*b^12 + 6*b^6*(dist)^6)/((dist)^13);
end