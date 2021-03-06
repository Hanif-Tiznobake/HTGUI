classdef HTTab < HTComponent
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        axis
        components
    end
    
    methods
        function obj = HTTab(parent, state)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj=obj@HTComponent(state);
            obj.host(1,1) = uitab(parent);
            obj.host(2,1) = axes(obj.host(1,1),'Box','on');
            set(obj.host(2,1),'NextPlot','add');
            obj.components=gobjects(obj.count,1);
            temp=fieldnames(state.components);
            for i = 1:obj.count
                switch lower(obj.state.components.(temp{i}).class)
                    case 'plot'
                        obj.components(i,1) = plot(obj.host(2,1),NaN,NaN);
                    case 'scatter'
                        obj.components(i,1) = scatter(obj.host(2,1),NaN,NaN);
                    case 'surf'
                        obj.components(i,1) = surf(obj.host(2,1),[NaN,NaN],[NaN,NaN],[NaN,NaN;NaN,NaN]);
                    case 'patch'
                        obj.components(i,1) = fill(obj.host(2,1),NaN,NaN,[0,0,0]);
                    case 'line'
                        obj.components(i,1) = line(obj.host(2,1));
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
            set(obj.host(2,1),'NextPlot','replacechildren');
        end
         
        
        function clear(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            for i = 1:obj.count
                set(obj.components(i,1),...
                    'XData',NaN(size(obj.components(i,1).XData)),...
                    'YData',NaN(size(obj.components(i,1).YData)),...
                    'ZData',NaN(size(obj.components(i,1).ZData)));
            end
        end
    end
end