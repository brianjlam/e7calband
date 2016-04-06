function [locations] = locationList(formation)
% creates cell array of the location of each marcher
locations = struct('row',[],'col',[]);
[rows, cols] = size(formation);
for row = 1:rows
    for col = 1:cols
        if formation(row,col)
            locations.row = [locations.row row];
            locations.col = [locations.col col];
        end
    end
end