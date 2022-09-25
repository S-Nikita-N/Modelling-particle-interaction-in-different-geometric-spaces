function [xt, vt] = box_boundary_conditions(x,v,n,rit,lef,top,bot,nb,xb,yb,rb,isRebound)

    xt = x;
    vt = v;

    for i =1:n
        if x(2*i-1)>rit
            xt(2*i-1) = 2*rit - x(2*i-1);
            vt(2*i-1) = -v(2*i-1);
        elseif x(2*i-1)<lef
            xt(2*i-1) = 2*lef - x(2*i-1);
            vt(2*i-1) = -v(2*i-1);
        end
        if x(2*i)>top
            xt(2*i) = 2*top - x(2*i);
            vt(2*i) = -v(2*i);
        elseif x(2*i)<bot
            xt(2*i) = 2*bot - x(2*i);
            vt(2*i) = -v(2*i);
        end
    end

end