% Ler imagens
[images, meanFace, normImages] = readImages(15, 1, 4);

% Calcula Matriz de covariância
matCov = normImages'*normImages;

%' Calculando autofaces
[eigenFaces, eigenVects, eigenValues] = eigenFaces(matCov, normImages); 

% Selecionar autofaces
selFaces = sortM(eigenFaces, eigenValues, "descend", 18, 4);

% Calculando pesos dos autofaces
imgTestNorm = imagesForWeight(normImages, 4);
trainWeigths = selFaces'*imgTestNorm;

%' Testa com images de teste
test(selFaces, trainWeigths, meanFace);