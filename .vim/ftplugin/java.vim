" General settings
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal formatoptions=crqj
setlocal cindent
setlocal foldmethod=marker
setlocal foldlevel=0
setlocal foldmarker=//{,//}
setlocal cinoptions+=j1      " For java inner classes.
setlocal makeprg=java
compiler javac
let b:dispatch = 'javac %'
