function [instructions] = calband_transition(initial_formation,target_formation,max_beats)
% main function
disp(initial_formation)
tag_targetform = tagFormation(initial_formation, target_formation)
nb = sum(sum(target_formation));
instructions = struct('i_target',[],'j_target',[],'wait',[],'direction',[]);
instructions = repmat(instructions,1,nb);
for tag = 1:nb
    disp(tag)
    [i_initial,j_initial] = find(initial_formation == tag); % finds initial coords of marcher
    [i_target,j_target]   = find(tag_targetform == tag); % finds final coords
    dRow = i_target - i_initial;
    dCol = j_target - j_initial;
    if dRow == 0 && dCol == 0 % when no move is needed
        direction = '.';
        wait = max_beats;
    else % case when move needed
        if dRow < 0
            dirWE = 'W';
        elseif dRow > 0
            dirWE = 'E';
        else
            dirWE = '';
        end
        
        if dCol < 0
            dirSN = 'S';
        elseif dCol > 0
            dirSN = 'N';
        else
            dirSN = '';
        end
        wait = 0;
        direction = strcat(dirWE,dirSN)
    end
    instructions(tag).i_target = i_target;
    instructions(tag).j_target = j_target;
    instructions(tag).direction = direction;
    instructions(tag).wait = wait;
end