;;ranger 
(ranger-override-dired-mode t)
(setq helm-descbinds-window-style 'same-window)
(setq ranger-cleanup-on-disable t)
(setq ranger-show-hidden t)
(setq ranger-modify-header t)
(setq ranger-hide-cursor nil)
(setq ranger-footer-delay 0.2)
(setq ranger-preview-delay 0.040)
(setq ranger-preview-file t)
(setq ranger-show-literal nil)
(setq ranger-dont-show-binary t)

;;Calendar

;; 分别是妇女节、植树节、劳动节、青年节、儿童节、教师节、国庆节、程序员节、双11
(setq holiday-local-holidays `((holiday-fixed 3 8  "Women's Day")
                               (holiday-fixed 3 12 "Arbor Day")
                               ,@(cl-loop for i from 1 to 3
                                          collect `(holiday-fixed 5 ,i "International Workers' Day"))
                               (holiday-fixed 5 4  "Chinese Youth Day")
                               (holiday-fixed 6 1  "Children's Day")
                               (holiday-fixed 9 10 "Teachers' Day")
                               ,@(cl-loop for i from 1 to 7
                                          collect `(holiday-fixed 10 ,i "National Day"))
                               (holiday-fixed 10 24 "Programmers' Day")
                               (holiday-fixed 11 11 "Singles' Day")))

;; 分别是世界地球日、世界读书日、俄罗斯的那个程序员节
(setq holiday-other-holidays '((holiday-fixed 4 22 "Earth Day")
                               (holiday-fixed 4 23 "World Book Day")
                               (holiday-sexp '(if (or (zerop (% year 400))
                                                      (and (% year 100) (zerop (% year 4))))
                                                  (list 9 12 year)
                                                (list 9 13 year))
                                             "World Programmers' Day")))

(setq calendar-chinese-all-holidays-flag t)

;; 元宵节
(setq holiday-oriental-holidays '((holiday-chinese 1 15 "Lantern Festival")))

(defun org-agenda-add-entry-with-save (_type text &optional _d1 _d2)
  ;;`org-agenda-add-entry-to-org-agenda-diary-file'里认为如果用户没有输入有效的
  ;;内容，会弹出对应 buffer 让用户人工输入。
  (when (string-match "\\S-" text)
    (with-current-buffer (find-file-noselect org-agenda-diary-file)
      (save-buffer))))

(advice-add #'org-agenda-add-entry-to-org-agenda-diary-file :after #'org-agenda-add-entry-with-save)

;;ivy


(global-set-key [(f8)] 'loop-alpha)  ;;注意这行中的F8 , 可以改成你想要的按键  
  
(setq alpha-list '((85 55) (100 100)))  
  
(defun loop-alpha ()  
  (interactive)  
  (let ((h (car alpha-list)))                  
    ((lambda (a ab)  
       (set-frame-parameter (selected-frame) 'alpha (list a ab))  
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))  
       ) (car h) (car (cdr h)))  
    (setq alpha-list (cdr (append alpha-list (list h))))  
    )  
)  

;; evil-mode

(require 'evil)

;; eaf-config
(require 'eaf)
(require 'eaf-all-the-icons)

;; translaten
(require 'google-translate)
(require 'google-translate-smooth-ui)
;;需要将谷歌翻译地址的.com修改成.cn,否则在国内无法进行访问
;; (setq google-translate-base-url
;;      "http://translate.google.cn/translate_a/single")
;; (setq google-translate-listen-url
;;      "http://translate.google.cn/translate_tts")
;; (setq google-translate--tkk-url
;;      "http://translate.google.cn")
;; ;
					;配置默认语言
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "zh-CN")
(setq-default google-translate-enable-ido-completion t)
;; 配置快捷键
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
(global-set-key (kbd "\C-cq") 'google-translate-smooth-translate)

(provide 'init-config)
