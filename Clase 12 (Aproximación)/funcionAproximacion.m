function y = funcionAproximacion(x,A,base)
	y = zeros(size(x));
    for j = 1:length(A)
        y = y + A(j)*base{j}(x);
    end
end
