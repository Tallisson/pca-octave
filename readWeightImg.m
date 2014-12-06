function nImages = readWeightImg(nfig, nvarI, nvarF, meanFace)
	path = "BASE_Faces/BASE/";
	cont = 1;
	for(i=1:nfig)
	    for(j=nvarI:nvarF)
	        file = strcat( strcat( strcat( strcat( path, int2str(i) ), "." ),  int2str(j)), ".bmp");
	        I  = imread(file);
	        [rows, cols] = size(I);	        
	        images(:, cont++) = double(reshape(I, [1, (rows*cols)] ));	        	        
	    endfor
	endfor

	[rows, cols] = size(images);
	for(j=1:cols)	
		nImages(:, j) = images(:, j)-meanFace';
	endfor	
endfunction