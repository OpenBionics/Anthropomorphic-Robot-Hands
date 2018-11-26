function  [pFlex] = importData1(filename)

delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
Flex = A.data(:,2);
[m,i]=max(Flex);
pFlex = A.data(i-900:i+1700,2);

end