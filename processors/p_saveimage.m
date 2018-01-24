function ret=p_saveimage(params)

if (ischar(params))&&(strcmp(params,'spec'))
    ret=get_spec();
    return;
end;

X=arrayify(params.array);
run_processor(X,params.image_out,params.title);

function run_processor(X,fname,title0)

f = figure('visible','off');
imagesc(X');
title(title0);
print(f,'-dpng',fname);

function spec=get_spec

name='phret.saveimage';

inputs={};
inputs{end+1}=struct('name','array');

outputs={};
outputs{end+1}=struct('name','image_out');

parameters={};
parameters{end+1}=struct('name','title');

opts=struct;

spec=struct( ...
    'name',name, ...
    'inputs',{inputs}, ...
    'outputs',{outputs}, ...
    'parameters',{parameters}, ...
    'opts',opts ...
);
