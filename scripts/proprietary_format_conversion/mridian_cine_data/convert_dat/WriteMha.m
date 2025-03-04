function WriteMha(fn,A,offset,spacing,type)
%   fn        full filename
%   A         Volume of size 3 (image) or 4 (DVF)
%   offset    Image origin
%   spacing   Image resolution
%   type      'uchar','float', or 'short'

Asz = size(A);

switch (ndims(A))
 case 3,
 case 4,
  if (size(A,4) ~= 3)
    error ('Sorry, a 4D volume must be a vector field');
  end
 otherwise
  error ('Sorry, only 3D & VF volumes supported');
end

fp = fopen(fn,'w');
if (fp == -1)
  error ('Cannot open mha file for writing');
end

fprintf (fp,'ObjectType = Image\n');
fprintf (fp,'NDims = 3\n');
fprintf (fp,'BinaryData = True\n');
fprintf (fp,'BinaryDataByteOrderMSB = False\n');
fprintf (fp,'Offset = ');
fprintf (fp,' %g',offset);
fprintf (fp,'\n');
fprintf (fp,'ElementSpacing = ');
fprintf (fp,' %g',spacing);
fprintf (fp,'\n');
fprintf (fp,'DimSize = ');
fprintf (fp,' %d',Asz(1:3));
fprintf (fp,'\n');
fprintf (fp,'AnatomicalOrientation = RAI\n'); % probably not the correct orientation
if (ndims(A) == 4)
  fprintf(fp,'ElementNumberOfChannels = 3\n');
end
fprintf (fp,'TransformMatrix = 1 0 0 0 1 0 0 0 1\n');
fprintf (fp,'CenterOfRotation = 0 0 0\n');

% This works for 3D (A stays the same), and 4D (shift left 1)
A = shiftdim(A,3);

switch(lower(type))
 case 'uchar'
  fprintf (fp,'ElementType = MET_UCHAR\n');
  fprintf (fp,'ElementDataFile = LOCAL\n');
  fwrite (fp,A,'uint8');
 case 'short'
  fprintf (fp,'ElementType = MET_SHORT\n');
  fprintf (fp,'ElementDataFile = LOCAL\n');
  fwrite (fp,A,'int16');
 case 'ushort'
  fprintf (fp,'ElementType = MET_USHORT\n');
  fprintf (fp,'ElementDataFile = LOCAL\n');
  fwrite (fp,A,'uint16');
 case 'uint32'
  fprintf (fp,'ElementType = MET_UINT\n');
  fprintf (fp,'ElementDataFile = LOCAL\n');
  fwrite (fp,A,'uint32');
 case 'float'
  fprintf (fp,'ElementType = MET_FLOAT\n');
  fprintf (fp,'ElementDataFile = LOCAL\n');
  fwrite (fp,A,'real*4');
   case 'int'
  fprintf (fp,'ElementType = MET_INT\n');
  fprintf (fp,'ElementDataFile = LOCAL\n');
  fwrite (fp,A,'int32');
  case 'double'
  fprintf (fp,'ElementType = MET_DOUBLE\n');
  fprintf (fp,'ElementDataFile = LOCAL\n');
  fwrite (fp,A,'real*8');
 otherwise
  fclose(fp);
  error ('Sorry, unsupported type');
end

fclose(fp);
