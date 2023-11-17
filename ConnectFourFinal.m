clc
clear

% Initialize scene
my_scene = simpleGameEngine('ConnectFour.png',86,101);
 
% Set up variables to name the various sprites
empty_sprite = 1;
red_sprite = 2;
black_sprite = 3;
gameOver = 0;

board_display = empty_sprite * ones(6,7);
drawScene(my_scene,board_display)
player1Win = false;
player2Win = false;
while gameOver == 0
% Display empty board   

xlabel("Player 1's turn")
[r,c] = getMouseInput(my_scene);
while board_display(r,c) ~= 1
    xlabel('already a piece there, try again')
    [r,c] = getMouseInput(my_scene);
end
while r < size(board_display,1) && board_display(r+1,c) == 1    
    r=r+1;
end
board_display(r,c) = red_sprite;
drawScene(my_scene,board_display)
%Check vertical
for c = 1:7
    for r = 1:3
        if board_display(r,c) == 2 && board_display(r+1,c) == 2 && board_display(r+2,c) == 2 && board_display(r+3,c) == 2
            player1Win = true;
            break
        end
    end
end
%Check horizontal
for c = 1:4
    for r = 1:6
        if board_display(r,c) == 2 && board_display(r,c+1) == 2 && board_display(r,c+2) == 2 && board_display(r,c+3) == 2
            player1Win = true;
            break
        end
    end
end
%Check diagonal (bottom left to upper right)
for c = 1:4
    for r = 1:3
        if board_display(r,c) == 2 && board_display(r+1,c+1) == 2 && board_display(r+2,c+2) == 2 && board_display(r+3,c+3) == 2
            player1Win = true;
            break
        end
    end
end

%Check diagonal (bottom right to upper left)
for c = 4:7
    for r = 1:3
        if board_display(r,c) == 2 && board_display(r+1,c-1) == 2 && board_display(r+2,c-2) == 2 && board_display(r+3,c-3) == 2
            player1Win = true;
            break
        end
    end
end
if player1Win == true
    gameOver = 1;
    xlabel("Player 1 Wins!")
    break;
end

xlabel("Player 2's turn")
[r,c] = getMouseInput(my_scene);
while board_display(r,c) ~= 1
    xlabel('already a piece there, try again')
    [r,c] = getMouseInput(my_scene);
end
while r < size(board_display,1) && board_display(r+1,c) == 1    
    r=r+1;
end
board_display(r,c) = black_sprite;
drawScene(my_scene,board_display)
%Check vertical
for c = 1:7
    for r = 1:3
        if board_display(r,c) == 3 && board_display(r+1,c) == 3 && board_display(r+2,c) == 3 && board_display(r+3,c) == 3
            player2Win = true;
            break
        end
    end
end
%Check horizontal
for c = 1:4
    for r = 1:6
        if board_display(r,c) == 3 && board_display(r,c+1) == 3 && board_display(r,c+2) == 3 && board_display(r,c+3) == 3
            player2Win = true;
            break
        end
    end
end
%Check diagonal (bottom left to upper right)
for c = 1:4
    for r = 1:3
        if board_display(r,c) == 3 && board_display(r+1,c+1) == 3 && board_display(r+2,c+2) == 3 && board_display(r+3,c+3) == 3
            player2Win = true;
            break
        end
    end
end

%Check diagonal (bottom right to upper left)
for c = 4:7
    for r = 1:3
        if board_display(r,c) == 3 && board_display(r+1,c-1) == 3 && board_display(r+2,c-2) == 3 && board_display(r+3,c-3) == 3
            player2Win = true;
            break
        end
    end
end
if player2Win == true
    gameOver = 1;
    xlabel("Player 2 wins!")
end
if ~(ismember(1,board_display)) && player1Win == false && player2Win == false
    gameOver = 1;
    xlabel("It's a tie!")
end             

end
