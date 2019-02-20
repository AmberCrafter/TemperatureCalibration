% Classify data to different calibration point
%=========================================================================%
function data=classify(data, CalibrationPoint)
    index=data.rowheaders;
    refdata=data.data(:,3);
    testdata=data.data(:,5:8);
    
    data={};
    num=0;
    for i=1:size(CalibrationPoint,1)
        dummy=refdata-CalibrationPoint(i);
        n=(abs(dummy)<1);  % defined Calibration Tolerance
        if isempty(dummy(n))
            continue;
        else
            num=num+1;
            data{num,1}=index(n);
            data{num,2}=refdata(n);
            data{num,3}=testdata(n,:);
        end
    end
    
end