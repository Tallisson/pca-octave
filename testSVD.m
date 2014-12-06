function testSVD(U, trainWeights, meanFace)
	[testImages, testNorm] = readTest(15, 5, 5, meanFace);	
	[rows, cols] = size(testNorm);

	testWeights = [];
	for(i=1:cols)
		image = double(testNorm(:, i));
		temp = U' * image;
		%'
		testWeights = [testWeights temp];
	endfor
			
	[rows, cols] = size(testWeights);			
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