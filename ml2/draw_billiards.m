function draw_billiards(lef,rit,bot,top,xb,yb,nb,rb)
    alpha = 0:pi/50:2*pi;
    for i=1:nb
        xbilliard = rb(i)*cos(alpha)+xb(i);
        ybilliard = rb(i)*sin(alpha)+yb(i);
        plot(xbilliard,ybilliard,"Color",'red');
        hold on
        axis([lef, rit,bot,top]);
    end
end