function [Pop, CostValues, Rank] = SortPopulation(Pop,CostValues,CrowdingDistance,Rank)
[~, inx] = sort(CrowdingDistance,'descend');
Pop=Pop(inx,:);
CostValues=CostValues(inx,:);
Rank=Rank(inx,:);

[Rank, inx] = sort(Rank);
Pop=Pop(inx,:);
CostValues=CostValues(inx,:);

end
