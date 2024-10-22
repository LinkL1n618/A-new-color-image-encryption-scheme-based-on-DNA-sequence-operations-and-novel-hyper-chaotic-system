function [c] = operation_subtracktion_reverse(a,b)
%πÊ‘Ú8
    c='';
    if b=='A'
        if a=='A'
            c='G';
        elseif a=='T'
            c='C';
        elseif a=='C'
            c='T';
        else
            c='A';
        end
    elseif b=='C'
        if a=='A'
            c='T';
        elseif a=='T'
            c='G';
        elseif a=='C'
            c='A';
        else
            c='C';
        end
     elseif b=='T'
        if a=='A'
            c='A';
        elseif a=='T'
            c='C';
        elseif a=='C'
            c='G';
        else
            c='T';
        end
     else
        if a=='A'
            c='A';
        elseif a=='T'
            c='T';
        elseif a=='C'
            c='C';
        else
            c='G';
        end
    end
end