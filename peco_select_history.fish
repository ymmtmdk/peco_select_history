function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history --show-time='%y-%m-%d %H:%M> '|peco $peco_flags|sed -e "s/.\{16\}//"|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

