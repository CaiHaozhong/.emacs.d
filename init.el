;配置插件源
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;设置窗口大小
(add-to-list 'default-frame-alist '(height .35))
(add-to-list 'default-frame-alist '(width . 100))

;set font
( defvar emacs-english-font "Monaco"
   "The font name of English." )

( defvar emacs-cjk-font "微软雅黑"
  "The font name for CJK." )

( defvar emacs-font-size-pair ' ( 16 . 15 )
   "Default font size pair for (english . chinese)" )

( defvar emacs-font-size-pair-list
   ' ( ( 5 . 6 ) ( 10 . 12 )
     ( 13 . 16 ) ( 15 . 18 ) ( 17 . 20 )
     ( 19 . 22 ) ( 20 . 24 ) ( 21 . 26 )
     ( 24 . 28 ) ( 26 . 32 ) ( 28 . 34 )
     ( 30 . 36 ) ( 34 . 40 ) ( 36 . 44 ) )
   "This list is used to store matching (englis . chinese) font-size." )

  ( defun font-exist-p ( fontname )
   "Test if this font is exist or not."
   ( if ( or ( not fontname ) ( string= fontname "" ) )
       nil
     ( if ( not ( x-list-fonts fontname ) ) nil t ) ) )

 ( defun set-font ( english chinese size-pair )
   "Setup emacs English and Chinese font on x window-system."

   ( if ( font-exist-p english )
       ( set-frame-font ( format "%s:pixelsize=%d" english ( car size-pair ) ) t ) )

   ( if ( font-exist-p chinese )
       ( dolist ( charset ' ( kana han symbol cjk-misc bopomofo ) )
         ( set-fontset-font ( frame-parameter nil 'font ) charset
			    ( font-spec :family chinese :size ( cdr size-pair ) ) ) ) ) )
  ;; Setup font size based on emacs-font-size-pair
 ( set-font emacs-english-font emacs-cjk-font emacs-font-size-pair )

;zilongshanren
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)

(setq-default cursor-type 'bar)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f4>") 'open-init-file)

(global-company-mode t)

(delete-selection-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)

(require 'org)
(setq org-src-fontify-natively t)

(require 'hungry-delete)
(global-hungry-delete-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(org-footnote-define-inline nil)
 '(package-selected-packages
   (quote
    (evil-smartparens swiper-helm company hungry-delete swiper counsel smartparens exec-path-from-shell))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(org-table ((t (:foreground "#6c71c4" :family "Ubuntu Mono")))))
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;; Config smartparens
(require 'smartparens)
(smartparens-global-mode t)

;;gtd
(setq org-agenda-files '("~/gtd"))
(global-set-key (kbd "C-c a") 'org-agenda)

(global-auto-revert-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("2chz" "caihaozhong")
					    ))
(put 'dired-find-alternate-file 'disabled nil)

;;打开一篇新的周记
(defconst today (format-time-string "%Y.%m.%d"))
(defconst mpath "e://CG//周记//")
(defun new-week-report()
  (interactive)
  (find-file (format "%s周记%s//周记.org" mpath today ))
  )








(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
