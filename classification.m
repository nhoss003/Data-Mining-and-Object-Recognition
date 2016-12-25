img1=imread(’mypool.png’); 
img1(50:50:end, : , : )=0;
img1( : , 50:50:end , : )=0;
image(img1)

[x_pool , y_pool]=ginput(30); 

for i=1:size(x_pool)

red(i)=img1(round(y_pool(i)),round(x_pool(i)),1) 
green(i)=img1(round(y_pool(i)),round(x_pool(i)),2) 
blue(i)=img1(round(y_pool(i)),round(x_pool(i)),3) 
end

red=  transpose(red); 
green=transpose(green); 
blue=  transpose(blue);

[x_not_pool , y_not_pool]=ginput(30); 

for i=1:size(x_pool)

redn(i)=img1(round(y_not_pool(i)),round(x_not_pool(i)),1) 
greenn(i)=img1(round(y_not_pool(i)),round(x_not_pool(i)),2) 
bluen(i)=img1(round(y_not_pool(i)),round(x_not_pool(i)),3) 

end

redn= transpose(redn); greenn=transpose(greenn); 

bluen= transpose(bluen); img2=imread(’img2.png’); 

img2(50:50:end,  : , : )=0;
img2( : , 50:50:end , : )=0;
image(img2)

[x_sample , y_sample]=ginput; 

for i=1:size(x_sample)

reds(i)=img2(round(y_sample(i)),round(x_sample(i)),1) 
greens(i)=img2(round(y_sample(i)),round(x_sample(i)),2) 
blues(i)=img2(round(y_sample(i)),round(x_sample(i)),3) 
end
reds= transpose(reds); 
greens=transpose(greens); 
blues= transpose(blues); 
A=[red,green,blue]; 
B=[redn,greenn,bluen]; 
training=vertcat(A,B); 
sample=[reds,greens,blues];
 

 
for i=1:30 
group1(i)=1; 
group2(i)=0;
end 
group1=transpose(group1); 
group2=transpose(group2);
group=vertcat(group1,group2);

% 2D Plot
scatter(green,  blue,’d’);  hold  on;
scatter(greenn,bluen,’k’),xlabel(’Green’), ylabel(’Blue’),legend(’pool’, ’not pool’)
scatter3(green,  blue,red,’d’);  hold  on; scatter3(greenn,bluen,redn,’k’),xlabel(’Green’),     ylabel(’Blue’), zlabel(’Red’),legend(’pool’, ’not pool’)


class  =  knnclassify(sample,  training,  group)

% ROC curve              a1=[0,0,0.0500,0.1000,0.2000,0.3000,0.4000,0.5000,0.6000,0.8000,1.0000]; a2=[0.1000,0.2000,0.3500,0.5800,0.8000,0.8800,0.9000,0.9200,0.9400,1.0000,1.0000];
plot(a1,a2) hold on
xlabel(’False Negative Rate’), ylabel(’True positive rate’), title(’ROC Curve’)
