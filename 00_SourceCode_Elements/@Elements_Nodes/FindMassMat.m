function M=FindMassMat(obj)

    nodeNum=size(obj.coordinates_Mat);
    nodeNum=nodeNum(1);
    
    M=zeros(3*nodeNum);
    
    for i=1:nodeNum
       M(3*(i-1)+1,3*(i-1)+1)=obj.mass_Vec(i); 
       M(3*(i-1)+2,3*(i-1)+2)=obj.mass_Vec(i); 
       M(3*(i-1)+3,3*(i-1)+3)=obj.mass_Vec(i); 
    end

end