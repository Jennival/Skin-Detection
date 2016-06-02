function run(alg=2)
%Run this function to run one of the different algorithms of skin detection
%alg parameter takes either 1 or 2 which respectively represent HSV and YCbCr algorithms
  listing = dir('InputImages');
  
  for i= 1:size(listing,1)
    if ~strcmpi(listing(i).name, '.') && ~strcmpi(listing(i).name, '..')
      tic
      if alg == 1
	img = skin_detection_using_hsv(strcat('InputImages/', listing(i).name));
      elseif alg == 2
	img = skin_detection_using_ycbcr(strcat('InputImages/', listing(i).name));
      end
      toc
      imwrite(img, strcat('OutputImages/', listing(i).name));
      fprintf('Application paused. Press some key to continue\n')
      pause;
    end
  end
