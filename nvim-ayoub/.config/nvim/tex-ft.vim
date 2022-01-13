set errorformat=%f:%l:%c:%m
function Latex()
    update
    let file=expand('%:t:r')
    let errors=system('latex --interaction nonstopmode '.file.' |latex-errorfilter')
    if errors==""
        echo 'LaTeX ok: No warning/error'
    else
        cexpr errors
    endif
endfunction 
