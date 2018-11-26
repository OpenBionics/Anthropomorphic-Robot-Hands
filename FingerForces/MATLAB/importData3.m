function  [pFlex] = importData3(filename)

delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
Flex = A.data(:,2);
[m,i]=max(Flex);
pFlex = A.data(i-600:i+2000,2);

end