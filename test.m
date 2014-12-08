function test(eigenFaces, trainWeights, meanFace, testIndex)
	[testImages, testNorm] = readTest(15, testIndex, testIndex, meanFace);	
	[rows, cols] = size(testNorm);
	
	testWeights = eigenFaces'*testNorm;	
	%'		
	[rows, cols] = size(testWeights);		
	
	cont = 1;
	similar = [];	
	hints = 0;
	errors = 0;
	for(i=1:cols)		
		distance = [];
		test = double(testWeights(:, i));
		for(j=1:cols)
			train = trainWeights(:, j);
			diff = (test - train);
			dist = norm(diff)^2;
			distance = [distance dist];
		endfor

		[distMin, indexMin] = min(distance);				
		similar = [similar indexMin];
		if(i == indexMin)
			hints++;
		else
			errors++;
		endif
	endfor

	[rows, cols] = size(similar);		
	for(i=1:cols)			
		fprintf("Imagem %d similar a imagem %d\n", i, similar(i));		
	endfor
	fprintf("Acertos: %d, Erros: %d e Acurácia = %f\n", hints, errors, 1.0*(hints/cols));
endfunction