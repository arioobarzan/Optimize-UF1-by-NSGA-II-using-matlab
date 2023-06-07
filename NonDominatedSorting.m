function [Rank, Front_Members_Index] = NonDominatedSorting(CostValues)
[Npop,w]=size(CostValues);
Dominated_Counter=zeros(Npop,1);
for i=1 : Npop
    for j=1 : Npop
        if IsDominated(CostValues(i,:),CostValues(j,:))
            Dominated_Counter(j)=Dominated_Counter(j)+1;
        end
    end
end
Rank=Dominated_Counter+1;
Counter=0;
rank1=unique(sort(Rank))';
for j=rank1
    Index_Rank=find(Rank==j);
    if ~isempty(Index_Rank)
        Counter=Counter+1;
    end
    Front_Members_Index{Counter}=Index_Rank;
end