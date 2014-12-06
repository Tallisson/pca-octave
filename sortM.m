function matrixReturn = sortM(eigenFaces, eigenValues, mode, quantity, index)	
	[rows, cols] = size(eigenValues);	
	indexes = [];
	matrixReturn = [];
	[minV indexMin] = min(eigenValues);

	selectValues = [];
	for(i=1:cols)
		if(mod(i, index) != 0 && i != indexMin)			
			selectValues = [selectValues eigenValues(:, i)];
		endif
	endfor

	sortValues = sort(selectValues, mode);	
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
	disp(indexes);			
	
endfunction