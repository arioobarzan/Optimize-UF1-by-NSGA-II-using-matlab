function Child = MutationFcn(Child,NPar,pmut,VarLow,VarHigh)

nmu=ceil(pmut*NPar);
j=randsample(NPar,nmu);
k=randi([1 size(Child,1)]);
Child (k,j) = VarLow + (VarHigh - VarLow )*rand(1,length(j));
end
    