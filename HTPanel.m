classdef HTPanel < HTComponent
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        components
    end
    
    methods
        function obj = HTPanel(parent, state)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj=obj@HTComponent(state);
            obj.host=uipanel(parent);
            obj.components=gobjects(obj.count,1);
            temp=fieldnames(state.components);
            for i = 1:obj.count
                switch lower(obj.state.components.(temp{i}).class)
                    case 'dropdown'
                        obj.components(i,1) = uidropdown(obj.host);
                    case 'listbox'
                        obj.components(i,1) = uilistbox(obj.host);
                    case 'modify'
                        obj.components(i,1) = uislider(obj.host);
                end
                tempi=fieldnames(obj.state.components.(temp{i}).properties);
                for j=1:size(tempi,1)
                    set(obj.components(i,1),tempi{j},obj.state.components.(temp{i}).properties.(tempi{j}));
                end
            end
            temp=fieldnames(obj.state.properties);
            for i = 1:size(obj.host,1)
                tempi=fieldnames(obj.state.properties.(temp{i}));
                for j = 1:size(tempi,1)
                    set(obj.host(i,1),tempi{j},obj.state.properties.(temp{i}).(tempi{j}));
                end
            end
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

