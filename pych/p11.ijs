NB. load'jpeg'
NB. readjpeg'cave.jpg'
NB. readjpeg is slow on my laptop, so write the output to a plaintext file 'cavejpg',
NB. and use it from now on instead of repeatedly calling readjpeg
cave =: ".>cutLF 1!:1<'cavejpg' NB. convert lines of text into a 2-d array of numbers

mask =: }:"1]480 641 $ i.2  NB. image-sized checkerboard
odd =: (I.mask){"1 cave
evn =: (-.I.mask){"1 cave


NB. (defvar j-mode-map
NB.   (let ((map (make-sparse-keymap)))
NB.     (define-key map (kbd "C-c !")   'j-console)
NB.     (define-key map (kbd "C-c C-c") 'j-console-execute-buffer)
NB.     (define-key map (kbd "C-c C-r") 'j-console-execute-region)
NB.     (define-key map (kbd "C-c C-l") 'j-console-execute-line)
NB.     (define-key map (kbd "C-c h")   'j-help-lookup-symbol)
NB.     (define-key map (kbd "C-c C-h") 'j-help-lookup-symbol-at-point)
NB.     map)
NB.   "Keymap for J major mode")