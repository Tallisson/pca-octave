function writeImages(nfig, normImages, meanImage)
	path = "/home/thiago/Mestrado/Disciplinas/semestre-2/Aprendizado-Máquina/imagens-trb-2/FigNorm/";
	[r c] = size(normImages);
	numFiles = c / nfig;

	cont = 1;
	for(r=1:nfig)
		for(c=1:numFiles)
			name = strcat( strcat( int2str(r), "-"), int2str(c) );
			file = strcat( path, strcat( "FigNorm",  name), ".png" );			
			image = reshape(normImages(:, cont++), [67, 67]);
			image = rgb2gray(image);
			imwrite(image, file);
		endfor
	endfor

	imgMean = reshape(meanImage, [67, 67]);
	file = strcat( path, "meanImage.png" );
	imgMean = rgb2gray(imgMean);
	imwrite(imgMean, file);		
endfunction