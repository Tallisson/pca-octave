function matrixReturn = sortM(eigenFaces, eigenValues, mode, quantity = -1, index = -1)	
	[rows, cols] = size(eigenValues);		
	if(quantity == -1)
		quantity = cols;
	endif
	indexes = [];
	matrixReturn = [];
	[minV indexMin] = min(eigenValues);

	sortValues = sort(eigenValues, mode);
	
	for(i=1:cols)
		value = eigenValues(i);
		for(j=1:quantity)
			if(value == sortValues(j))								
				indexes = [indexes i];
				matrixReturn = [matrixReturn eigenFaces(:, i)];				
				break;
			endif
		endfor	
	endfor		
endfunction