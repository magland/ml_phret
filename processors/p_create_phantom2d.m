function ret=p_create_phantom2d(params)

if (ischar(params))&&(strcmp(params,'spec'))
    ret=get_spec();
    return;
end;

name=params.name;
N=str2num(params.N);
X=create_phantom2d(name,N);

disp(size(X));
disp(params.phantom_out);
writemda32(X,params.phantom_out);

function spec=get_spec

name='phret.create_phantom2d';
version='0.11';

inputs={};

outputs={};
outputs{end+1}=struct('name','phantom_out');

parameters={};
parameters{end+1}=struct('name','name');
parameters{end+1}=struct('name','N');

opts=struct;

spec=struct( ...
    'name',name, ...
    'version',version, ...
    'inputs',{inputs}, ...
    'outputs',{outputs}, ...
    'parameters',{parameters}, ...
    'opts',opts ...
);
