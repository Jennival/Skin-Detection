function [Y, Cb, Cr] = rgb2ycbcr(img)
  R = img(:,:,1);
  G = img(:,:,2);
  B = img(:,:,3);

  Y = 0.299*R + 0.587*G + 0.114*B;
  Cb = (B-Y) * 0.564 + 128;
  Cr = (R-Y) * 0.713 + 128;

end
