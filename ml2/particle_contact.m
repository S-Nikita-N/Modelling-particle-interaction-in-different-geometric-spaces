function [forceX, forceY] = particle_contact(x,n,eps,b,rit,lef,top,bot);
    forceX = zeros(n,1);
    forceY = zeros(n,1);
    for i = 1:n-1
        for j =i+1:n  
%optional
             %[forceX(i),forceX(j),forceY(i),forceY(j)] = box_interaction(x,i,j,forceX,forceY,eps,b,rit);
             %[forceX(i),forceX(j),forceY(i),forceY(j)] = cylinder_interaction(x,i,j,forceX,forceY,eps,b,rit);
             [forceX(i),forceX(j),forceY(i),forceY(j)] = Mobius_tape_interaction(x,i,j,forceX,forceY,eps,b,rit);
             %[forceX(i),forceX(j),forceY(i),forceY(j)] = tor_interaction(x,i,j,forceX,forceY,eps,b,rit,top);
             %[forceX(i),forceX(j),forceY(i),forceY(j)] = Klein_bottel_interaction(x,i,j,forceX,forceY,eps,b,rit,top);
             %[forceX(i),forceX(j),forceY(i),forceY(j)] = Projective_plane_interaction(x,i,j,forceX,forceY,eps,b,rit,top);

         end
       
     end
end

