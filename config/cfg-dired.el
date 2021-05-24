(setq dired-guess-shell-alist-user `((,(rx "."
                                           (or
                                            ;; Videos
                                            "mp4" "avi" "mkv" "flv" "ogv" "mov"
                                            ;; Music
                                            "wav" "mp3" "flac"
                                            ;; Images
                                            "jpg" "jpeg" "png" "gif" "xpm" "svg" "bmp"
                                            ;; Docs
                                            "pdf" "md" "djvu" "ps" "eps")
                                           string-end)
                                      ,(cond ((eq system-type 'gnu/linux) "xdg-open")
                                             ((eq system-type 'darwin) "open")
                                             ((eq system-type 'windows-nt) "start")
                                             (t "")))))
