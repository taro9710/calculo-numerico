function setup()
	% Detecta la ubicación REAL del archivo startup.m
    projectRoot = fileparts(mfilename('fullpath'));
    % Agrega todo el proyecto
    addpath(genpath(projectRoot));
    disp("Proyecto inicializado correctamente.");
end
