function ml_phret_spec

curpath=fileparts(mfilename('fullpath'));
addpath([curpath,'/processors']);
addpath([curpath,'/jsonlab-1.5']);

processors={};

pfunctions={...
    @p_saveimage,...
    @p_create_phantom2d...
};

for ii=1:length(pfunctions)
    FF=pfunctions{ii};
    spec0=FF('spec');
    spec0.exe_command=create_exe_command(spec0,curpath);
    processors{end+1}=spec0;
end;

spec=struct('processors',{processors});

json=savejson('',spec);
disp(json);

function exe_command=create_exe_command(spec0,curpath)

pnames={};
for ii=1:length(spec0.inputs)
    pnames{end+1}=spec0.inputs{ii}.name;
end;
for ii=1:length(spec0.outputs)
    pnames{end+1}=spec0.outputs{ii}.name;
end;
for ii=1:length(spec0.parameters)
    pnames{end+1}=spec0.parameters{ii}.name;
end;

struct_string='';
for ii=1:length(pnames)
    pname=pnames{ii};
    if (ii>0)
        struct_string=[struct_string,','];
    end;
    struct_string=[struct_string,"'",pname,"','$",pname,"$'"];
end;

disp(curpath);
disp(struct_string);
str=sprintf("addpath('%s/processors'); p_saveimage(struct(%s));",curpath,struct_string);
exe_command=sprintf('octave --eval "%s"',str);
