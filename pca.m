function pca(nfig, vector, nSelFaces, trainIndex = -1, testIndex)
	% Ler imagens
	[images, meanFace, normImages] = readImagesV(nfig, vector);

	% Calcula Matriz de covariância
	matCov = normImages'*normImages;

	%' Calculando autofaces
	[eigenFaces, eigenVects, eigenValues] = eigenFaces(matCov, normImages); 

	% Selecionar autofaces
	%selFaces = sortM(eigenFaces, eigenValues, "descend", nSelFaces, trainIndex);
	selFaces = sortM(eigenFaces, eigenValues, "descend", nSelFaces, -1);

	% Calculando pesos dos autofaces
	if(trainIndex != -1)
		%imgTestNorm = imagesForWeight(normImages, trainIndex);
		[imgs imgTestNorm] = readTest(15, trainIndex, trainIndex, meanFace);
	else
		imgTestNorm = normImages;
	endif	
	trainWeigths = selFaces'*imgTestNorm;
	
	%' Testa com images de teste
	test(selFaces, trainWeigths, meanFace, testIndex);
endfunction

pca(15, [1, 2, 3], 44, 4, 5);