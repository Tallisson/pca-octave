function pca(nfig, vector, numComponents, trainIndex = -1, testIndex)
	% Ler imagens
	[images, meanFace, normImages] = readImagesV(nfig, vector);

	% Calcula Matriz de covariância
	matCov = normImages'*normImages;	

	%' Calculando autofaces
	[eigenFaces, eigenVects, eigenValues] = eigenFaces(matCov, normImages, numComponents); 

	% Calculando pesos dos autofaces
	if(trainIndex != -1)		
		[imgs imgTestNorm] = readTest(15, trainIndex, trainIndex, meanFace);
	else
		imgTestNorm = normImages;
	endif	
	trainWeigths = eigenFaces'*imgTestNorm;	
	
	%' Testa com images de teste
	test(eigenFaces, trainWeigths, meanFace, testIndex);	
endfunction

pca(15, [1, 2, 3], 44, 4, 5);