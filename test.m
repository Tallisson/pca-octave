function test(eigenFaces, trainWeights, meanFace)
	[testImages, testNorm] = readTest(15, 5, meanFace);	
	[rows, cols] = size(testNorm);
	for(i=1:cols)

	endfor
	testWeights = eigenFaces'*testNorm;	
	%'	
	[rows, cols] = size(testWeights);	
	
	cont = 1;
	for(i=1:cols)
		indexD = 1;	
		test = testWeights(:, i);
		for(j=1:cols)
			train = trainWeights(:, j);
			diff = (test - train);
			dist = norm(diff);
			distance(indexD++) = norm(diff);
		endfor

		[rows, cols] = size(distance);
		min = distance(1);
		index = 1;
		for(i=2:cols)
			if(distance(i) < min)
				index = i;
				min = distance(i);
			endif
		endfor		
		similar(cont++) = index;
	endfor
	
	[rows, cols] = size(similar);	
	
	for(i=1:cols)	
		fprintf("Imagem %d pertence a classe %d\n", i, ((similar(i)-1)/5 + 1));		
	endfor
endfunction