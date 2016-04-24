function [tagged_formation] = minDistTagger(initial_formation, target_formation)
% tags locations of marchers in the target formation by selecting the nearest target one at a time
nb = sum(sum(target_formation));
initial_loc = tagLocationList(initial_formation,nb);
target_loc = locationList(target_formation);
tagged_formation = target_formation;
for tag = nb:-1:2 % iterates through by marcher, tagging the nearest remaining target location
    disp(tag)
    i = initial_loc.row(tag);
    j = initial_loc.col(tag);
    dx = target_loc.row - i;
    dy = target_loc.col - j;
    dist = (dx.^2 + dy.^2).^.5;
    best_dist = find(min(dist)==dist,1);
    i_target = target_loc.row(best_dist);
    j_target = target_loc.col(best_dist);
    tagged_formation(i_target, j_target) = tag;
    target_loc.row(best_dist) = Inf;
    target_loc.col(best_dist) = Inf;
end
