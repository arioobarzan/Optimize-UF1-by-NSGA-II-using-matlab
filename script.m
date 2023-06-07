clc
clear 
close all

%% initialization
popSize = 100;
ArchiveSize = 50;
no = 10;
p_cross = 0.90;
p_mut = 0.05;
Generation = 10000;
itr = 0;
bottom = -5; 
top = 5;
MatingNum = round(popSize*p_cross);
if mod(MatingNum,2)~=0
    MatingNum = MatingNum-1;
end
%% init pop
pop = rand(popSize,no)*(top - bottom) + bottom;               
CostValues = CalculateCost(pop,no);                 

for itr=1:Generation
    Parents = [];
    Dad = [];
    Mom = [];
    Child = [];
    
    [Rank, Front_Members_Index] = NonDominatedSorting(CostValues);
    CrowdingDistance = CalcCrowdingDistance(CostValues,Rank,Front_Members_Index);
    Firts_Front_Index = size(Front_Members_Index{1},1);
    
    for i = 1: MatingNum
        Parents_Temp = SelectionFcn(pop,Rank,CrowdingDistance,MatingNum);
        Parents = [Parents;Parents_Temp];      
    end
    for i = 1 : 2: MatingNum
        Dad = [Dad; Parents(i,:)];               
        Mom = [Mom; Parents(i+1,:)];             
    end
    
    for i = 1 : MatingNum/2
        [Child1, Child2] = CrossOverFcn(Dad(i,:),Mom(i,:));
        Child = [ Child; Child1;  Child2];                       
    end
    Child = max(Child,bottom);
    Child = min(Child,top);
    
    %Mutation
    for i = 1 :  5
        Child = MutationFcn(Child,no,p_mut,bottom,top);
    end
    
    pop = [pop;Child];                                 
    CostValues = CalculateCost(pop,no);
    [pop,CostValues] = DeleteSamePop(pop,CostValues);
    [Rank, Front_Members_Index] = NonDominatedSorting(CostValues);
    CrowdingDistance = CalcCrowdingDistance(CostValues,Rank,Front_Members_Index);
    [pop, CostValues, Rank] = SortPopulation(pop,CostValues,CrowdingDistance,Rank);
    Firts_Front_Number = length(find(Rank == 1));
    
    plot(CostValues(1:Firts_Front_Number,1),CostValues(1:Firts_Front_Number,2),'or');
    grid
    xlabel('First Objective Function')
    ylabel('Second Objective function')
    pause(.05)
    
    pop = pop(1:popSize,:);
    CostValues = CostValues(1:popSize,:);
    itr
   
end

hold on
if Firts_Front_Number <= ArchiveSize 
    plot(CostValues(1:Firts_Front_Number,1),CostValues(1:Firts_Front_Number,2),'r');
else
    plot(CostValues(1:ArchiveSize,1),CostValues(1:ArchiveSize,2),'C');
end
