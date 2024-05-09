% Specify the directory containing the images
directory = 'C:\Users\user\Desktop\Github Projects\matlab-deep-learning-designer';

% List all files in the directory
files = dir(fullfile(directory, '*.jpg'));

% Specify the target size
targetSize = [227, 227, 3];

% Loop through each file in the directory
for i = 1:length(files)
    % Read the image
    filename = fullfile(directory, files(i).name);
    img = imread(filename);
    
    % Resize the image
    resizedImg = imresize(img, targetSize(1:2));
    
    % If the image is grayscale, convert it to RGB by replicating the
    % grayscale values across all color channels
    if size(resizedImg, 3) == 1
        resizedImg = repmat(resizedImg, [1, 1, 3]);
    end
    
    % Save the resized image
    imwrite(resizedImg, filename);
end