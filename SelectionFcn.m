function Parents = SelectionFcn(Pop,Rank,CrowdingDistance,MatingNum)
Parents = [];
PopSize=size(Pop,2);

% Rank Selection
PDF = (PopSize + 1 -[1:PopSize]')/(PopSize*(PopSize + 1)/2);
PDF = PDF/sum(PDF);
CDF = cumsum(PDF);
IndexSelection=find(rand <= CDF,1,'first');
Parents= [Parents; Pop(IndexSelection,:)];

