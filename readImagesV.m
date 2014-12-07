% Ler vetoriza e normaliza imagens
function [images, meanFace, normImages] = readImagesV(nfig, vector)
	path = "BASE_Faces/BASE/";
	cont = 1;
	[r c] = size(vector);	
	for(i=1:nfig)
	    for(j=1:c)
	    	value = vector(j);
	        file = strcat( strcat( strcat( strcat( path, int2str(i) ), "." ),  int2str(value)), ".bmp");	        
	        I  = imread(file);
	        [rows, cols] = size(I);	        
	        images(:, cont++) = double(reshape(I, [1, (rows*cols)] ));	        	        	        
	    endfor
	endfor

	[rows, cols] = size(images);
	meanFace = mean(images');
	% '	
	for(j=1:cols)	
		normImages(:, j) = images(:, j)-meanFace';
	endfor	
endfunction