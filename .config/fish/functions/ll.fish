# Defined in - @ line 1
function ll --description 'alias ll=exa --long --header --git -a --group-directories-first --group'
	exa --long --header --git -a --group-directories-first --group $argv;
end
