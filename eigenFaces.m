function [result, eigenVect, eigenVal] = eigenFaces(matCov, normImages, numComponents)
	[eigenVect, values] = eig(matCov);
	[r,c] = size(values);
	cont = 1;
	for(i=1:r)
		for(j=1:c)
			if(i==j)
				eigenVal(cont++) = values(i, j);
			endif
		endfor
	endfor	

	% Ordenando autovetores 
	sortValues = sort(eigenVal, "descend");
	indexes = [];
	selVects = [];		
	[rows cols] = size(eigenVal);
	[minV indexMin] = min(eigenVal);
	for(j=1:numComponents)
		value = sortValues(j);
		for(i=1:cols)
			if(value == eigenVal(i))				
				indexes = [indexes i];
				selVects = [selVects eigenVect(:, i)];											
				break;
			endif
		endfor
	endfor	

	% Calculando autofaces
	[rows, cols] = size(selVects);
	[r, c] = size(normImages);
	cont = 1;	
	
	for(i=1:c)	
		sum = zeros(r, 1);		
		for(j=1:cols)
			sum = sum + (selVects(i, j) * normImages(:, i));					
		endfor
		result(:, cont++) = sum;
	endfor
endfunction