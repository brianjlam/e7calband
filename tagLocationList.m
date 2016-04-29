function [locations] = tagLocationList(formation, nb)
% creates cell array of the location of each marcher, preserving tags
locations = repmat(struct('row',[],'col',[]), 1, nb);
for tag = 1:nb
    try
        [i,j] = find(formation==tag);
    catch
        i = Inf;
        j = Inf;
    end
    locations(tag).row = i;
    locations(tag).col = j;
end