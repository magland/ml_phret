function X=create_phantom2d(name,N)

if (strcmp(name,'disk'))
    X=zeros(N,N);
    [GX,GY]=ndgrid(linspace(-1,1,N),linspace(-1,1,N));
    GR=sqrt(GX.^2+GY.^2);
    X=X+1*(GR<=1);
else
    error('Unknown name: %s',name);
end;
