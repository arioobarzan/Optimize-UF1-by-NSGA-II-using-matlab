function CostValues = CalculateCost(Pop,NPar)
P_Size = size(Pop,1);
CostValues = zeros(P_Size,2);
x=Pop;            
x2 = x(:,1).*x(:,1);
y2 = x(:,2).*x(:,2);
for i = 1 : P_Size%             
    CostValues(i,1) = 0.5*(x2(i,1)+y2(i,1)) + sin(x2(i,1)+y2(i,1));
    CostValues(i,2) = (3*x(i,1)-2*x(i,2)+4).^2/8 + (x(i,1)-x(i,2)+1.0).^2/27 + 15.0;
    CostValues(i,3) = 1.0/(x2(i,1)+y2(i,1)+1) - 1.1*exp(-(x2(i,1) + y2(i,1)));
end 