function test(eigenFaces, trainWeights, meanFace, testIndex)
	[testImages, testNorm] = readTest(15, testIndex, testIndex, meanFace);	
	[rows, cols] = size(testNorm);
	
	testWeights = eigenFaces'*testNorm;	
	%'		
	[rows, cols] = size(testWeights);		
	disp(size(testWeights));
	cont = 1;
	similar = [];
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
	endfor
	
	[rows, cols] = size(similar);	
	
	for(i=1:cols)	
		%fprintf("Imagem %d pertence a classe %d\n", i, ((similar(i)-1)/5 + 1));		
		fprintf("Imagem %d similar a imagem %d\n", i, similar(i));		
	endfor
endfunction