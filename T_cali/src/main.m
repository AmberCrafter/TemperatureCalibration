clc,clear
%=========================================================================%
% Maker:³¯«Â¾§
%
%
%
%=========================================================================%
% Add lib file
addpath("../lib/");
%=========================================================================%
% Config
filepath="../config/config.json";
config=jsonreader(filepath);

% Read Data
rawdata=importdata([config.filepath config.filename],';');

% Data Process
data=dataprocess(rawdata, "Default");

% Classify Data
data=classify(data,config.CalibrationPoint);

% Find Static range (depend on reference sensor)
%datainterval=duration(0,0,10);
%data=stdmethod(data, 100, datainterval);