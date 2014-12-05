% Ler imagens
[images, meanFace, normImages] = readImages(15, 5);

% Calcula Matriz de covariância
matCov = normImages'*normImages;

%' Calculando autofaces
[eigenFaces, eigenVects, eigenValues] = eigenFaces(matCov, normImages); 

% Selecionar autofaces
selFaces = sortM(eigenFaces, eigenValues, "descend", 10);

% Calculando pesos dos autofaces
trainWeigths = selFaces'*normImages;

%' Testa com images de treinamento
test(selFaces, trainWeigths, meanFace);