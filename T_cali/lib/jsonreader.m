% ReadConfig
%=========================================================================%
function config=jsonreader(filepath)
%     config="../config/config.json";
    config=filepath;
    fid=fopen(config);
    config=fread(fid,inf);
    config=char(config');
    fclose(fid);
    config=jsondecode(config);
end