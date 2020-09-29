%------------------------------------------------------------------------------------------------------------------
% Brihat Ratna Bajracharya
% 19/075
% CDCSIT
%------------------------------------------------------------------------------------------------------------------

function e2q2()
    clearall;
    imtool close all;
    % Exercise 2 Question 2
    function count_nuclei(file_path, file_name)
        if exist([file_path, file_name])
            disp(['For image: ', file_name]);
            nuclei1 = imread(strcat(file_path,file_name));
            imtool(nuclei1)
            % imhist(nuclei1)

            nuclei1_gray = mat2gray(nuclei1);
            T_nuclei1_gray = graythresh(nuclei1_gray);
            nuclei1_gray_binary = im2bw(nuclei1_gray, T_nuclei1_gray);

            imtool(nuclei1_gray_binary)

            [L_nuclei1, num_nuclei1] = bwlabel(nuclei1_gray_binary);

            disp([' Number of nuclei: ', num2str(num_nuclei1)]);

            D_nuclei1 = regionprops(L_nuclei1, 'area');
            area_list_nuclei1 = [D_nuclei1.Area];
            avg_area_nuclei1 = mean(area_list_nuclei1);

            disp([' Avg Area of nuclei: ', num2str(avg_area_nuclei1)]);
            disp(' ');
            % hist(area_list_nuclei1)
        else
            disp(['For image: ', file_name]);
            disp(' This file path is invalid');
            disp(' ');
        end
    end

    count_nuclei('C:\Users\HP\Desktop\IPPLAssignment2\', 'nuclei1.tif')
    count_nuclei('C:\Users\HP\Desktop\IPPLAssignment2\', 'nuclei2.tif')
end
