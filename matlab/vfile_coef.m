mark1 = '// 64 coef begin';
mark2 = '// 64 coef end';

fid = fopen('../src/fir_12bit.v','rt');
num = 1;
a = {};
while ~feof(fid)
   tline = fgetl(fid);
   a(num) = { tline };
   num = num+1;
end

a(1) = {['//',datestr(now,0)]};

fclose(fid);

load coef_scale.mat;

for n = 18:81
    
    a(n) = {['    assign coef[',num2str((n-18)),'] = ',num2str(coef_scale(n-17)),';']};
    
end
fid = fopen('../src/fir_12bit.v','wt');
   
for n = 1:length(a)
    
    fprintf(fid,'%s\n',cell2mat(a(n)));
    
end
fclose(fid);