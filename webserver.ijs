Note 'webserver'
Example use (from jconsole):

  load'webserver.ijs'
  8080 webserver0''

)

webserver0=: verb define
 80 webserver0 y NB. try to use port 80 by default
:
 port=: x
 require 'socket'
 coinsert 'jsocket'
 sdclose ; sdcheck sdgetsockets ''
 server=: {. ; sdcheck sdsocket ''
 sdcheck sdbind server; AF_INET; ''; port
 sdcheck sdlisten server, 1
 while. 1 do.
  while.
    server e. ready=: >{. sdcheck sdselect (sdcheck sdgetsockets ''),'';'';<1e3
  do.
    sdcheck sdaccept server
  end.
  for_socket. ready do.
   request=: ; sdcheck sdrecv socket, 65536 0
   sdcheck (socket responseFor request) sdsend socket, 0
   sdcheck sdclose socket
  end.
 end.
)

responseFor=: dyad define
 'HTTP/1.0 200 OK',CRLF,'Content-Type: text/plain',CRLF,CRLF,y
)