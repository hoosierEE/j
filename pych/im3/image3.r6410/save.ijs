NB. save

NB. copy files to addons directory for testing
NB. create target directories first

to=. jpath '~addons/media/image3/'
fm=. jpath '~Addons/media/image3/'

f=. <;._2 (0 : 0)
anins2.ijs
atkiln.jpg
color_space.ijs
filter1.ijs
html_gallery8.ijs
hy_fly_di.png
image3.dll
image3.ijs
image3.ijt
image3_unix_ini.ijs
image3_win_ini.ijs
image3html.ijt
image3movie.ijt
libimage3.dylib
libimage3.so
movie3.ijs
prevare.ijs
pthreadgc.dll
sample1.ijs
sample2.ijs
text_image.ijs
transform_m.ijs
view_m.ijs
)

(to&, each f) fcopynew each fm&, each f

to=. jpath to,'help/'
fm=. jpath fm,'help/'
f=. {."1 [ 2 dir jpath '~Addons/media/image3/help'
(to&, each f) fcopynew each fm&, each f

