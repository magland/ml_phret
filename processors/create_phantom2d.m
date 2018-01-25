function [X,support_rect]=create_phantom2d(name,N,oversamp)

if (strcmp(name,'disk'))
    X=zeros(N*oversamp,N*oversamp);
    tmp=linspace(-oversamp,oversamp,N*oversamp);
    [GX,GY]=ndgrid(tmp,tmp);
    GR=sqrt(GX.^2+GY.^2);
    X=X+1*(GR<=1);
    support_rect=(GX<=1).*(GY<=1);
else
    error('Unknown name: %s',name);
end;
