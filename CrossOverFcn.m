function [Child1 Child2] = CrossOverFcn(Dady,Momy)
% Arithmetic Crossover
    Alpha = rand;
    Child1 = Alpha*Dady + (1-Alpha)*Momy;
    Child2 = Alpha*Momy + (1-Alpha)*Dady;
end

