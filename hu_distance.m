function s=hu_distance(v1,v2)
    s=0;
    temp=size(v1);
    n=temp(1,2);
    for i=1:n
        s=s+(v1(1,i)-v2(1,i))^2;
    end; 
    s=sqrt(s); 
end
    