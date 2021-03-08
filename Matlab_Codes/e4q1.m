clearall;

mat_8_8 = [3 148 117 148 145 178 132 174;
2 176 174 110 185 155 118 165;
0 100 124 113 193 136 146 108;
0 155 170 106 158 130 178 170;
9 196 138 113 108 127 144 139;
6 188 143 183 137 162 105 169;
9 122 156 119 188 179 100 151;
8 176 137 114 135 123 134 183;];

figure
subplot(2,2,[1 2]);
imshow(mat2gray(mat_8_8, [min(mat_8_8(:)) max(mat_8_8(:))]),'InitialMagnification','fit');
title('Original 8 * 8 Matrix');
threshold = 100;

new_mat_8_8 = mat_8_8 > threshold;
subplot(2,2,3);
imshow(new_mat_8_8,'InitialMagnification','fit');
title(['(a) Threshold = ' num2str(threshold)]);

threshold = 150;
new_mat_8_8 = mat_8_8 > threshold;
subplot(2,2,4);
imshow(new_mat_8_8,'InitialMagnification','fit');
title(['(b) Threshold = ' num2str(threshold)]);
