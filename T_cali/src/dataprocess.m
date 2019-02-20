% Level 0 of data process
% 1. Transfer time from character to date format.
% 2. Kick out some error data, including manual porcess.
%=========================================================================%

function result=dataprocess(data, method)
    switch method
        case "Default"
            time=data.rowheaders;
            format='MM/dd/yyyy HH:mm:ss a';
            time=datetime(time, 'InputFormat', format);
            data.rowheaders=time;
            result=data;
    end
end