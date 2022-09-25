function [xb,yb,rb] = generate_billiards(n,rit,lef,top,bot)
    xb = zeros(n,1);
    yb = zeros(n,1);
    rb = zeros(n,1);
    
    %random position generator
     i = 1;
     while i < n+1
        xb(i) = lef + 2*rit*rand;
        yb(i) = bot + 2*top*rand;
%         rb(i) = rand*rit/3;
        rb(i) = 0.8;
        if xb(i)>=yb(i)
            if xb(i)>=0
                xb(i)=rit;
            elseif xb(i)<0
                xb(i)=lef;
            end
        elseif xb(i)<yb(i)
            if yb(i)>=0
                yb(i)=top;
            elseif xb(i)<0
                yb(i)=bot;
            end
        end
        k=1;
        for j = 1:n
                sumradius = rb(i) + rb(j);
                dist = sqrt((xb(i) - xb(j))^2+(yb(i) - yb(j))^2);
                if dist~=0 && dist>sumradius
                    k = k+1;
                end
        end
        if k == n
            i = i +1;
        end
    end

end