function matrixReturn = sortM(eigenFaces, eigenValues, mode, quantity = -1, index = -1)	
	[rows, cols] = size(eigenValues);		
	if(quantity == -1)
		quantity = cols;
	endif
	indexes = [];
	matrixReturn = [];
	[minV indexMin] = min(eigenValues);


	i = index;
	values = [];
	while(i <= 60)
		values = [values i];
		i += 4;
	endwhile	
	[r, c] = size(values);

	selectValues = [];		
	cont = 1;
	for(i=1:cols)			
		value = values(cont);
		if(index == -1 || (i != value && i != indexMin))			
			selectValues = [selectValues eigenValues(:, i)];									
		else
			if(i == value)
				if(cont < c)				
					cont++;
				endif
			endif
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
	
endfunction