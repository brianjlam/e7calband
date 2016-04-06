function [locations] = tagLocationList(formation, nb)
% creates cell array of the location of each marcher, preserving tags
locations = struct('row',[],'col',[]);
for tag = 1:nb
    [i,j] = find(formation==tag);
    locations.row = [locations.row i];
    locations.col = [locations.col j];
end