%% MyCrust
%
%Simple surface recostruction program based on Crust algorithm Given a set
% of 3D points returns a triangulated tight surface.
%
%The more points there are the best the surface will be fitted, although
% you will have to wait more. For very large models an help memory errors
% may occurs. It is important even the point distribution, generally
% uniformly distributed points with denser zones in high curvature features
% give the best results.
%
%Remember  crust algorithom needs a cloud representing a VOLUME so open
% surface may give inaccurate results.  Surface with small holes are not
% considered open surface and generally are processed well. 
%
%
% If any problems occurs in execution, or if you found a bug, have a
% suggestion or question just contact me at:
%
% giaccariluigi@msn.com
%
%
%
%
%Here is a simple example:
%
%load Dino.mat%load input points from mat file
%
%[t]=MyCrust(p);
%
% figure(1)
%         hold on title('Output Triangulation','fontsize',14) axis equal
%         trisurf(t,p(:,1),p(:,2),p(:,3),'facecolor','c','edgecolor','b')
%
%Input:
%              p is a Nx3 array containing the 3D set of points
%Output:
%              t are points id contained in triangles nx3 array .
%
% See also qhull, voronoin, convhulln, delaunay, delaunay3, tetramesh.
%
%Author:Giaccari Luigi
%Last Update: 03/1/2008
%Created: 10/10/2008


function [t]=MyCrust(p)
%error check

if nargin>1
    error('The only input must be the Nx3 array of points');
end

[n]=size(p,2);
if n ~=3
       error('Input 3D points must be stored in a Nx3 array');
end 
clear  n


%%   Main
starttime=clock;

%add points to the given ones, this is usefull
%to create outside tetraedroms
tic
[p,nshield]=AddShield(p);
fprintf('Added Shield: %4.4f s\n',toc)



tic
tetr=delaunayn(p);%creating tedraedron
tetr=int32(tetr);%use integer to save memory
fprintf('Delaunay Triangulation Time: %4.4f s\n',toc)



%connectivity data
%find triangles to tetraedrom and tetraedrom to triangles connectivity data
tic
[t2tetr,tetr2t,t]=Connectivity(tetr);
fprintf('Connectivity Time: %4.4f s\n',toc)


tic
[cc,r]=CC(p,tetr);%Circumcenters of tetraedroms
fprintf('Circumcenters Time: %4.4f s\n',toc)
clear n


tic
tbound=Marking(p,tetr,tetr2t,t2tetr,cc,r,nshield);%Flagging tetraedroms as inside or outside
fprintf('Walking Time: %4.4f s\n',toc)

%recostructed raw surface
t=t(tbound,:);

time=etime(clock,starttime);
fprintf('Total Time: %4.4f s\n',time)


end


%% Circumcenters
function [cc,r]=CC(p,tetr)
%finds circumcenters from a set of tetraedroms

%points of tetraedrom
p1=(p(tetr(:,1),:));
p2=(p(tetr(:,2),:));
p3=(p(tetr(:,3),:));
p4=(p(tetr(:,4),:));

%vectors of tetraedrom edges
v21=p(tetr(:,1),:)-p(tetr(:,2),:);
v31=p(tetr(:,3),:)-p(tetr(:,1),:);
v41=p(tetr(:,4),:)-p(tetr(:,1),:);

%preallocation
cc=zeros(size(tetr,1),3);


%Solve the system using cramer method
d1=sum(v41.*(p1+p4)*.5,2);
d2=sum(v21.*(p1+p2)*.5,2);
d3=sum(v31.*(p1+p3)*.5,2);

det23=(v21(:,2).*v31(:,3))-(v21(:,3).*v31(:,2));
det13=(v21(:,3).*v31(:,1))-(v21(:,1).*v31(:,3));
det12=(v21(:,1).*v31(:,2))-(v21(:,2).*v31(:,1));

Det=v41(:,1).*det23+v41(:,2).*det13+v41(:,3).*det12;


detx=d1.*det23+...
    v41(:,2).*(-(d2.*v31(:,3))+(v21(:,3).*d3))+...
    v41(:,3).*((d2.*v31(:,2))-(v21(:,2).*d3));

dety=v41(:,1).*((d2.*v31(:,3))-(v21(:,3).*d3))+...
    d1.*det13+...
    v41(:,3).*((d3.*v21(:,1))-(v31(:,1).*d2));

detz=v41(:,1).*((v21(:,2).*d3)-(d2.*v31(:,2)))...
    +v41(:,2).*(d2.*v31(:,1)-v21(:,1).*d3)...
    +d1.*(det12);

%Circumcenters
cc(:,1)=detx./Det;
cc(:,2)=dety./Det;
cc(:,3)=detz./Det;


%Circumradius
r=realsqrt((sum((p2-cc).^2,2)));%ciecum radius
end



%% Connectivity

function [t2tetr,tetr2t,t]=Connectivity(tetr)

%Gets conectivity relantionships among tetraedroms

numt = size(tetr,1);
vect = 1:numt;
t = [tetr(:,[1,2,3]); tetr(:,[2,3,4]); tetr(:,[1,3,4]);tetr(:,[1,2,4])];%triangles not unique
[t,j,j] = unique(sort(t,2),'rows');%triangles
t2tetr = [j(vect), j(vect+numt), j(vect+2*numt),j(vect+3*numt)];%each tetraedrom has 4 triangles


% triang-to-tetr connectivity

nume = size(t,1);
tetr2t  = zeros(nume,2,'int32');
count= ones(nume,1,'int8');
for k = 1:numt

    for j=1:4
        ce = t2tetr(k,j);
        tetr2t(ce,count(ce)) = k;
        count(ce)=count(ce)+1;
    end

end


end      % connectivity()



%% Marking
function tbound=Marking(p,tetr,tetr2t,t2tetr,cc,r,nshield)
%The more important routine to flag tetredroms as outside or inside

%costants for the algorithm

TOLLDIFF=.01;%tollerance decrease at each iteration
% (the higher the value the more robust but slower is the algorithm. It is also required
% a higher MAXLEVEL value to rach the end of iterations. );


INITTOLL=.99;%starting tollerance

MAXLEVEL=10/TOLLDIFF;%maximum  reachable level 
BRUTELEVEL=MAXLEVEL-50;%level to start  brute continuation



%preallocation
np=size(p,1)-nshield;%nshield = number of shield points put at the end of array
numtetr=size(tetr,1);
nt=size(tetr2t,1);
% deleted=true(numtetr,1);%deleted tetraedroms
% checked=false(numtetr,1);%checked tetraedroms
onfront=false(nt,1);%tetraedroms that need to be checked
% countchecked=0;%counter of checked tetraedroms


%First flag as outside tetraedroms with Shield points

%unvectorized
% for i=1:numtetr
%     for j=1:4
%         if tetr(i,j)>np;
%             deleted(i)=true;
%             checked(i)=true;
%             onfront(t2tetr(i,:))=true;
%             countchecked=countchecked+1;
%             break
%         end
%     end
% end

%vectorized
deleted=any(tetr>np,2);%deleted tetraedroms
checked=deleted;%checked tetraedroms
onfront(t2tetr(checked,:))=true;
countchecked=sum(checked);%counter of checked tetraedroms


%tollerances to mark as in or out
toll=zeros(nt,1)+INITTOLL;
level=0;

%intersection factor
%it is computed from radius of the tetraedroms circumscribed sphere
% and the distance between their center
Ifact=IntersectionFactor(tetr2t,cc,r);
clear cc r




%         Now we scan all tetraedroms. When one is scanned puts on front is
%         neighbor. This means that now  the neighobor can be checked too.
%         At the begining only tetraedroms with shield points are on front,
%         because we are sure the are out. Tetraedrom with high
%         intersection factor  will be marked as equal else different. When
%         I say high i mean under a set tollerance that becames lower as
%         the algorithm progresses. This Aims to avoid errors propagation
%         when a tetraedrom is wrong marked.
%
ids=1:nt;
queue=ids(onfront);
nt=length(queue);
while countchecked<numtetr && level<MAXLEVEL
    level=level+1;%level of scan reached

    for i=1:nt%loop trough triangles <-----better is check only unchecked

        id=queue(i);

        tetr1=tetr2t(id,1);tetr2=tetr2t(id,2);%tetraedroms linked to triangle under analysis
        if  tetr2==0 %do not check boundary triangles
            onfront(id)=false;
            continue

        elseif (checked(tetr1) && checked(tetr2)) %tetraedroms are already checked
            onfront(id)=false;
            continue

        end

        if Ifact(id)>=toll(id) %flag as equal
            if checked(tetr1)%find the checked one between the two
                deleted(tetr2)=deleted(tetr1) ;%flag as equal
                checked(tetr2)=true;%check
                countchecked=countchecked+1;
                onfront(t2tetr(tetr2,:))=true;%put on front all tetreadrom triangles
            else
                deleted(tetr1)=deleted(tetr2) ;%flag as equal
                checked(tetr1)=true;%check
                countchecked=countchecked+1;
                onfront(t2tetr(tetr1,:))=true;%put on front all tetreadrom triangles
            end
            onfront(id)=false;%remove from front


        elseif Ifact(id)<-toll(id)%flag as different
            if checked(tetr1)%find the checked one between the two
                deleted(tetr2)=~(deleted(tetr1)) ;%flag as different
                checked(tetr2)=true;%check
                countchecked=countchecked+1;
                onfront(t2tetr(tetr2,:))=true;%put on front all tetreadrom triangles
            else
                deleted(tetr1)=~(deleted(tetr2)) ;%flag as different
                checked(tetr1)=true;%check
                countchecked=countchecked+1;
                onfront(t2tetr(tetr1,:))=true;%put on front all tetreadrom triangles
            end
            onfront(id)=false;%remove from front


        else
            toll(id)=toll(id)-TOLLDIFF;%tolleraces were too high next time will be lower

        end



    end

    if level==BRUTELEVEL %brute continuation(this may appens when there are almost null volume tetraedroms)
        beep
        warning('Brute continuation necessary')
        onfront(t2tetr(~(checked),:))=true;%force onfront collocation
    end

    %update the queue
    queue=ids(onfront);
    nt=length(queue);

end










%extract boundary triangles
 tbound=BoundTriangles(tetr2t,deleted);


% this is the raw surface and needsimprovements to be used in CAD systems.
% Maybe in my next revision I will add surface post treatments. Anyway for
% grafical purpose this should be good.



%Output Data
numchecked=countchecked/numtetr;
if level==MAXLEVEL
    warning([num2str(level),' th level was reached\n'])
else
    fprintf('%4.0f th level was reached\n',level)
end
fprintf('%4.4f %% of Tetraedroms were checked\n',numchecked*100)



end






%% AddShield
function [pnew,nshield]=AddShield(p)

%adds outside points to the given cloud forming outside tetraedroms

%shield points are very good in detectinf outside tetraedroms. Unfortunatly
%delunany triangulation with these points can be even of 50% slower.

%find the bounding box
maxx=max(p(:,1));
maxy=max(p(:,2));
maxz=max(p(:,3));
minx=min(p(:,1));
miny=min(p(:,2));
minz=min(p(:,3));

%give offset to the bounding box
step=max(abs([maxx-minx,maxy-miny,maxz-minz]));

maxx=maxx+step;
maxy=maxy+step;
maxz=maxz+step;
minx=minx-step;
miny=miny-step;
minz=minz-step;

N=10;%number of points of the shield edge

step=step/(N*N);%decrease step, avoids not unique points



nshield=N*N*6;

%creating a grid lying on the bounding box
vx=linspace(minx,maxx,N);
vy=linspace(miny,maxy,N);
vz=linspace(minz,maxz,N);




[x,y]=meshgrid(vx,vy);
facez1=[x(:),y(:),ones(N*N,1)*maxz];
facez2=[x(:),y(:),ones(N*N,1)*minz];
[x,y]=meshgrid(vy,vz-step);
facex1=[ones(N*N,1)*maxx,x(:),y(:)];
facex2=[ones(N*N,1)*minx,x(:),y(:)];
[x,y]=meshgrid(vx-step,vz);
facey1=[x(:),ones(N*N,1)*maxy,y(:)];
facey2=[x(:),ones(N*N,1)*miny,y(:)];

%add points to the p array
pnew=[p;
    facex1;
    facex2;
    facey1;
    facey2;
    facez1;
    facez2];

% figure(4)
% plot3(pnew(:,1),pnew(:,2),pnew(:,3),'.g')


end



%% BoundTriangles
function tbound=BoundTriangles(tetr2t,deleted)
%extracts boundary triangles from a set tetr2t connectivity and form the
%deleted vector which tells tetraedroms that are marked as out

nt=size(tetr2t,1);%number of totals triangles

tbound=true(nt,2);%inizilize to keep shape in next operation

ind=tetr2t>0;%avoid null index
tbound(ind)=deleted(tetr2t(ind));%mark 1 for deleted 0 for kept tetraedroms

tbound=sum(tbound,2)==1;%bounary triangles only have one tetraedrom

end


%% Intersection factor
function Ifact=IntersectionFactor(tetr2t,cc,r)
nt=size(tetr2t,1);
Ifact=zeros(nt,1);%intersection factor
%it is computed from radius of the tetraedroms circumscribed sphere
% and the distance between their center
i=tetr2t(:,2)>0;
distcc=sum((cc(tetr2t(i,1),:)-cc(tetr2t(i,2),:)).^2,2);%distance between circumcenters
Ifact(i)=(-distcc+r(tetr2t(i,1)).^2+r(tetr2t(i,2)).^2)./(2*r(tetr2t(i,1)).*r(tetr2t(i,2)));

%unvectorized
% for i=1:nt
%     if tetr2t(i,2)>0 %jump boundary tetraedrom
%         distcc=sum((cc(tetr2t(i,1),:)-cc(tetr2t(i,2),:)).^2,2);%distance between circumcenters
%         %intersection factor
%         Ifact(i)=(-distcc+r(tetr2t(i,1))^2+r(tetr2t(i,2))^2)/(2*r(tetr2t(i,1))*r(tetr2t(i,2)));
%     end
% end
end
