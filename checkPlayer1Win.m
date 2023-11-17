function w = checkPlayer1Win(board_display,player1Win)
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
    w = 1;
else
    w = 0;
end