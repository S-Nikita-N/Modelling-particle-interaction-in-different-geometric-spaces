function [xt, vt] = tor__Klein_bottel__projective_plane_boundary_conditions(x,v,n,rit,lef,top,bot)

    xt = x;
    vt = v;

    for i =1:n
        if x(2*i-1)>rit
            xt(2*i-1) = lef + x(2*i-1)-rit;
        elseif x(2*i-1)<lef
            xt(2*i-1) = rit + x(2*i-1)-lef;
        end
    
        if x(2*i)>top
            xt(2*i) = bot + x(2*i)-top;
        elseif x(2*i)<bot
            xt(2*i) = top + x(2*i)-bot;
        end
    end

end