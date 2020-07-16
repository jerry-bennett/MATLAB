%conditionalExamples.m
clc; clear; close all;

%dummy variable
a = 5;

%conditional statement
if (a > 2)
    
    b = 'True';
    
elseif (a < 0)
    %elseif is optional
    %needs its own comparison
    
    t = 'Else If Code';
    
else 
    %else is optional
    %else does not have its own comparison
    %only happens when if statement above is false
    f = 'False';
    
end