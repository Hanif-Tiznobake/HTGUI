classdef HTComponent < matlab.mixin.SetGet
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        host
        state
        count
    end
    
    methods
        function obj = HTComponent(state)
            obj=obj@matlab.mixin.SetGet;
            obj.host=gobjects;
            obj.state=state;
            obj.count=size(fieldnames(state.components),1);
        end
        
        function SetProps(obj,props)
            fp=fieldnames(props);
            for i = 1:size(fp,1)
                fpi=fieldnames(props.(fp{i}));
                for j = 1:size(fpi,1)
                    set(obj.host(i,1),fpi{j},props.(fp{i}).(fpi{j}));
                end
            end
        end
        
    end
end

