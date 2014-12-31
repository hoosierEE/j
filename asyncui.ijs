NB. acyncui - asynchronous GUI demo
NB. see http://www.jsoftware.com/jwiki/Guides/Asynchronous_GUI
NB. 11/25/06 Oleg Kobchenko

require 'gl2'
coclass 'pasyncui'
coinsert 'jgl2'

F=: 0 : 0
pc f;pn "Asynchronous GUI";
xywh 6 6 121 50;cc logbox editm ws_hscroll ws_vscroll es_autohscroll es_autovscroll es_readonly rightmove bottommove;
xywh 6 62 160 11;cc stbox isigraph topmove rightmove bottommove;
xywh 132 6 34 11;cc proc button leftmove rightmove;cn "Process";
pas 6 6;pcenter;
rem form end;
)

create=: 3 : 0
  NPROC=: 0
  LOG=: ''
  wd F
  wd 'pshow;'
  HWNDP=: 0".wd 'qhwndp'
  f_proc_button ''
)

destroy=: 3 : 0
  wd 'pclose'
  codestroy''
)

f_close=: destroy

f_proc_button=: 3 : 0
  NPROC=: NPROC+1
  wd 'setenable proc 0'
  for_i. 1+i.3 do.
    log 'begin ',(":NPROC+0.1*i),' ...'
    doItem 1
    log 'end '
    doItem 0.5
  end.
  wd 'setenable proc 1'
)

log=: 3 : 0
  LOG=: (-32<.#LOG) {. LOG=: LOG,<y
  wd 'set logbox *',;,&LF&.>LOG
  wd 'setselect logbox ',":0,~2#1e6
  f_stbox_paint ''
  glpaint ''
  wd 'msgs'    NB. comment this line to see effect
)

f_stbox_paint=: 3 : 0
  glclear ''
  glfont PROFONT
  gltextxy 2 2
  gltext >@{:LOG
)

doItem=: 3 : 0
  6!:3 y
)

NB. =========================================================
cocurrent 'base'
f=: '' conew 'pasyncui'
