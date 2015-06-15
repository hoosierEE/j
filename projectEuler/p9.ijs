
p9 =: 3 : 0
    val =. 1000
    ans =: 0
    for_a. >:i.(val) do.
        for_b. a+>:i.((val)-a) do.
            c =: 1000 -+/b,a
            if. (*:c) = ((*:a)+(*:b)) do.
                ans =: a;b;c
                goto_ex.
            end.
        end.
    end.
    label_ex.
    echo ans
)

p9''
