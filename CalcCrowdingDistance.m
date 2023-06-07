function CrowdingDistance = CalcCrowdingDistance(CostValues,Rank,Front_Members_Index)

N_Obj=size(CostValues,2);
N_of_Fronts = size(Front_Members_Index,2);
CrowdingDistance = zeros(length(Rank),1);
for i = 1 : N_of_Fronts
    CostValues_Temp = CostValues(Front_Members_Index{i},:);
    D=zeros(size(CostValues_Temp));
    for j = 1: N_Obj
        [SCj Index] = sort(CostValues_Temp(:,j));
        D(Index(1),j) = inf;
        D(Index(end),j) = inf;
        D(Index(2:end-1),j) = (SCj(3:end)-SCj(1:end-2))/(SCj(end)-SCj(1));
        
    end
    
    D=sum(D,2);
    for j = 1 : length(Front_Members_Index{i})
        CrowdingDistance(Front_Members_Index{i}(j)) = D(j);
    end
    
end

end