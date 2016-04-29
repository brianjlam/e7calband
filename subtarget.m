function [target_sub1, target_sub2] = subtarget(initial_sub, target_formation) 
n = sum(sum(initial_sub~=0)); % counts number of marchers in subproblem
[rows, cols] = size(target_formation);
% creates target formation of the leftmost n marchers
target_sub1 = zeros(rows, cols);
target_sub2 = zeros(rows, cols);
for i = 1:numel(target_formation)
    if sum(sum(target_formation(1:i))) == n
        splitpoint = i;
        break
    end
end
target_sub1(1:splitpoint) = target_formation(1:splitpoint);
target_sub2(splitpoint+1:end) = target_formation(splitpoint+1:end);