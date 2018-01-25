function ret=p_create_phantom2d(params)

if (ischar(params))&&(strcmp(params,'spec'))
    ret=get_spec();
    return;
end;

name=params.name;
N=str2num(params.N);
oversamp=str2num(params.oversamp);
[X,support_rect]=create_phantom2d(name,N,oversamp);

writemda32(X,params.phantom_out);

if (~isempty(params.support_rect_out))
    writemda32(support_rect,params.support_rect_out);
end;

function spec=get_spec

name='phret.create_phantom2d';
version='0.12';

inputs={};

outputs={};
outputs{end+1}=struct('name','phantom_out');
outputs{end+1}=struct('name','support_rect_out','optional',true);

parameters={};
parameters{end+1}=struct('name','name');
parameters{end+1}=struct('name','N');
parameters{end+1}=struct('name','oversamp','optional',true,'default_value',1);

opts=struct;

spec=struct( ...
    'name',name, ...
    'version',version, ...
    'inputs',{inputs}, ...
    'outputs',{outputs}, ...
    'parameters',{parameters}, ...
    'opts',opts ...
);
