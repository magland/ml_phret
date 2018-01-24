function ml_phret_spec

curpath=fileparts(mfilename('fullpath'));
addpath([curpath,'/processors']);
addpath([curpath,'/jsonlab-1.5']);

processors={};

spec0=p_saveimage('spec');
str=sprintf("cd %s; addpath('processors'); p_saveimage(struct('array','$array$','image_out','$image_out$'));",curpath);
spec0.exe_command=sprintf('octave --eval "%s"',str);
processors{end+1}=spec0;

spec0=p_create_phantom2d('spec');
str=sprintf("cd %s; addpath('processors'); p_create_phantom2d(struct('name','$name$','N','$N$','phantom_out','$phantom_out$'));",curpath);
spec0.exe_command=sprintf('octave --eval "%s"',str);
processors{end+1}=spec0;

spec=struct('processors',{processors});

json=savejson('',spec);
disp(json);