(defvar libnotify-program "/usr/bin/notify-send")

(defun notify-send (title message)
  (start-process "notify" " notify"
                 libnotify-program "--expire-time=4000" title message))

(defun libnotify-jabber-notify (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via libnotify"
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
        (notify-send (format "(PM) %s"
                             (jabber-jid-displayname (jabber-jid-user from)))
                     (format "%s: %s" (jabber-jid-resource from) text)))
    (notify-send (format "%s" (jabber-jid-displayname from))
                 text)))

(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)

(setq
 jabber-auto-reconnect t
 jabber-avatar-cache-directory "~/.jabber/jabber-avatar-cache"
 jabber-global-history-filename "~/.jabber/jabber-global-message-log"
 jabber-history-dir "~/.jabber/jabber-history"
 jabber-history-enable-rotation t
 jabber-history-muc-enabled t
 jabber-history-size-limit 2048
 jabber-history-enabled t
 jabber-use-global-history nil
 jabber-backlog-number 40
 jabber-backlog-days 366
 )

(provide 'jabber-config)
