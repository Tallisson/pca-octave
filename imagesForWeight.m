function imagesTest = imagesForWeight(images, index)
	cont = 1;
	i = index;
	[rows cols] = size(images);
	while(i <= cols)
		imagesTest(:, cont++) = images(:, i);		
		i = i + index;		
	endwhile
endfunction