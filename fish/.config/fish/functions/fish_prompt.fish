function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"ssh"(set_color green)": $user:"''
    end

    echo -n (set_color blue)(prompt_pwd)' '

    set_color -o
    if fish_is_root_user
        echo -n (set_color red)'# '
    end
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end
