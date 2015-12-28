NB. Cross-platform SHA 1(2c20)2 and MD5 using openssl
NB. Downloaded from http://code.jsoftware.com/wiki/User:Pascal_Jasmin/SHA_1(2c20)2_and_MD5_for_windows
NB. on December 4, 2015.
NB. Author: Pascal Jasmin

require 'dll'
sslp =: IFWIN pick '/usr/lib/';'D:\OpenSSL-Win64\bin\'
sslp =: IFWIN pick ''; '/',~ jpath '~bin'  NB. with J802.  cut this line if you wish to point to downloaded folder
OPENSSL =: sslp , (IFIOS + (;: 'Win Linux Android Darwin') i. <UNAME_z_) pick 'libeay32.dll '; (2 $ <'libssl.so.1.0.0 '),  (2 $ <'/usr/lib/libssl.dylib ')
SSLE =: sslp , '\openssl'
ssl =: 1 : '(OPENSSL , m)&cd'
sslRMD160 =: (IFWIN {:: ' RIPEMD160 > + x *c x *c';'RIPEMD160 > x *c x *c')  ssl
sslSha256 =: (IFWIN {:: ' SHA256 > + x *c x *c';'SHA256 > x *c x *c')  ssl  NB. SHA256 i *c l *c' ssl
sslSha512 =: (IFWIN {:: ' SHA512 > + x *c x *c';'SHA512 > x *c x *c')  ssl
sslSha1 =: (IFWIN {:: ' SHA1 > + x *c x *c';'SHA1 > x *c x *c')  ssl
sslMD5 =: (IFWIN {:: ' MD5 > + x *c x *c';'MD5 > x *c x *c')  ssl

sr160=: 3 : 0
sslRMD160 (y);(#y);md=. 20#' '
md
)

sha1=: 3 : 0
sslSha1 (y);(#y);md=. 20#' '
md
)
s512=: 3 : 0
sslSha512 (y);(#y);md=. 64#' '
md
)
s256=: 3 : 0
sslSha256 (y);(#y);md=. 32#' '
md
)
md5 =: 3 : 0
sslMD5 (y);(# , y);md=. 16#' '
md
)

NB. helper adverb for converting output into hex string:
hexhash =: ( [: ,@:hfd a.i.])@:

Note 'tests'
   s256 hexhash 'The quick brown fox jumps over the lazy dog'
d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592

   s256 hexhash 'The quick brown fox jumps over the lazy dog.'
ef537f25c895bfa782526529a9b63d97aa631564d5d789c2b765448c8635fb6c

   100 ts 's256  ''The quick brown fox jumps over the lazy dog'''
105932/sec 0.005888MB

)