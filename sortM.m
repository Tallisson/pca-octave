function matrixReturn = sortM(eigenFaces, eigenValues, mode, quantity)
	sortValues = sort(eigenValues, mode);	
	[rows, cols] = size(eigenValues);
	indexes = zeros(rows, cols);

	for(i=1:quantity)
		value = sortValues(i);
		for(j=1:cols)
			if(value == eigenValues(j))
				indexes(i) = j;
				break;
			endif
		endfor	
	endfor

	[rows, cols] = size(indexes);	
	for(i=1:quantity)
		index = indexes(i);
		matrixReturn(:, i) = eigenFaces(:, index);		
	endfor		
endfunction