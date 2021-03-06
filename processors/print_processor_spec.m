function print_processor_spec(name,inputs,outputs,parameters,opts)

curpath=fileparts(mfilename('fullpath'));
addpath([curpath,'/jsonlab-1.5']);

obj=struct( ...
    'name',name, ...
    'inputs',{inputs}, ...
    'outputs',{outputs}, ...
    'parameters',{parameters}, ...
    'opts',opts ...
);

json=savejson('',obj);
disp(json);

