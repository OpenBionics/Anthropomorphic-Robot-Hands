function  [pFlex] = importData4(filename)

delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
Flex = A.data(:,2);
[m,i]=max(Flex);
pFlex = A.data(i-700:i+1900,2);

end