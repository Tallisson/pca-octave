function [result, eigenVect, eigenVal] = eigenFaces(matCov, normImages)
	[eigenVect, values] = eig(matCov);

	[r,c] = size(values);
	cont = 1;
	for(i=1:r)
		for(j=1:c)
			if(i==j)
				eigenVal(cont) = values(i, j);
				cont++;
			endif
		endfor
	endfor
	
	% Calculando autofaces
	[rows, cols] = size(eigenVect);
	[r, c] = size(normImages);

	cont = 1;
	for(i=1:rows)	
		sum = zeros(r, 1);		
		for(j=1:cols)
			sum = sum + (eigenVect(i, j) * normImages(:, i));					
		endfor
		result(:, cont++) = sum;
	endfor

endfunction