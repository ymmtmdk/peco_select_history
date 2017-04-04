function peco_select_history
  if test (count $argv) -gt 0
    set flags --query "$argv"
  end

  history merge
  history --show-time='%y-%m-%d %H:%M> '| peco --layout=bottom-up $flags | sed -e "s/.\{16\}//"| read foo

  if [ $foo ]
    commandline $foo
  end
end
