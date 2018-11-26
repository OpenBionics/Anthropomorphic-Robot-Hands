function  [pFlex] = importData2(filename)

delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
Flex = A.data(:,2);
[m,i]=max(Flex);
pFlex = A.data(i-800:i+1800,2);

end