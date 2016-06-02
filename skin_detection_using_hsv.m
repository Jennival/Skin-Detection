function out = skin_detection_using_hsv(img_addr, smooth= false)
  img =imread(img_addr);
  [m,n,_] = size(img);
  out=ones(m,n);
  hsv=rgb2hsv(img);
  h=hsv(:,:,1);
  s=hsv(:,:,2);
   
  [r c v]=find(h>0.10 | s<=0.27 | s>0.78); %non skin
  numid=size(r,1);
  
  for i=1:numid
    out(r(i),c(i))=0;
  end
  if smooth
    fil = ones(3) * 1/9;
    out = filter2(fil, out);
  end
  
  subplot(1,2,1)
  imshow(img);
  subplot(1,2,2)
  imshow(out);
