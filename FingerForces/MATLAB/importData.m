function  [pFlex] = importData(filename)

delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
Flex = A.data(:,2);
[m,i]=max(Flex);
pFlex = A.data(i-400:i+2200,2);

end