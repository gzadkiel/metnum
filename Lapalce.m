 rw = input('number of rows: ');
 col = input('number of columns: '); 
 plate = zeros(rw,col) 
 for i=1:rw
   msg = ['value of position: (',num2str(i),',',num2str(1),') '];
   plate(i,1) = input(msg);
   msg = ['value of position: (',num2str(i),',',num2str(col),') '];
   plate(i,end) = input(msg);  
 end
 for i=2:col
   msg = ['value of position: (',num2str(1),',',num2str(i),') '];
   plate(1,i) = input(msg);
   msg = ['value of position: (',num2str(col),',',num2str(i),') '];
   plate(end,i) = input(msg);  
 end
 plate'
 