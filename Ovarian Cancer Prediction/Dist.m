function Dis = Dist(Vec1 , Vec2)
Dis  = sqrt(sum((Vec1 - Vec2) .^ 2));
end