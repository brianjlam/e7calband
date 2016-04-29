function [initial_sub1, initial_sub2, target_sub1, target_sub2] = generateSubproblems(initial_formation, target_formation, split) 
% creates subformations given a splitpoint and the complete initial and
% target formations
initial_sub1 = initial_formation(:,1:split);
initial_sub2 = initial_formation(:,split+1:end);
n = sum(sum(initial_sub1~=0)); % counts number of marchers in subproblem
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