function [Pop,CostValues] = DeleteSamePop(Pop,CostValues)

Archive_Size = size(Pop,1);
Counter = [];
for i = 1 : Archive_Size - 1
    for j = i + 1 : Archive_Size
        if all(Pop(i,:) == Pop(j,:)) && all(Pop(j,:) ~= 0)
            Counter = [Counter, j];
            Pop(j,:) = 0;
        end
    end
end
Counter = unique(Counter);
Pop(Counter,:) = [];
CostValues(Counter,:) = [];
    
end
