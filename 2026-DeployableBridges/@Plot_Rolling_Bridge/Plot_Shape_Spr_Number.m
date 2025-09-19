function Plot_Shape_Spr_Number(obj)

% Obtain Information
View1=obj.viewAngle1;
View2=obj.viewAngle2;
Vsize=obj.displayRange;
Vratio=obj.displayRangeRatio;
assembly=obj.assembly;

%% Set up the graphic space
figure
view(View1,View2); 
set(gca,'DataAspectRatio',[1 1 1])
set(gcf, 'color', 'white');
set(gcf,'position',[obj.x0,obj.y0,obj.width,obj.height])

% The software support two ways to set up the plotting range
A=size(Vsize);
if A(1)==1    
    axis([-Vratio*Vsize Vsize -Vratio*Vsize Vsize -Vratio*Vsize Vsize])
else
    axis([Vsize(1) Vsize(2) Vsize(3) Vsize(4) Vsize(5) Vsize(6)])
end

%% Plot te cst element
node0=assembly.node.coordinates_mat;
cstIJK=obj.assembly.cst.node_ijk_mat;
panelNum=size(cstIJK);
panelNum=panelNum(1);

for k=1:panelNum
    nodeNumVec=cstIJK(k,:);
    f=[];
    v=[];
    for j=1:length(nodeNumVec)
        f=[f,j];
        v=[v;node0(nodeNumVec(j),:)];
    end
    patch('Faces',f,'Vertices',v,'FaceColor','yellow')
end

%% Plot the bar element
barNum=size(assembly.bar.A_vec);
barNum=barNum(1);
barConnect=assembly.bar.node_ij_mat;

for j=1:barNum
    node1=assembly.node.coordinates_mat(barConnect(j,1),:);
    node2=assembly.node.coordinates_mat(barConnect(j,2),:);
    line([node1(1),node2(1)],...
         [node1(2),node2(2)],...
         [node1(3),node2(3)],'Color','k');
end

%% Plot the actuation bar
actbarNum=size(assembly.actBar.A_vec);
actbarNum=actbarNum(1);
actbarConnect=assembly.actBar.node_ij_mat;

for j=1:actbarNum
    node1=assembly.node.coordinates_mat(actbarConnect(j,1),:);
    node2=assembly.node.coordinates_mat(actbarConnect(j,2),:);
    line([node1(1),node2(1)],...
         [node1(2),node2(2)],...
         [node1(3),node2(3)],'Color',[.7 .7 .7]);
end

%% Plot the index of springs
node0=assembly.node.coordinates_mat;
sprNum=size(assembly.rot_spr_3N.node_ijk_mat);
N=A(1);

for i=1:sprNum
    x=node0(assembly.rot_spr_3N.node_ijk_mat(i,2),1);
    y=node0(assembly.rot_spr_3N.node_ijk_mat(i,2),2);
    z=node0(assembly.rot_spr_3N.node_ijk_mat(i,2),3);
    text(x,y,z,num2str(i),'Color','blue');
end

