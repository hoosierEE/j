NB. fscgidemo.ijs      - fastcgi/scgi server

load 'socket'
load '~system\extras\migrate\socket.ijs'

9!:7 '+++++++++|-'    NB. ascii box

cocurrent 'base'
cocurrent 'z'

SKMAX=: 25000

NB. for debug, turn off for stress test
NB. DEBUGPRT=: (i.0 0)"_
DEBUGPRT=: 1!:2&2

HOMEDIR=: '/home/bill/cgi-bin'
TERMINATE=: 0
NB. only win32 support socket event, should turn off for stress test
SDASYNC=: 0 ] IFWIN32 *. -. IFCONSOLE +. IFJAVA

NB. =========================================================
NB. cgiparms v. return cgi parameters
cgiparms=: 3 : 0
select. <REQUEST_METHOD
case. 'GET' do.
  p=. QUERY_STRING
case. 'POST' do.
  p=. POST_DATA
case. do.
  p=. ''
end.
cgiparms1 p
)

NB. =========================================================
NB. cgiparms1 v. parse parameter string
cgiparms1=: 3 : 0
y=. ' ' (I. y = '+') } y
y=. <;._1 '&', y
ndx=. y i.&> '='
nms=. ndx {. &.> y
val=. (ndx+1) }. &.> y
cgiparms2 &.> nms,.val
)

NB. =========================================================
NB. cgiparms2 v. url decode
cgiparms2=: 3 : 0
if. -. '%' e. y do. y return. end.
y=. <;._1 '%00', y
a=. '0123456789abcdef0123456789ABCDEF'
p=. a. {~ 16 #. 16 | a i. 2 {.&> y
}. ; p ,&.> 2 }.&.> y
)

NB. =========================================================
NB. cgitest v. defines html with a timestamp and cgi parameters
cgitest=: 3 : 0
require 'dates'
stdout 'Status: 200 OK', LF
stdout 'Content-type: text/html',LF,LF,'<html><body><pre>',LF
stdout LF,~'internal'
stdout LF,~":6!:0''
stdout ,LF,.~":cgiparms''
stdout ,LF,.~":3 4$calendar {. 6!:0 ''
NB. for testing
NB. stdout ,LF,.~2000 2000$'abcdefg'
NB. stdout LF,~'ABCDEFG'
stdout '</pre></body></html>'
)

NB. =========================================================
NB. crc v. length and crc of POST_DATA
crc=: 3 : 0
stdout 'Status: 200 OK', LF
stdout 'Content-type: text/html',LF,LF,'<html><body><pre>',LF
stdout LF,~'length: ', ": #POST_DATA
stdout LF,~'crc: ', ": 128!:3 POST_DATA
stdout '</pre></body></html>'
)

cgi404=: 3 : 0
stdout 'Status: 404 OK', LF
stdout 'Content-type: text/html',LF,LF,'<html><body><pre>',LF
stdout LF,~'File not found'
stdout '</pre></body></html>'
)

NB. scgi
NB. ---------------------------------------------------------
parse_scgi=: 4 : 0
QUERY_STRING=: REQUEST_METHOD=: REQUEST_URI=: ''  NB. if http server forget to set them
len=. x
env=. _2]\ <;._2 (i.len){y
NB. for debug
DEBUGPRT env
(,{."1 env)=: {:"1 env
POST_DATA=: (1+len)}.y
)

read_scgi=: 3 : 0
buf=: buf, y
if. _1=headlen do.
  if. ':' e. buf do.
    headlen=: 0&". buf {.~ a=. i.&':' buf
    buf=: (1+a)}.buf
  else.
    0 return.
  end.
end.
if. (#buf) < 1+headlen do. 0 return. end.
if. _1=datalen do.
  if. (15{.buf)-.@-:'CONTENT_LENGTH',{.a. do. assert. 0 end.
  datalen=: 0&". b {.~ a=. i.&({.a.) (b=. 15}.buf)
end.
if. (#buf) < 1+headlen+datalen do. 0 return. end.
1
)

do_scgi=: 3 : 0
headlen parse_scgi buf
do_fscgi ''
)

NB. fastcgi
NB. ---------------------------------------------------------
FCGI_REQUEST_COMPLETE=: 0
FCGI_CANT_MPX_CONN=: 1
FCGI_OVERLOADED=: 2
FCGI_UNKNOWN_ROLE=: 3

FCGI_MAX_CONNS=: 'FCGI_MAX_CONNS'
FCGI_MAX_REQS=: 'FCGI_MAX_REQS'
FCGI_MPXS_CONNS=: 'FCGI_MPXS_CONNS'

FCGI_BEGIN_REQUEST=: 1
FCGI_ABORT_REQUEST=: 2
FCGI_END_REQUEST=: 3
FCGI_PARAMS=: 4
FCGI_STDIN=: 5
FCGI_STDOUT=: 6
FCGI_STDERR=: 7
FCGI_DATA=: 8
FCGI_GET_VALUES=: 9
FCGI_GET_VALUES_RESULT=: 10
FCGI_UNKNOWN_TYPE=: 11

NB. monadic: FCGI_GET_VALUES_RESULT (management record)
NB. dyad: normal REQUEST
enc_fcgi=: 3 : 0
fcgi_id=. 0
s=. ''
if. #y do.
  recs=. _65535]\ y
  for_a. recs do.
    if. (65535<#y) *. a_index = <:#recs do. a=. (_65535|#y)}.a end.
    s=. s, a,~ a.{~ , 256 (#.^:_1) (256+FCGI_GET_VALUES_RESULT),fcgi_id,(#a),0
  end.
end.
s=. s, a.{~ , 256 (#.^:_1) (256+FCGI_GET_VALUES_RESULT),fcgi_id,(0),0
:
fcgi_id=. x
s=. ''
if. #y do.
  recs=. _65535]\ y
  for_a. recs do.
    if. (65535<#y) *. a_index = <:#recs do. a=. (_65535|#y)}.a end.
    s=. s, a,~ a.{~ , 256 (#.^:_1) (256+FCGI_STDOUT),fcgi_id,(#a),0
  end.
end.
s=. s, a.{~ , 256 (#.^:_1) (256+FCGI_STDOUT),fcgi_id,(0),0
s=. s, a.{~ , 256 (#.^:_1) (256+FCGI_STDERR),fcgi_id,(0),0
s=. s, (8#{.a.),~ a.{~ , 256 (#.^:_1) (256+FCGI_END_REQUEST),fcgi_id,(8),0
)

read_fcgi=: 3 : 0
buf=: buf, y
if. _1=fcgi_id do.
  if. -. (#buf) > 7 do. break. end.
  'ty id1 id0 ct1 ct0 pad'=. a.i.(1+i.6){ buf
  fcgi_id=: id0 + id1*256
end.

p=. 0
while. p<#buf do.
  if. -. (#buf) > p+7 do. break. end.
  'ty id1 id0 ct1 ct0 pad'=. a.i.(p+1+i.6){ buf
  fcgi_id=: id0 + id1*256
  ct=. ct0 + ct1*256
  p1=. p + 8
  select. ty
  case. FCGI_BEGIN_REQUEST do.
    if. -. (#buf) > p1+3 do. break. end.
    'role1 role0 flags'=. a.i.(p1+i.3){ buf
    fcgi_role=: role0 + role1*256
    fcgi_flags=: flags
    p=. pad + p1 + ct
  case. FCGI_PARAMS ; FCGI_GET_VALUES do.
    if. 0=ct do.
      if. FCGI_PARAMS=ty do.
        rdy_fcgi_parm=: 1
      else.
        rdy_fcgi_getval=: 1
      end.
    else.
      p2=. p1
      while. (p2-p1)<ct do.
        if. -. (#buf) > p2+2 do. break. end.
        'a b'=. a.i.(p2+i.2){ buf
        if. 128>a do.
          if. 128>b do.
            n1=. a [ v1=. b
            of=. 2
          else.
            if. -. (#buf) > p2+5 do. break. end.
            'a b c d e'=. a.i.(p2+i.5){ buf
            n1=. a [ v1=. 256 256 256 256#. (16b80 | b), c, d, e
            of=. 5
          end.
        else.
          if. -. (#buf) > p2+5 do. break. end.
          'a b c d e'=. a.i.(p2+i.5){ buf
          if. 128>e do.
            n1=. 256 256 256 256#. (16b80 | a), b, c, d [ v1=. e
            of=. 5
          else.
            if. -. (#buf) > p2+8 do. break. end.
            'a b c d e f g h'=. a.i.(p2+i.8){ buf
            n1=. 256 256 256 256#. (16b80 | a), b, c, d [ v1=. 256 256 256 256#. (16b80 | e), f, g, h
            of=. 8
          end.
        end.
        if. -. (#buf) > p2+of+n1+v1 do. break. end.
        if. FCGI_PARAMS=ty do.
          fcgi_parmn=: fcgi_parmn , <(p2+of+i.n1){ buf
          fcgi_parmv=: fcgi_parmv , <(p2+of+n1+i.v1){ buf
        else.
          fcgi_getvaln=: fcgi_getvaln , <(p2+of+i.n1){ buf
          fcgi_getvalv=: fcgi_getvalv , <(p2+of+n1+i.v1){ buf
        end.
        p2=. p2 + of + n1 + v1
      end.
    end.
    p=. pad + p1 + ct
  case. FCGI_STDIN do. NB. STDIN
    if. 0=ct do.
      rdy_fcgi_stdin=: 1
    else.
      if. -. (#buf) > p1+ct do. break. end.
      fcgi_stdin=: fcgi_stdin, (p1+i.ct){ buf
    end.
    p=. pad + p1 + ct
  case. do. 13!:8[3  NB. force domain error
  end.
end.

buf=: p}.buf

fcgi_id,~ (0=fcgi_id){(rdy_fcgi_parm*.rdy_fcgi_stdin), rdy_fcgi_getval
)

do_fcgi=: 3 : 0
if. 0=y do.
  if. #fcgi_getvaln do. (fcgi_getvaln)=: fcgi_getvalv end.
NB. debug print
  DEBUGPRT fcgi_getvaln ,. fcgi_getvalv
  a=. ''
  for_val. (FCGI_MAX_CONNS ; FCGI_MAX_REQS ; FCGI_MPXS_CONNS) ([ -. -.) fcgi_getvaln do.
    select. val
    case. <FCGI_MAX_CONNS do. a=. a, (a.{~1,#FCGI_MAX_CONNS),FCGI_MAX_CONNS,'1'
    case. <FCGI_MAX_REQS do. a=. a, (a.{~1,#FCGI_MAX_REQS),FCGI_MAX_REQS,'1'
    case. <FCGI_MPXS_CONNS do. a=. a, (a.{~1,#FCGI_MPXS_CONNS),FCGI_MPXS_CONNS,'0'
    end.
  end.
  STDRES=: a
else.
  QUERY_STRING=: REQUEST_METHOD=: REQUEST_URI=: ''  NB. if http server forget to set them
  if. #fcgi_parmn do. (fcgi_parmn)=: fcgi_parmv end.
NB. debug print
  DEBUGPRT fcgi_parmn ,. fcgi_parmv
  POST_DATA=: fcgi_stdin
  do_fscgi ''
end.
)

NB. common to scgi and fcgi
NB. ---------------------------------------------------------

runscript=: 0!:0
stdout=: 3 : 'STDOUT=: STDOUT, y'

do_fscgi=: 3 : 0
select. <uri=. 5}.({.~ i.&'?') REQUEST_URI
case. '/test2.ijs' do.
  cgitest ''
case. '/crc.ijs' do.
  crc ''
case. '/bye.ijs' do.
  stdout 'Status: 200 OK', LF
  stdout 'Content-Type: text/html', LF, LF
  stdout '<html><body><pre>', LF
  stdout 'bye'
  stdout '</pre></body></html>'
  TERMINATE_z_=: 1
case. do.
  try.
    runscript < HOMEDIR, uri
  catch.
    cgi404 ''
  end.
end.
)

signoff=: 2!:55
sockerror=: 13!:8 & 3

socksend=: 4 : 0
dat=. x
whilst. #dat do.
  'err len'=. dat sdsend y,0
  if. 0=err do. dat=. len}.dat end.
end.
)

3 : 0''
if. _1=nameclass <'IFWINDOW' do. IFWINDOW=: 0 end.
if. _1=nameclass <'IFSHOW' do. IFSHOW=: 1 end.
0
)

NB. =========================================================
NB. socket_do:
socket_do=: 3 : 0
if. SDASYNC do.
  'read write error'=. sdcheck sdselect''
else.
  'read write error'=. sdcheck sdselect SOCKETS_jsocket_;SOCKETS_jsocket_;SOCKETS_jsocket_;1000
end.
if. #error do.
  sockerror 'error in socket: ',":error
end.

if. 0=#read do. empty'' return. end.

REQ=: ,~a:

while. #read do.
  sk=. {.read
  read=. }.read

  if. sk e. SKACCEPT do.
    txt=. ''
    'err dat'=. sdrecv sk,SKMAX,0
    if. 0~:err do. break. end.
    if. 0=#txt=. dat do.
      loc=. <'loc', ":sk
      18!:55 loc
      sdclose sk
      SKACCEPT=: SKACCEPT -. sk
      REQ=: ('scgi: ',":sk);'zero length'
      break.
    end.
    loc=. <'loc', ":sk
NB. autodetect scgi/fcgi
    if. _1=fscgi__loc do. fscgi__loc=: 48 <: a.i.1{txt end.
    if. 0=fscgi__loc do.
      if. 0={.'fini id'=. read_fcgi__loc txt do. continue. end.
      do_fcgi__loc id
      res=. STDOUT__loc
      res0=. STDRES__loc
      18!:55 loc
      if. 0=id do.
        (enc_fcgi res0) socksend sk
      else.
        (id enc_fcgi res) socksend sk
      end.
    else.
      if. 0=read_scgi__loc txt do. continue. end.
      do_scgi__loc ''
      res=. STDOUT__loc
      18!:55 loc
      res socksend sk
    end.
    sdclose sk
    SKACCEPT=: SKACCEPT -. sk
    REQ=: ('fscgi: ',":sk);20{.res
  elseif. sk=SKLISTEN do.
    new=. > sdcheck sdaccept sk
    SKACCEPT=: SKACCEPT,new
    REQ=: ('open socket: ',":new);''
    18!:55 loc=. <'loc', ":new
    18!:3 loc
    STDOUT__loc=: buf__loc=: ''
    fscgi__loc=: _1
NB. scgi
    headlen__loc=: datalen__loc=: _1
NB. fcgi
    STDRES__loc=: ''
    fcgi_parmn__loc=: fcgi_parmv__loc=: fcgi_stdin__loc=: ''
    rdy_fcgi_parm__loc=: rdy_fcgi_stdin__loc=: 0
    fcgi_getvaln__loc=: fcgi_getvalv__loc=: '' [ rdy_fcgi_getval__loc=: 0
    fcgi_id__loc=: _1

  elseif. 1 do.
    sockerror 'unknown socket: ',":sk
  end.

end.

if. TERMINATE do. 2!:55 '' end.

if. IFWINDOW do.
  if. IFSHOW do.
    write0 0 pick REQ
    write1 1 pick REQ
    wd 'pshow'
  else.
    wd 'pshow sw_hide'
  end.
  empty''
else.
  if. IFSHOW do. REQ else. empty'' end.
end.
)

NB. =========================================================
NB. socklisten    - server: open socket and listen
NB. y is number of queued connections (''=1)
socklisten=: 3 : 0
sdcleanup''
SKACCEPT=: ''
SKLISTEN=: 0 pick sdcheck sdsocket''
if. SDASYNC do. sdcheck sdasync SKLISTEN end.
name=. sdcheck sdgethostbyname'localhost'
sdcheck sdbind SKLISTEN;name,<SKPORT
sdcheck sdlisten SKLISTEN, {.y,1
SKLISTEN
)

NB. =========================================================
sockserver=: 3 : 0
SKPORT=: y
socket_handler=: socket_do
socklisten''
if. IFWINDOW do. server_run'' end.
if. -.SDASYNC do. while. do. socket_do'' end. end.
)

NB. =========================================================
cocurrent 'base'
NB. fcgi 8999 / scgi 9000
sockserver 8999 ] 9000
