mat_44 = [4, 5, -9, -5;
          3, -7, 1, 2;
          6, -1, -6, 1;
          3, -1, 7, -5;]

[row column] = size(mat_44);

fft_array = zeros(4, 4);

for iter = [1:row]
    disp(['DFT of row ', num2str(iter), ': ']);
    fft_array(iter, :) = fft(mat_44(iter,:));
    disp(fft_array(iter, :))
end
