% Use the Standard Deviation to find the static range
% NOTICE !!!
% 1. This method is the simplist. 
% 2. This method only depend on REFERENCE SENSOR.
%=========================================================================%
% Principle
% 1. Enougth numbers of CONTINUE data to calculate.
% 2. Find out one or more minimun std. to be the calibation range of the
%    calibration point.
% 3. Kick out the time with the error data about any reference sensor or
%    testing sensor before.
%=========================================================================%
% ReadMe
% data : input the calibration data.
% numbers_data : defind how many data want to be calibration samples.
% timesolution : Defind the calibration data time interval, if not same, be
%                do some process before.
%=========================================================================%
function result=stdmethod(data, numbers_data, timesolution)
    correct_interval=numbers_data*timesolution;
    for i=1:size(data,1)
        index=data{i,1};
        refdata=data{i,2};
        for j=1:size(refdata)-numbers_data
            interval(j)=index(j+numbers_data-1)-index(j);
%             dummy(j)=sum(refdata(j:j+numbersofdata-1));
            dummy(j)=std(refdata(j:j+numbers_data-1));
        end
        n=find(interval==correct_interval);
        
        data{i,1}=index(n)';
        data{i,2}=dummy(n)'
    end
    result=data;
end