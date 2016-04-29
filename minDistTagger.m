function [tagged_formation] = minDistTagger(initial_formation, target_formation)
% tags locations of marchers in the target formation by selecting the nearest target one at a time
nb = max(max(initial_formation));
initial_loc = tagLocationList(initial_formation,nb);
target_loc = locationList(target_formation);
tagged_formation = target_formation;
tags = nonzeros(initial_formation)'
for tag = tags % iterates through by marcher, tagging the nearest remaining target location
    i = initial_loc(tag).row;
    j = initial_loc(tag).col;
    dx = target_loc.row - i;
    dy = target_loc.col - j;
    dist = abs(dx) + abs(dy);
    best_dist = find(min(dist)==dist,1);
    i_target = target_loc.row(best_dist);
    j_target = target_loc.col(best_dist);
    tag
    tagged_formation(i_target, j_target) = tag
    target_loc.row(best_dist) = Inf;
    target_loc.col(best_dist) = Inf;
end