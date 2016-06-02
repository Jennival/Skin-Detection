function bin = skin_detection_using_ycbcr(img_addr, smooth= false)
  img = imread(img_addr);
  [h,w,_] = size(img);
  bin = zeros(h,w);
  [Y, Cb, Cr] = rgb2ycbcr(img);
  
  [y,b,r] = find((138 < Cr & Cr < 180) & Y > 80 & ( Cb > 85 & Cb < 135));

  numid=size(y,1);
  
  for i=1:numid
    bin(y(i),b(i))=1;
  end
  
  if smooth
    fil = ones(3) * 1/9;
    bin = filter2(fil, bin);
  end

  subplot(1,2,1)
  imshow(bin);
  subplot(1,2,2)
  imshow(img)
end

