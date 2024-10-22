function [c] = operation_addition(a,b)
%πÊ‘Ú4
    c='';
    if b=='A'
        if a=='A'
            c='C';
        elseif a=='T'
            c='G';
        elseif a=='C'
            c='A';
        else
            c='T';
        end
    elseif b=='C'
        if a=='A'
            c='A';
        elseif a=='T'
            c='T';
        elseif a=='C'
            c='C';
        else
            c='G';
        end
     elseif b=='T'
        if a=='A'
            c='G';
        elseif a=='T'
            c='C';
        elseif a=='C'
            c='T';
        else
            c='A';
        end
     else
        if a=='A'
            c='T';
        elseif a=='T'
            c='A';
        elseif a=='C'
            c='G';
        else
            c='C';
        end
    end
end