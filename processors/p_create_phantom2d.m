function ret=p_create_phantom2d(params)

if (ischar(params))&&(strcmp(params,'spec'))
    ret=get_spec();
    return;
end;

name=params.name;
N=str2num(params.N);
X=run_processor(name,N);

disp(size(X));
disp(params.phantom_out);
writemda32(X,params.phantom_out);

function X=run_processor(name,N)

if (strcmp(name,'disk'))
    X=rand(N,N);
else
    error('Unknown name: %s',name);
end;

function spec=get_spec

name='phret.create_phantom2d';

inputs={};

outputs={};
outputs{end+1}=struct('name','phantom_out');

parameters={};
parameters{end+1}=struct('name','name');
parameters{end+1}=struct('name','N');

opts=struct;

spec=struct( ...
    'name',name, ...
    'inputs',{inputs}, ...
    'outputs',{outputs}, ...
    'parameters',{parameters}, ...
    'opts',opts ...
);
