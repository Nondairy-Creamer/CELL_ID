classdef NeuroPAL
    %NEUROPAL NeuroPAL and worm related data.

    methods (Static)
        %% Utility functions.
        function is_neuron = isNeuron(name)
            %ISNEURON Is this a neuron name?
            is_neuron = ...
                ~isempty(find(strcmp(name, NeuroPAL.getNeurons()),1));
        end
                
        function name = stripOnOff(name)
            %STRIPONOFF Strip the ON/OFF info from the neuron's name.
            if length(name) > 4 && strcmp(name(1:3), 'AWC')
                name = name(1:4);
            end
        end
        
        function names = neuronStartsWith(str)
            %NEURONSTARTSWITH Which neurons start with this string?
            names = [];
            neurons = NeuroPAL.getNeurons();
            i = startsWith(neurons, str);
            if ~isempty(i)
                names = neurons(i);
            end
        end
        
        function color = getNeuronColor(name)
            %GETNEURONCOLOR Get the neuron's NeuroPAL RGB color.
            color = [];
            [names, colors] = NeuroPAL.getColors();
            i = find(strcmp(names, name), 1);
            if ~isempty(i)
                color = colors{i};
            end
        end
        

        %% Neuron data.
        function [names, colors] = getColors()
            %GETCOLORS Get a list of NeuroPAL neuron colors.
            %   names = neuron names
            %   colors = corresponding (R,G,B) color vector
            persistent names_data;
            persistent colors_data;
            if isempty(names_data)
                load('NeuroPAL_herm_data.mat', 'colors');
                names_data = {colors.name}';
                colors_data = {colors.RGB}';
            end
            names = names_data;
            colors = colors_data;
        end
        
        function neurons = getNeurons()
            %GETNEURONS Get a list of neurons.
            persistent neurons_data;
            if isempty(neurons_data)
                load('herm_data.mat', 'neurons');
                neurons_data = neurons;
            end
            neurons = neurons_data;
        end
        
        function classes = getClasses()
            %GETCLASSES Get a list of neuron classes.
            persistent classes_data;
            if isempty(classes_data)
                load('herm_data.mat', 'classes');
                classes_data = classes;
            end
            classes = neurons_data;
        end
        
        
        %% Ganglia data.
        function ganglia = getGanglia()
            %GETGANGLIA Get a list of ganglia info.
            %   A stuct array where:
            %   name = ganglion name
            %   neurons = ganglion neurons
            persistent ganglia_data;
            if isempty(ganglia_data)
                load('herm_data.mat', 'ganglia');
                ganglia_data = ganglia;
            end
            ganglia = ganglia_data;
        end
        
        function names = getGanglionNames()
            %GETGANGLIONNAMES Get a list of ganglion names.
            persistent ganglion_names;
            if isempty(ganglion_names)
                ganglia = NeuroPAL.getGanglia();
                ganglion_names = {ganglia.name}';
            end
            names = ganglion_names;
        end
        
        
        %% Pharyngeal ganglia data.
        function names = getAnteriorPharynx()
            %GETANTERIORPHARYNX A list of anterior pharynx neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Anterior Pharyngeal Bulb'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getPosteriorPharynx()
            %GETPOSTERIORPHARYNX A list of posterior pharynx neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Posterior Pharyngeal Bulb'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        
        %% Head ganglia data.
       function names = getLeftAnteriorGanglion()
            %GETLEFTANTERIORGANGLION A list of left anterior ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Anterior Ganglion (Left)'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getRightAnteriorGanglion()
            %GETRIGHTANTERIORGANGLION A list of right anterior ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Anterior Ganglion (Right)'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getDorsalGanglion()
            %GETDORSALGANGLION A list of dorsal ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Dorsal Ganglion'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getLeftLateralGanglion()
            %GETLEFTLATERALGANGLION A list of left lateral ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Lateral Ganglion (Left)'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getRightLateralGanglion()
            %GETRIGHTLATERALGANGLION A list of right lateral ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Lateral Ganglion (Right)'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getVentralGanglion()
            %GETVENTRALGANGLION A list of ventral ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Ventral Ganglion'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        function names = getRetroVesicularGanglion()
            %GETRETROVESICULARGANGLION A list of retro-vesicular ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Retro-Vesicular Ganglion'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        
        %% Midbody ganglia data.
        function names = getAnteriorMidbody()
            %GETANTERIORMIDBODY A list of anterior midbody neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Anterior Midbody'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getCentralMidbody()
            %GETCENTRALRMIDBODY A list of central midbody neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Central Midbody'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getPosteriorMidbody()
            %GETPOSTERIORMIDBODY A list of posterior midbody neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Posterior Midbody'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getVentralNerveCord()
            %GETVENTRALNERVECORD A list of ventral nerve cord neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Ventral Nerve Cord'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        
        %% Tail ganglia data.        
        function names = getPreAnalGanglion()
            %GETPREANALGANGLION A list of pre-anal ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Pre-Anal Ganglion'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getDorsoRectalGanglion()
            %GETDORSORECTALGANGLION A list of dorso-rectal ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Dorso-Rectal Ganglion'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getLeftLumbarGanglion()
            %GETLEFTLUMBARGANGLION A list of left lumbar ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Lumbar Ganglion (Left)'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
        
        function names = getRightLumbarGanglion()
            %GETRIGHTLUMBARGANGLION A list of right lumbar ganglion neurons.
            persistent neurons;
            if isempty(neurons)
                ganglia = NeuroPAL.getGanglia();
                i = find(strcmp(NeuroPAL.getGanglionNames(), ...
                    'Lumbar Ganglion (Right)'), 1);
                neurons = ganglia(i).neurons;
            end
            names = neurons;
        end
    end
end
