;;; tramp-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "tramp" "tramp.el" (0 0 0 0))
;;; Generated autoloads from tramp.el

(defvar tramp-methods nil "\
Alist of methods for remote files.
This is a list of entries of the form (NAME PARAM1 PARAM2 ...).
Each NAME stands for a remote access method.  Each PARAM is a
pair of the form (KEY VALUE).  The following KEYs are defined:
  * `tramp-remote-shell'
    This specifies the shell to use on the remote host.  This
    MUST be a Bourne-like shell.  It is normally not necessary to
    set this to any value other than \"/bin/sh\": Tramp wants to
    use a shell which groks tilde expansion, but it can search
    for it.  Also note that \"/bin/sh\" exists on all Unixen,
    this might not be true for the value that you decide to use.
    You Have Been Warned.
  * `tramp-remote-shell-login'
    This specifies the arguments to let `tramp-remote-shell' run
    as a login shell.  It defaults to (\"-l\"), but some shells,
    like ksh, require another argument.  See
    `tramp-connection-properties' for a way to overwrite the
    default value.
  * `tramp-remote-shell-args'
    For implementation of `shell-command', this specifies the
    arguments to let `tramp-remote-shell' run a single command.
  * `tramp-login-program'
    This specifies the name of the program to use for logging in to the
    remote host.  This may be the name of rsh or a workalike program,
    or the name of telnet or a workalike, or the name of su or a workalike.
  * `tramp-login-args'
    This specifies the list of arguments to pass to the above
    mentioned program.  Please note that this is a list of list of arguments,
    that is, normally you don't want to put \"-a -b\" or \"-f foo\"
    here.  Instead, you want a list (\"-a\" \"-b\"), or (\"-f\" \"foo\").
    There are some patterns: \"%h\" in this list is replaced by the host
    name, \"%u\" is replaced by the user name, \"%p\" is replaced by the
    port number, and \"%%\" can be used to obtain a literal percent character.
    If a list containing \"%h\", \"%u\" or \"%p\" is unchanged during
    expansion (i.e. no host or no user specified), this list is not used as
    argument.  By this, arguments like (\"-l\" \"%u\") are optional.
    \"%t\" is replaced by the temporary file name produced with
    `tramp-make-tramp-temp-file'.  \"%k\" indicates the keep-date
    parameter of a program, if exists.  \"%c\" adds additional
    `tramp-ssh-controlmaster-options' options for the first hop.
  * `tramp-login-env'
     A list of environment variables and their values, which will
     be set when calling `tramp-login-program'.
  * `tramp-async-args'
    When an asynchronous process is started, we know already that
    the connection works.  Therefore, we can pass additional
    parameters to suppress diagnostic messages, in order not to
    tamper the process output.
  * `tramp-copy-program'
    This specifies the name of the program to use for remotely copying
    the file; this might be the absolute filename of scp or the name of
    a workalike program.  It is always applied on the local host.
  * `tramp-copy-args'
    This specifies the list of parameters to pass to the above mentioned
    program, the hints for `tramp-login-args' also apply here.
  * `tramp-copy-env'
     A list of environment variables and their values, which will
     be set when calling `tramp-copy-program'.
  * `tramp-remote-copy-program'
    The listener program to be applied on remote side, if needed.
  * `tramp-remote-copy-args'
    The list of parameters to pass to the listener program, the hints
    for `tramp-login-args' also apply here.  Additionally, \"%r\" could
    be used here and in `tramp-copy-args'.  It denotes a randomly
    chosen port for the remote listener.
  * `tramp-copy-keep-date'
    This specifies whether the copying program when the preserves the
    timestamp of the original file.
  * `tramp-copy-keep-tmpfile'
    This specifies whether a temporary local file shall be kept
    for optimization reasons (useful for \"rsync\" methods).
  * `tramp-copy-recursive'
    Whether the operation copies directories recursively.
  * `tramp-default-port'
    The default port of a method.
  * `tramp-tmpdir'
    A directory on the remote host for temporary files.  If not
    specified, \"/tmp\" is taken as default.
  * `tramp-connection-timeout'
    This is the maximum time to be spent for establishing a connection.
    In general, the global default value shall be used, but for
    some methods, like \"su\" or \"sudo\", a shorter timeout
    might be desirable.
  * `tramp-case-insensitive'
    Whether the remote file system handles file names case insensitive.
    Only a non-nil value counts, the default value nil means to
    perform further checks on the remote host.  See
    `tramp-connection-properties' for a way to overwrite this.

What does all this mean?  Well, you should specify `tramp-login-program'
for all methods; this program is used to log in to the remote site.  Then,
there are two ways to actually transfer the files between the local and the
remote side.  One way is using an additional scp-like program.  If you want
to do this, set `tramp-copy-program' in the method.

Another possibility for file transfer is inline transfer, i.e. the
file is passed through the same buffer used by `tramp-login-program'.  In
this case, the file contents need to be protected since the
`tramp-login-program' might use escape codes or the connection might not
be eight-bit clean.  Therefore, file contents are encoded for transit.
See the variables `tramp-local-coding-commands' and
`tramp-remote-coding-commands' for details.

So, to summarize: if the method is an out-of-band method, then you
must specify `tramp-copy-program' and `tramp-copy-args'.  If it is an
inline method, then these two parameters should be nil.

Notes:

When using `su' or `sudo' the phrase \"open connection to a remote
host\" sounds strange, but it is used nevertheless, for consistency.
No connection is opened to a remote host, but `su' or `sudo' is
started on the local host.  You should specify a remote host
`localhost' or the name of the local host.  Another host name is
useful only in combination with `tramp-default-proxies-alist'.")

(defvar tramp-default-method-alist nil "\
Default method to use for specific host/user pairs.
This is an alist of items (HOST USER METHOD).  The first matching item
specifies the method to use for a file name which does not specify a
method.  HOST and USER are regular expressions or nil, which is
interpreted as a regular expression which always matches.  If no entry
matches, the variable `tramp-default-method' takes effect.

If the file name does not specify the user, lookup is done using the
empty string for the user name.

See `tramp-methods' for a list of possibilities for METHOD.")

(custom-autoload 'tramp-default-method-alist "tramp" t)

(defvar tramp-default-user-alist nil "\
Default user to use for specific method/host pairs.
This is an alist of items (METHOD HOST USER).  The first matching item
specifies the user to use for a file name which does not specify a
user.  METHOD and HOST are regular expressions or nil, which is
interpreted as a regular expression which always matches.  If no entry
matches, the variable `tramp-default-user' takes effect.

If the file name does not specify the method, lookup is done using the
empty string for the method name.")

(custom-autoload 'tramp-default-user-alist "tramp" t)

(defvar tramp-default-host-alist nil "\
Default host to use for specific method/user pairs.
This is an alist of items (METHOD USER HOST).  The first matching item
specifies the host to use for a file name which does not specify a
host.  METHOD and USER are regular expressions or nil, which is
interpreted as a regular expression which always matches.  If no entry
matches, the variable `tramp-default-host' takes effect.

If the file name does not specify the method, lookup is done using the
empty string for the method name.")

(custom-autoload 'tramp-default-host-alist "tramp" t)

(defconst tramp-local-host-regexp (concat "\\`" (regexp-opt (list "localhost" "localhost6" (system-name) "127.0.0.1" "::1") t) "\\'") "\
Host names which are regarded as local host.")

(defvar tramp-syntax 'default "\
Tramp filename syntax to be used.

It can have the following values:

  `default'    -- Default syntax
  `simplified' -- Ange-FTP like syntax
  `separate'   -- Syntax as defined for XEmacs originally

Do not change the value by `setq', it must be changed only via
Customize.  See also `tramp-change-syntax'.")

(custom-autoload 'tramp-syntax "tramp" nil)

(defconst tramp-prefix-domain-format "%" "\
String matching delimiter between user and domain names.")

(defconst tramp-prefix-domain-regexp (regexp-quote tramp-prefix-domain-format) "\
Regexp matching delimiter between user and domain names.
Derived from `tramp-prefix-domain-format'.")

(defvar tramp-foreign-file-name-handler-alist nil "\
Alist of elements (FUNCTION . HANDLER) for foreign methods handled specially.
If (FUNCTION FILENAME) returns non-nil, then all I/O on that file is done by
calling HANDLER.")

(autoload 'tramp-tramp-file-p "tramp" "\
Return t if NAME is a string with Tramp file name syntax.

\(fn NAME)" nil nil)

(autoload 'tramp-set-completion-function "tramp" "\
Sets the list of completion functions for METHOD.
FUNCTION-LIST is a list of entries of the form (FUNCTION FILE).
The FUNCTION is intended to parse FILE according its syntax.
It might be a predefined FUNCTION, or a user defined FUNCTION.
For the list of predefined FUNCTIONs see `tramp-completion-function-alist'.

Example:

    (tramp-set-completion-function
     \"ssh\"
     \\='((tramp-parse-sconfig \"/etc/ssh_config\")
       (tramp-parse-sconfig \"~/.ssh/config\")))

\(fn METHOD FUNCTION-LIST)" nil nil)

(defun tramp-register-foreign-file-name-handler (func handler &optional append) "\
Register (FUNC . HANDLER) in `tramp-foreign-file-name-handler-alist'.
FUNC is the function, which determines whether HANDLER is to be called.
Add operations defined in `HANDLER-alist' to `tramp-file-name-handler'." (add-to-list (quote tramp-foreign-file-name-handler-alist) (\` ((\, func) \, handler)) append) (put (quote tramp-file-name-handler) (quote operations) (delete-dups (append (get (quote tramp-file-name-handler) (quote operations)) (mapcar (quote car) (symbol-value (intern (concat (symbol-name handler) "-alist"))))))))

(autoload 'tramp-parse-rhosts "tramp" "\
Return a list of (user host) tuples allowed to access.
Either user or host may be nil.

\(fn FILENAME)" nil nil)

(autoload 'tramp-parse-shosts "tramp" "\
Return a list of (user host) tuples allowed to access.
User is always nil.

\(fn FILENAME)" nil nil)

(autoload 'tramp-parse-sconfig "tramp" "\
Return a list of (user host) tuples allowed to access.
User is always nil.

\(fn FILENAME)" nil nil)

(autoload 'tramp-parse-shostkeys "tramp" "\
Return a list of (user host) tuples allowed to access.
User is always nil.

\(fn DIRNAME)" nil nil)

(autoload 'tramp-parse-sknownhosts "tramp" "\
Return a list of (user host) tuples allowed to access.
User is always nil.

\(fn DIRNAME)" nil nil)

(autoload 'tramp-parse-hosts "tramp" "\
Return a list of (user host) tuples allowed to access.
User is always nil.

\(fn FILENAME)" nil nil)

(autoload 'tramp-parse-passwd "tramp" "\
Return a list of (user host) tuples allowed to access.
Host is always \"localhost\".

\(fn FILENAME)" nil nil)

(autoload 'tramp-parse-etc-group "tramp" "\
Return a list of (group host) tuples allowed to access.
Host is always \"localhost\".

\(fn FILENAME)" nil nil)

(autoload 'tramp-parse-netrc "tramp" "\
Return a list of (user host) tuples allowed to access.
User may be nil.

\(fn FILENAME)" nil nil)

(autoload 'tramp-parse-putty "tramp" "\
Return a list of (user host) tuples allowed to access.
User is always nil.

\(fn REGISTRY-OR-DIRNAME)" nil nil)

(autoload 'tramp-mode-string-to-int "tramp" "\
Converts a ten-letter `drwxrwxrwx'-style mode string into mode bits.

\(fn MODE-STRING)" nil nil)

(autoload 'tramp-file-mode-from-int "tramp" "\
Turn an integer representing a file mode into an ls(1)-like string.

\(fn MODE)" nil nil)

(autoload 'tramp-get-local-uid "tramp" "\
The uid of the local user, in ID-FORMAT.
ID-FORMAT valid values are `string' and `integer'.

\(fn ID-FORMAT)" nil nil)

(autoload 'tramp-get-local-gid "tramp" "\
The gid of the local user, in ID-FORMAT.
ID-FORMAT valid values are `string' and `integer'.

\(fn ID-FORMAT)" nil nil)

(autoload 'tramp-check-cached-permissions "tramp" "\
Check `file-attributes' caches for VEC.
Return t if according to the cache access type ACCESS is known to
be granted.

\(fn VEC ACCESS)" nil nil)

(autoload 'tramp-local-host-p "tramp" "\
Return t if this points to the local host, nil otherwise.

\(fn VEC)" nil nil)

(autoload 'tramp-make-tramp-temp-file "tramp" "\
Create a temporary file on the remote host identified by VEC.
Return the local name of the temporary file.

\(fn VEC)" nil nil)

(autoload 'tramp-read-passwd "tramp" "\
Read a password from user (compat function).
Consults the auth-source package.
Invokes `password-read' if available, `read-passwd' else.

\(fn PROC &optional PROMPT)" nil nil)

(autoload 'tramp-clear-passwd "tramp" "\
Clear password cache for connection related to VEC.

\(fn VEC)" nil nil)

(autoload 'tramp-time-diff "tramp" "\
Return the difference between the two times, in seconds.
T1 and T2 are time values (as returned by `current-time' for example).

\(fn T1 T2)" nil nil)

(autoload 'tramp-shell-quote-argument "tramp" "\
Similar to `shell-quote-argument', but groks newlines.
Only works for Bourne-like shells.

\(fn S)" nil nil)

;;;***

;;;### (autoloads nil "tramp-adb" "tramp-adb.el" (0 0 0 0))
;;; Generated autoloads from tramp-adb.el

(defvar tramp-adb-program "adb" "\
Name of the Android Debug Bridge program.")

(custom-autoload 'tramp-adb-program "tramp-adb" t)

(defvar tramp-adb-connect-if-not-connected nil "\
Try to run `adb connect' if provided device is not connected currently.
It is used for TCP/IP devices.")

(custom-autoload 'tramp-adb-connect-if-not-connected "tramp-adb" t)

(defconst tramp-adb-method "adb" "\
When this method name is used, forward all calls to Android Debug Bridge.")

(defvar tramp-adb-prompt "^\\(?:[[:digit:]]*|?\\)?\\(?:[[:alnum:];[]*@?[[:alnum:]]*[^#\\$]*\\)?[#\\$][[:space:]]" "\
Regexp used as prompt in almquist shell.")

(custom-autoload 'tramp-adb-prompt "tramp-adb" t)

(add-to-list 'tramp-methods `(,tramp-adb-method (tramp-tmpdir "/data/local/tmp") (tramp-default-port 5555)))

(add-to-list 'tramp-default-host-alist `(,tramp-adb-method nil ""))

(eval-after-load 'tramp '(tramp-set-completion-function tramp-adb-method '((tramp-adb-parse-device-names ""))))

(defconst tramp-adb-file-name-handler-alist '((access-file . ignore) (add-name-to-file . tramp-handle-add-name-to-file) (copy-file . tramp-adb-handle-copy-file) (delete-directory . tramp-adb-handle-delete-directory) (delete-file . tramp-adb-handle-delete-file) (directory-file-name . tramp-handle-directory-file-name) (directory-files . tramp-handle-directory-files) (directory-files-and-attributes . tramp-adb-handle-directory-files-and-attributes) (dired-compress-file . ignore) (dired-uncache . tramp-handle-dired-uncache) (expand-file-name . tramp-adb-handle-expand-file-name) (file-accessible-directory-p . tramp-handle-file-accessible-directory-p) (file-acl . ignore) (file-attributes . tramp-adb-handle-file-attributes) (file-directory-p . tramp-adb-handle-file-directory-p) (file-equal-p . tramp-handle-file-equal-p) (file-executable-p . tramp-handle-file-exists-p) (file-exists-p . tramp-handle-file-exists-p) (file-in-directory-p . tramp-handle-file-in-directory-p) (file-local-copy . tramp-adb-handle-file-local-copy) (file-modes . tramp-handle-file-modes) (file-name-all-completions . tramp-adb-handle-file-name-all-completions) (file-name-as-directory . tramp-handle-file-name-as-directory) (file-name-case-insensitive-p . tramp-handle-file-name-case-insensitive-p) (file-name-completion . tramp-handle-file-name-completion) (file-name-directory . tramp-handle-file-name-directory) (file-name-nondirectory . tramp-handle-file-name-nondirectory) (file-newer-than-file-p . tramp-handle-file-newer-than-file-p) (file-notify-add-watch . tramp-handle-file-notify-add-watch) (file-notify-rm-watch . tramp-handle-file-notify-rm-watch) (file-notify-valid-p . tramp-handle-file-notify-valid-p) (file-ownership-preserved-p . ignore) (file-readable-p . tramp-handle-file-exists-p) (file-regular-p . tramp-handle-file-regular-p) (file-remote-p . tramp-handle-file-remote-p) (file-selinux-context . tramp-handle-file-selinux-context) (file-symlink-p . tramp-handle-file-symlink-p) (file-system-info . tramp-adb-handle-file-system-info) (file-truename . tramp-adb-handle-file-truename) (file-writable-p . tramp-adb-handle-file-writable-p) (find-backup-file-name . tramp-handle-find-backup-file-name) (insert-directory . tramp-handle-insert-directory) (insert-file-contents . tramp-handle-insert-file-contents) (load . tramp-handle-load) (make-auto-save-file-name . tramp-handle-make-auto-save-file-name) (make-directory . tramp-adb-handle-make-directory) (make-directory-internal . ignore) (make-nearby-temp-file . tramp-handle-make-nearby-temp-file) (make-symbolic-link . tramp-handle-make-symbolic-link) (process-file . tramp-adb-handle-process-file) (rename-file . tramp-adb-handle-rename-file) (set-file-acl . ignore) (set-file-modes . tramp-adb-handle-set-file-modes) (set-file-selinux-context . ignore) (set-file-times . tramp-adb-handle-set-file-times) (set-visited-file-modtime . tramp-handle-set-visited-file-modtime) (shell-command . tramp-adb-handle-shell-command) (start-file-process . tramp-adb-handle-start-file-process) (substitute-in-file-name . tramp-handle-substitute-in-file-name) (temporary-file-directory . tramp-handle-temporary-file-directory) (unhandled-file-name-directory . ignore) (vc-registered . ignore) (verify-visited-file-modtime . tramp-handle-verify-visited-file-modtime) (write-region . tramp-adb-handle-write-region)) "\
Alist of handler functions for Tramp ADB method.")

(defsubst tramp-adb-file-name-p (filename) "\
Check if it's a filename for ADB." (let ((v (tramp-dissect-file-name filename))) (string= (tramp-file-name-method v) tramp-adb-method)))

(autoload 'tramp-adb-file-name-handler "tramp-adb" "\
Invoke the ADB handler for OPERATION.
First arg specifies the OPERATION, second arg is a list of arguments to
pass to the OPERATION.

\(fn OPERATION &rest ARGS)" nil nil)

(tramp-register-foreign-file-name-handler 'tramp-adb-file-name-p 'tramp-adb-file-name-handler)

(autoload 'tramp-adb-parse-device-names "tramp-adb" "\
Return a list of (nil host) tuples allowed to access.

\(fn IGNORE)" nil nil)

;;;***

;;;### (autoloads nil "tramp-cache" "tramp-cache.el" (0 0 0 0))
;;; Generated autoloads from tramp-cache.el

(defvar tramp-cache-data (make-hash-table :test 'equal) "\
Hash table for remote files properties.")

(defvar tramp-connection-properties nil "\
List of static connection properties.
Every entry has the form (REGEXP PROPERTY VALUE).  The regexp
matches remote file names.  It can be nil.  PROPERTY is a string,
and VALUE the corresponding value.  They are used, if there is no
matching entry for PROPERTY in `tramp-cache-data'.  For more
details see the info pages.")

(custom-autoload 'tramp-connection-properties "tramp-cache" t)

(defvar tramp-persistency-file-name (expand-file-name (locate-user-emacs-file "tramp")) "\
File which keeps connection history for Tramp connections.")

(custom-autoload 'tramp-persistency-file-name "tramp-cache" t)

(autoload 'tramp-get-file-property "tramp-cache" "\
Get the PROPERTY of FILE from the cache context of KEY.
Returns DEFAULT if not set.

\(fn KEY FILE PROPERTY DEFAULT)" nil nil)

(autoload 'tramp-set-file-property "tramp-cache" "\
Set the PROPERTY of FILE to VALUE, in the cache context of KEY.
Returns VALUE.

\(fn KEY FILE PROPERTY VALUE)" nil nil)

(autoload 'tramp-flush-file-property "tramp-cache" "\
Remove all properties of FILE in the cache context of KEY.

\(fn KEY FILE)" nil nil)

(autoload 'tramp-flush-directory-property "tramp-cache" "\
Remove all properties of DIRECTORY in the cache context of KEY.
Remove also properties of all files in subdirectories.

\(fn KEY DIRECTORY)" nil nil)

(autoload 'tramp-get-connection-property "tramp-cache" "\
Get the named PROPERTY for the connection.
KEY identifies the connection, it is either a process or a
`tramp-file-name' structure.  A special case is nil, which is
used to cache connection properties of the local machine.  If the
value is not set for the connection, returns DEFAULT.

\(fn KEY PROPERTY DEFAULT)" nil nil)

(autoload 'tramp-set-connection-property "tramp-cache" "\
Set the named PROPERTY of a connection to VALUE.
KEY identifies the connection, it is either a process or a
`tramp-file-name' structure.  A special case is nil, which is
used to cache connection properties of the local machine.
PROPERTY is set persistent when KEY is a `tramp-file-name' structure.

\(fn KEY PROPERTY VALUE)" nil nil)

(autoload 'tramp-connection-property-p "tramp-cache" "\
Check whether named PROPERTY of a connection is defined.
KEY identifies the connection, it is either a process or a
`tramp-file-name' structure.  A special case is nil, which is
used to cache connection properties of the local machine.

\(fn KEY PROPERTY)" nil nil)

(autoload 'tramp-flush-connection-property "tramp-cache" "\
Remove all properties identified by KEY.
KEY identifies the connection, it is either a process or a
`tramp-file-name' structure.  A special case is nil, which is
used to cache connection properties of the local machine.

\(fn KEY)" nil nil)

(autoload 'tramp-cache-print "tramp-cache" "\
Print hash table TABLE.

\(fn TABLE)" nil nil)

(autoload 'tramp-list-connections "tramp-cache" "\
Return all known `tramp-file-name' structs according to `tramp-cache'.

\(fn)" nil nil)

(autoload 'tramp-parse-connection-properties "tramp-cache" "\
Return a list of (user host) tuples allowed to access for METHOD.
This function is added always in `tramp-get-completion-function'
for all methods.  Resulting data are derived from connection history.

\(fn METHOD)" nil nil)

(defvar tramp-cache-read-persistent-data (or init-file-user site-run-file) "\
Whether to read persistent data at startup time.")

;;;***

;;;### (autoloads nil "tramp-cmds" "tramp-cmds.el" (0 0 0 0))
;;; Generated autoloads from tramp-cmds.el

(autoload 'tramp-change-syntax "tramp-cmds" "\
Change Tramp syntax.
SYNTAX can be one of the symbols `default' (default),
`simplified' (ange-ftp like) or `separate' (XEmacs like).

\(fn &optional SYNTAX)" t nil)

(autoload 'tramp-cleanup-connection "tramp-cmds" "\
Flush all connection related objects.
This includes password cache, file cache, connection cache,
buffers.  KEEP-DEBUG non-nil preserves the debug buffer.
KEEP-PASSWORD non-nil preserves the password cache.
When called interactively, a Tramp connection has to be selected.

\(fn VEC &optional KEEP-DEBUG KEEP-PASSWORD)" t nil)

(autoload 'tramp-cleanup-this-connection "tramp-cmds" "\
Flush all connection related objects of the current buffer's connection.

\(fn)" t nil)

(autoload 'tramp-cleanup-all-connections "tramp-cmds" "\
Flush all Tramp internal objects.
This includes password cache, file cache, connection cache, buffers.

\(fn)" t nil)

(autoload 'tramp-cleanup-all-buffers "tramp-cmds" "\
Kill all remote buffers.

\(fn)" t nil)

(autoload 'tramp-version "tramp-cmds" "\
Print version number of tramp.el in minibuffer or current buffer.

\(fn ARG)" t nil)

(autoload 'tramp-bug "tramp-cmds" "\
Submit a bug report to the Tramp developers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "tramp-ftp" "tramp-ftp.el" (0 0 0 0))
;;; Generated autoloads from tramp-ftp.el

(defconst tramp-ftp-method "ftp" "\
When this method name is used, forward all calls to Ange-FTP.")

(add-to-list 'tramp-methods (cons tramp-ftp-method nil))

(add-to-list 'tramp-default-method-alist (list "\\`ftp\\." nil tramp-ftp-method))

(add-to-list 'tramp-default-method-alist (list nil "\\`\\(anonymous\\|ftp\\)\\'" tramp-ftp-method))

(eval-after-load 'tramp '(tramp-set-completion-function tramp-ftp-method '((tramp-parse-netrc "~/.netrc"))))

(autoload 'tramp-ftp-file-name-handler "tramp-ftp" "\
Invoke the Ange-FTP handler for OPERATION.
First arg specifies the OPERATION, second arg is a list of arguments to
pass to the OPERATION.

\(fn OPERATION &rest ARGS)" nil nil)

(defsubst tramp-ftp-file-name-p (filename) "\
Check if it's a filename that should be forwarded to Ange-FTP." (string= (tramp-file-name-method (tramp-dissect-file-name filename)) tramp-ftp-method))

(add-to-list 'tramp-foreign-file-name-handler-alist (cons 'tramp-ftp-file-name-p 'tramp-ftp-file-name-handler))

;;;***

;;;### (autoloads nil "tramp-gvfs" "tramp-gvfs.el" (0 0 0 0))
;;; Generated autoloads from tramp-gvfs.el

(defvar tramp-gvfs-methods '("afp" "dav" "davs" "gdrive" "obex" "sftp" "synce") "\
List of methods for remote files, accessed with GVFS.")

(custom-autoload 'tramp-gvfs-methods "tramp-gvfs" t)

(when (string-match "\\(.+\\)@\\(\\(?:gmail\\|googlemail\\)\\.com\\)" user-mail-address) (add-to-list 'tramp-default-user-alist `("\\`gdrive\\'" nil ,(match-string 1 user-mail-address))) (add-to-list 'tramp-default-host-alist '("\\`gdrive\\'" nil (\, (match-string 2 user-mail-address)))))

(add-to-list 'tramp-default-user-alist '("\\`synce\\'" nil nil))

(defvar tramp-gvfs-zeroconf-domain "local" "\
Zeroconf domain to be used for discovering services, like host names.")

(custom-autoload 'tramp-gvfs-zeroconf-domain "tramp-gvfs" t)

(when (featurep 'dbusbind) (dolist (elt tramp-gvfs-methods) (unless (assoc elt tramp-methods) (add-to-list 'tramp-methods (cons elt nil)))))

(defvar tramp-bluez-discover-devices-timeout 60 "\
Defines seconds since last bluetooth device discovery before rescanning.
A value of 0 would require an immediate discovery during hostname
completion, nil means to use always cached values for discovered
devices.")

(custom-autoload 'tramp-bluez-discover-devices-timeout "tramp-gvfs" t)

(defconst tramp-gvfs-file-name-handler-alist '((access-file . ignore) (add-name-to-file . tramp-handle-add-name-to-file) (copy-file . tramp-gvfs-handle-copy-file) (delete-directory . tramp-gvfs-handle-delete-directory) (delete-file . tramp-gvfs-handle-delete-file) (directory-file-name . tramp-handle-directory-file-name) (directory-files . tramp-handle-directory-files) (directory-files-and-attributes . tramp-handle-directory-files-and-attributes) (dired-compress-file . ignore) (dired-uncache . tramp-handle-dired-uncache) (expand-file-name . tramp-gvfs-handle-expand-file-name) (file-accessible-directory-p . tramp-handle-file-accessible-directory-p) (file-acl . ignore) (file-attributes . tramp-gvfs-handle-file-attributes) (file-directory-p . tramp-gvfs-handle-file-directory-p) (file-equal-p . tramp-handle-file-equal-p) (file-executable-p . tramp-gvfs-handle-file-executable-p) (file-exists-p . tramp-handle-file-exists-p) (file-in-directory-p . tramp-handle-file-in-directory-p) (file-local-copy . tramp-gvfs-handle-file-local-copy) (file-modes . tramp-handle-file-modes) (file-name-all-completions . tramp-gvfs-handle-file-name-all-completions) (file-name-as-directory . tramp-handle-file-name-as-directory) (file-name-case-insensitive-p . tramp-handle-file-name-case-insensitive-p) (file-name-completion . tramp-handle-file-name-completion) (file-name-directory . tramp-handle-file-name-directory) (file-name-nondirectory . tramp-handle-file-name-nondirectory) (file-newer-than-file-p . tramp-handle-file-newer-than-file-p) (file-notify-add-watch . tramp-gvfs-handle-file-notify-add-watch) (file-notify-rm-watch . tramp-handle-file-notify-rm-watch) (file-notify-valid-p . tramp-handle-file-notify-valid-p) (file-ownership-preserved-p . ignore) (file-readable-p . tramp-gvfs-handle-file-readable-p) (file-regular-p . tramp-handle-file-regular-p) (file-remote-p . tramp-handle-file-remote-p) (file-selinux-context . tramp-handle-file-selinux-context) (file-symlink-p . tramp-handle-file-symlink-p) (file-system-info . tramp-gvfs-handle-file-system-info) (file-truename . tramp-handle-file-truename) (file-writable-p . tramp-gvfs-handle-file-writable-p) (find-backup-file-name . tramp-handle-find-backup-file-name) (insert-directory . tramp-handle-insert-directory) (insert-file-contents . tramp-handle-insert-file-contents) (load . tramp-handle-load) (make-auto-save-file-name . tramp-handle-make-auto-save-file-name) (make-directory . tramp-gvfs-handle-make-directory) (make-directory-internal . ignore) (make-nearby-temp-file . tramp-handle-make-nearby-temp-file) (make-symbolic-link . tramp-handle-make-symbolic-link) (process-file . ignore) (rename-file . tramp-gvfs-handle-rename-file) (set-file-acl . ignore) (set-file-modes . ignore) (set-file-selinux-context . ignore) (set-file-times . ignore) (set-visited-file-modtime . tramp-handle-set-visited-file-modtime) (shell-command . ignore) (start-file-process . ignore) (substitute-in-file-name . tramp-handle-substitute-in-file-name) (temporary-file-directory . tramp-handle-temporary-file-directory) (unhandled-file-name-directory . ignore) (vc-registered . ignore) (verify-visited-file-modtime . tramp-handle-verify-visited-file-modtime) (write-region . tramp-gvfs-handle-write-region)) "\
Alist of handler functions for Tramp GVFS method.
Operations not mentioned here will be handled by the default Emacs primitives.")

(defsubst tramp-gvfs-file-name-p (filename) "\
Check if it's a filename handled by the GVFS daemon." (and (tramp-tramp-file-p filename) (let ((method (tramp-file-name-method (tramp-dissect-file-name filename)))) (and (stringp method) (member method tramp-gvfs-methods)))))

(autoload 'tramp-gvfs-file-name-handler "tramp-gvfs" "\
Invoke the GVFS related OPERATION.
First arg specifies the OPERATION, second arg is a list of arguments to
pass to the OPERATION.

\(fn OPERATION &rest ARGS)" nil nil)

(when (featurep 'dbusbind) (tramp-register-foreign-file-name-handler 'tramp-gvfs-file-name-p 'tramp-gvfs-file-name-handler))

;;;***

;;;### (autoloads nil "tramp-sh" "tramp-sh.el" (0 0 0 0))
;;; Generated autoloads from tramp-sh.el

(defvar tramp-inline-compress-start-size (unless (memq system-type '(windows-nt)) 4096) "\
The minimum size of compressing where inline transfer.
When inline transfer, compress transferred data of file
whose size is this value or above (up to `tramp-copy-size-limit').
If it is nil, no compression at all will be applied.")

(custom-autoload 'tramp-inline-compress-start-size "tramp-sh" t)

(defvar tramp-copy-size-limit 10240 "\
The maximum file size where inline copying is preferred over an out-of-the-band copy.
If it is nil, out-of-the-band copy will be used without a check.")

(custom-autoload 'tramp-copy-size-limit "tramp-sh" t)

(defvar tramp-terminal-type "dumb" "\
Value of TERM environment variable for logging in to remote host.
Because Tramp wants to parse the output of the remote shell, it is easily
confused by ANSI color escape sequences and suchlike.  Often, shell init
files conditionalize this setup based on the TERM environment variable.")

(custom-autoload 'tramp-terminal-type "tramp-sh" t)

(defvar tramp-histfile-override "~/.tramp_history" "\
When invoking a shell, override the HISTFILE with this value.
When setting to a string, it redirects the shell history to that
file.  Be careful when setting to \"/dev/null\"; this might
result in undesired results when using \"bash\" as shell.

The value t unsets any setting of HISTFILE, and sets both
HISTFILESIZE and HISTSIZE to 0.  If you set this variable to nil,
however, the *override* is disabled, so the history will go to
the default storage location, e.g. \"$HOME/.sh_history\".")

(custom-autoload 'tramp-histfile-override "tramp-sh" t)

(defconst tramp-display-escape-sequence-regexp "[[;0-9]+m" "\
Terminal control escape sequences for display attributes.")

(defconst tramp-device-escape-sequence-regexp "[[0-9]+n" "\
Terminal control escape sequences for device status.")

(defconst tramp-initial-end-of-output "#$ " "\
Prompt when establishing a connection.")

(defvar tramp-use-ssh-controlmaster-options t "\
Whether to use `tramp-ssh-controlmaster-options'.")

(custom-autoload 'tramp-use-ssh-controlmaster-options "tramp-sh" t)

(add-to-list 'tramp-methods '("rcp" (tramp-login-program "rsh") (tramp-login-args (("%h") ("-l" "%u"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-copy-program "rcp") (tramp-copy-args (("-p" "%k") ("-r"))) (tramp-copy-keep-date t) (tramp-copy-recursive t)))

(add-to-list 'tramp-methods '("remcp" (tramp-login-program "remsh") (tramp-login-args (("%h") ("-l" "%u"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-copy-program "rcp") (tramp-copy-args (("-p" "%k"))) (tramp-copy-keep-date t)))

(add-to-list 'tramp-methods '("scp" (tramp-login-program "ssh") (tramp-login-args (("-l" "%u") ("-p" "%p") ("%c") ("-e" "none") ("%h"))) (tramp-async-args (("-q"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-copy-program "scp") (tramp-copy-args (("-P" "%p") ("-p" "%k") ("-q") ("-r") ("%c"))) (tramp-copy-keep-date t) (tramp-copy-recursive t)))

(add-to-list 'tramp-methods '("scpx" (tramp-login-program "ssh") (tramp-login-args (("-l" "%u") ("-p" "%p") ("%c") ("-e" "none") ("-t" "-t") ("%h") ("/bin/sh"))) (tramp-async-args (("-q"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-copy-program "scp") (tramp-copy-args (("-P" "%p") ("-p" "%k") ("-q") ("-r") ("%c"))) (tramp-copy-keep-date t) (tramp-copy-recursive t)))

(add-to-list 'tramp-methods '("rsync" (tramp-login-program "ssh") (tramp-login-args (("-l" "%u") ("-p" "%p") ("%c") ("-e" "none") ("%h"))) (tramp-async-args (("-q"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-copy-program "rsync") (tramp-copy-args (("-t" "%k") ("-p") ("-r") ("-s") ("-c"))) (tramp-copy-env (("RSYNC_RSH") ("ssh" "%c"))) (tramp-copy-keep-date t) (tramp-copy-keep-tmpfile t) (tramp-copy-recursive t)))

(add-to-list 'tramp-methods '("rsh" (tramp-login-program "rsh") (tramp-login-args (("%h") ("-l" "%u"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c"))))

(add-to-list 'tramp-methods '("remsh" (tramp-login-program "remsh") (tramp-login-args (("%h") ("-l" "%u"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c"))))

(add-to-list 'tramp-methods '("ssh" (tramp-login-program "ssh") (tramp-login-args (("-l" "%u") ("-p" "%p") ("%c") ("-e" "none") ("%h"))) (tramp-async-args (("-q"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c"))))

(add-to-list 'tramp-methods '("sshx" (tramp-login-program "ssh") (tramp-login-args (("-l" "%u") ("-p" "%p") ("%c") ("-e" "none") ("-t" "-t") ("%h") ("/bin/sh"))) (tramp-async-args (("-q"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c"))))

(add-to-list 'tramp-methods '("telnet" (tramp-login-program "telnet") (tramp-login-args (("%h") ("%p") ("2>/dev/null"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c"))))

(add-to-list 'tramp-methods '("nc" (tramp-login-program "telnet") (tramp-login-args (("%h") ("%p") ("2>/dev/null"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-copy-program "nc") (tramp-copy-args (("-w" "1") ("-v") ("%h") ("%r"))) (tramp-remote-copy-program "nc") (tramp-remote-copy-args (("-l") ("-p" "%r") ("2>/dev/null")))))

(add-to-list 'tramp-methods '("su" (tramp-login-program "su") (tramp-login-args (("-") ("%u"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-connection-timeout 10)))

(add-to-list 'tramp-methods '("sg" (tramp-login-program "sg") (tramp-login-args (("-") ("%u"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-args ("-c")) (tramp-connection-timeout 10)))

(add-to-list 'tramp-methods '("sudo" (tramp-login-program "sudo") (tramp-login-args (("-u" "%u") ("-s") ("-H") ("-p" "P\"\"a\"\"s\"\"s\"\"w\"\"o\"\"r\"\"d\"\":"))) (tramp-login-env (("SHELL") ("/bin/sh"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-connection-timeout 10)))

(add-to-list 'tramp-methods '("doas" (tramp-login-program "doas") (tramp-login-args (("-u" "%u") ("-s"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-args ("-c")) (tramp-connection-timeout 10)))

(add-to-list 'tramp-methods '("ksu" (tramp-login-program "ksu") (tramp-login-args (("%u") ("-q"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-connection-timeout 10)))

(add-to-list 'tramp-methods '("krlogin" (tramp-login-program "krlogin") (tramp-login-args (("%h") ("-l" "%u") ("-x"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c"))))

(add-to-list 'tramp-methods `("plink" (tramp-login-program "plink") (tramp-login-args (("-l" "%u") ("-P" "%p") ("-ssh") ("-t") ("%h") ("\"") (,(format "env 'TERM=%s' 'PROMPT_COMMAND=' 'PS1=%s'" tramp-terminal-type tramp-initial-end-of-output)) ("/bin/sh") ("\""))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c"))))

(add-to-list 'tramp-methods `("plinkx" (tramp-login-program "plink") (tramp-login-args (("-load") ("%h") ("-t") ("\"") (,(format "env 'TERM=%s' 'PROMPT_COMMAND=' 'PS1=%s'" tramp-terminal-type tramp-initial-end-of-output)) ("/bin/sh") ("\""))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c"))))

(add-to-list 'tramp-methods `("pscp" (tramp-login-program "plink") (tramp-login-args (("-l" "%u") ("-P" "%p") ("-ssh") ("-t") ("%h") ("\"") (,(format "env 'TERM=%s' 'PROMPT_COMMAND=' 'PS1=%s'" tramp-terminal-type tramp-initial-end-of-output)) ("/bin/sh") ("\""))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-copy-program "pscp") (tramp-copy-args (("-l" "%u") ("-P" "%p") ("-scp") ("-p" "%k") ("-q") ("-r"))) (tramp-copy-keep-date t) (tramp-copy-recursive t)))

(add-to-list 'tramp-methods `("psftp" (tramp-login-program "plink") (tramp-login-args (("-l" "%u") ("-P" "%p") ("-ssh") ("-t") ("%h") ("\"") (,(format "env 'TERM=%s' 'PROMPT_COMMAND=' 'PS1=%s'" tramp-terminal-type tramp-initial-end-of-output)) ("/bin/sh") ("\""))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-c")) (tramp-copy-program "pscp") (tramp-copy-args (("-l" "%u") ("-P" "%p") ("-sftp") ("-p" "%k") ("-q"))) (tramp-copy-keep-date t)))

(add-to-list 'tramp-methods '("fcp" (tramp-login-program "fsh") (tramp-login-args (("%h") ("-l" "%u") ("sh" "-i"))) (tramp-remote-shell "/bin/sh") (tramp-remote-shell-login ("-l")) (tramp-remote-shell-args ("-i") ("-c")) (tramp-copy-program "fcp") (tramp-copy-args (("-p" "%k"))) (tramp-copy-keep-date t)))

(add-to-list 'tramp-default-method-alist `(,tramp-local-host-regexp "\\`root\\'" "su"))

(add-to-list 'tramp-default-user-alist `(,(concat "\\`" (regexp-opt '("su" "sudo" "doas" "ksu")) "\\'") nil "root"))

(add-to-list 'tramp-default-user-alist `(,(concat "\\`" (regexp-opt '("rcp" "remcp" "rsh" "telnet" "nc" "krlogin" "fcp")) "\\'") nil ,(user-login-name)))

(defconst tramp-completion-function-alist-rsh '((tramp-parse-rhosts "/etc/hosts.equiv") (tramp-parse-rhosts "~/.rhosts")) "\
Default list of (FUNCTION FILE) pairs to be examined for rsh methods.")

(defconst tramp-completion-function-alist-ssh '((tramp-parse-rhosts "/etc/hosts.equiv") (tramp-parse-rhosts "/etc/shosts.equiv") (tramp-parse-shosts "/etc/ssh_known_hosts") (tramp-parse-sconfig "/etc/ssh_config") (tramp-parse-shostkeys "/etc/ssh2/hostkeys") (tramp-parse-sknownhosts "/etc/ssh2/knownhosts") (tramp-parse-rhosts "~/.rhosts") (tramp-parse-rhosts "~/.shosts") (tramp-parse-shosts "~/.ssh/known_hosts") (tramp-parse-sconfig "~/.ssh/config") (tramp-parse-shostkeys "~/.ssh2/hostkeys") (tramp-parse-sknownhosts "~/.ssh2/knownhosts")) "\
Default list of (FUNCTION FILE) pairs to be examined for ssh methods.")

(defconst tramp-completion-function-alist-telnet '((tramp-parse-hosts "/etc/hosts")) "\
Default list of (FUNCTION FILE) pairs to be examined for telnet methods.")

(defconst tramp-completion-function-alist-su '((tramp-parse-passwd "/etc/passwd")) "\
Default list of (FUNCTION FILE) pairs to be examined for su methods.")

(defconst tramp-completion-function-alist-sg '((tramp-parse-etc-group "/etc/group")) "\
Default list of (FUNCTION FILE) pairs to be examined for sg methods.")

(defconst tramp-completion-function-alist-putty `((tramp-parse-putty ,(if (memq system-type '(windows-nt)) "HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions" "~/.putty/sessions"))) "\
Default list of (FUNCTION REGISTRY) pairs to be examined for putty sessions.")

(eval-after-load 'tramp '(progn (tramp-set-completion-function "rcp" tramp-completion-function-alist-rsh) (tramp-set-completion-function "remcp" tramp-completion-function-alist-rsh) (tramp-set-completion-function "scp" tramp-completion-function-alist-ssh) (tramp-set-completion-function "scpx" tramp-completion-function-alist-ssh) (tramp-set-completion-function "rsync" tramp-completion-function-alist-ssh) (tramp-set-completion-function "rsh" tramp-completion-function-alist-rsh) (tramp-set-completion-function "remsh" tramp-completion-function-alist-rsh) (tramp-set-completion-function "ssh" tramp-completion-function-alist-ssh) (tramp-set-completion-function "sshx" tramp-completion-function-alist-ssh) (tramp-set-completion-function "telnet" tramp-completion-function-alist-telnet) (tramp-set-completion-function "nc" tramp-completion-function-alist-telnet) (tramp-set-completion-function "su" tramp-completion-function-alist-su) (tramp-set-completion-function "sudo" tramp-completion-function-alist-su) (tramp-set-completion-function "doas" tramp-completion-function-alist-su) (tramp-set-completion-function "ksu" tramp-completion-function-alist-su) (tramp-set-completion-function "sg" tramp-completion-function-alist-sg) (tramp-set-completion-function "krlogin" tramp-completion-function-alist-rsh) (tramp-set-completion-function "plink" tramp-completion-function-alist-ssh) (tramp-set-completion-function "plinkx" tramp-completion-function-alist-putty) (tramp-set-completion-function "pscp" tramp-completion-function-alist-ssh) (tramp-set-completion-function "psftp" tramp-completion-function-alist-ssh) (tramp-set-completion-function "fcp" tramp-completion-function-alist-ssh)))

(defvar tramp-remote-path '(tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin") "\
List of directories to search for executables on remote host.
For every remote host, this variable will be set buffer local,
keeping the list of existing directories on that host.

You can use `~' in this list, but when searching for a shell which groks
tilde expansion, all directory names starting with `~' will be ignored.

`Default Directories' represent the list of directories given by
the command \"getconf PATH\".  It is recommended to use this
entry on head of this list, because these are the default
directories for POSIX compatible commands.  On remote hosts which
do not offer the getconf command (like cygwin), the value
\"/bin:/usr/bin\" is used instead.  This entry is represented in
the list by the special value `tramp-default-remote-path'.

`Private Directories' are the settings of the $PATH environment,
as given in your `~/.profile'.  This entry is represented in
the list by the special value `tramp-own-remote-path'.")

(custom-autoload 'tramp-remote-path "tramp-sh" t)

(defvar tramp-remote-process-environment '("ENV=''" "TMOUT=0" "LC_CTYPE=''" "CDPATH=" "HISTORY=" "MAIL=" "MAILCHECK=" "MAILPATH=" "PAGER=cat" "autocorrect=" "correct=") "\
List of environment variables to be set on the remote host.

Each element should be a string of the form ENVVARNAME=VALUE.  An
entry ENVVARNAME= disables the corresponding environment variable,
which might have been set in the init files like ~/.profile.

Special handling is applied to some environment variables,
which should not be set here:

The PATH environment variable should be set via `tramp-remote-path'.

The TERM environment variable should be set via `tramp-terminal-type'.

The INSIDE_EMACS environment variable will automatically be set
based on the Tramp and Emacs versions, and should not be set here.")

(custom-autoload 'tramp-remote-process-environment "tramp-sh" t)

(defvar tramp-sh-extra-args '(("/bash\\'" . "-norc -noprofile")) "\
Alist specifying extra arguments to pass to the remote shell.
Entries are (REGEXP . ARGS) where REGEXP is a regular expression
matching the shell file name and ARGS is a string specifying the
arguments.

This variable is only used when Tramp needs to start up another shell
for tilde expansion.  The extra arguments should typically prevent the
shell from reading its init file.")

(custom-autoload 'tramp-sh-extra-args "tramp-sh" t)

(defconst tramp-sh-file-name-handler-alist '((add-name-to-file . tramp-sh-handle-add-name-to-file) (copy-directory . tramp-sh-handle-copy-directory) (copy-file . tramp-sh-handle-copy-file) (delete-directory . tramp-sh-handle-delete-directory) (delete-file . tramp-sh-handle-delete-file) (directory-file-name . tramp-handle-directory-file-name) (directory-files . tramp-handle-directory-files) (directory-files-and-attributes . tramp-sh-handle-directory-files-and-attributes) (dired-compress-file . tramp-sh-handle-dired-compress-file) (dired-uncache . tramp-handle-dired-uncache) (expand-file-name . tramp-sh-handle-expand-file-name) (file-accessible-directory-p . tramp-handle-file-accessible-directory-p) (file-acl . tramp-sh-handle-file-acl) (file-attributes . tramp-sh-handle-file-attributes) (file-directory-p . tramp-sh-handle-file-directory-p) (file-equal-p . tramp-handle-file-equal-p) (file-executable-p . tramp-sh-handle-file-executable-p) (file-exists-p . tramp-sh-handle-file-exists-p) (file-in-directory-p . tramp-handle-file-in-directory-p) (file-local-copy . tramp-sh-handle-file-local-copy) (file-modes . tramp-handle-file-modes) (file-name-all-completions . tramp-sh-handle-file-name-all-completions) (file-name-as-directory . tramp-handle-file-name-as-directory) (file-name-case-insensitive-p . tramp-handle-file-name-case-insensitive-p) (file-name-completion . tramp-handle-file-name-completion) (file-name-directory . tramp-handle-file-name-directory) (file-name-nondirectory . tramp-handle-file-name-nondirectory) (file-newer-than-file-p . tramp-sh-handle-file-newer-than-file-p) (file-notify-add-watch . tramp-sh-handle-file-notify-add-watch) (file-notify-rm-watch . tramp-handle-file-notify-rm-watch) (file-notify-valid-p . tramp-handle-file-notify-valid-p) (file-ownership-preserved-p . tramp-sh-handle-file-ownership-preserved-p) (file-readable-p . tramp-sh-handle-file-readable-p) (file-regular-p . tramp-handle-file-regular-p) (file-remote-p . tramp-handle-file-remote-p) (file-selinux-context . tramp-sh-handle-file-selinux-context) (file-symlink-p . tramp-handle-file-symlink-p) (file-system-info . tramp-sh-handle-file-system-info) (file-truename . tramp-sh-handle-file-truename) (file-writable-p . tramp-sh-handle-file-writable-p) (find-backup-file-name . tramp-handle-find-backup-file-name) (insert-directory . tramp-sh-handle-insert-directory) (insert-file-contents . tramp-handle-insert-file-contents) (load . tramp-handle-load) (make-auto-save-file-name . tramp-handle-make-auto-save-file-name) (make-directory . tramp-sh-handle-make-directory) (make-nearby-temp-file . tramp-handle-make-nearby-temp-file) (make-symbolic-link . tramp-sh-handle-make-symbolic-link) (process-file . tramp-sh-handle-process-file) (rename-file . tramp-sh-handle-rename-file) (set-file-acl . tramp-sh-handle-set-file-acl) (set-file-modes . tramp-sh-handle-set-file-modes) (set-file-selinux-context . tramp-sh-handle-set-file-selinux-context) (set-file-times . tramp-sh-handle-set-file-times) (set-visited-file-modtime . tramp-sh-handle-set-visited-file-modtime) (shell-command . tramp-handle-shell-command) (start-file-process . tramp-sh-handle-start-file-process) (substitute-in-file-name . tramp-handle-substitute-in-file-name) (temporary-file-directory . tramp-handle-temporary-file-directory) (unhandled-file-name-directory . ignore) (vc-registered . tramp-sh-handle-vc-registered) (verify-visited-file-modtime . tramp-sh-handle-verify-visited-file-modtime) (write-region . tramp-sh-handle-write-region)) "\
Alist of handler functions.
Operations not mentioned here will be handled by the normal Emacs functions.")

(autoload 'tramp-sh-file-name-handler "tramp-sh" "\
Invoke remote-shell Tramp file name handler.
Fall back to normal file name handler if no Tramp handler exists.

\(fn OPERATION &rest ARGS)" nil nil)

(tramp-register-foreign-file-name-handler 'identity 'tramp-sh-file-name-handler 'append)

;;;***

;;;### (autoloads nil "tramp-smb" "tramp-smb.el" (0 0 0 0))
;;; Generated autoloads from tramp-smb.el

(defconst tramp-smb-method "smb" "\
Method to connect SAMBA and M$ SMB servers.")

(unless (memq system-type '(cygwin windows-nt)) (add-to-list 'tramp-methods `(,tramp-smb-method (tramp-remote-shell "") (tramp-tmpdir "/C$/Temp") (tramp-case-insensitive t))))

(add-to-list 'tramp-default-user-alist `(,(concat "\\`" tramp-smb-method "\\'") nil nil))

(eval-after-load 'tramp '(tramp-set-completion-function tramp-smb-method '((tramp-parse-netrc "~/.netrc"))))

(defvar tramp-smb-program "smbclient" "\
Name of SMB client to run.")

(custom-autoload 'tramp-smb-program "tramp-smb" t)

(defvar tramp-smb-acl-program "smbcacls" "\
Name of SMB acls to run.")

(custom-autoload 'tramp-smb-acl-program "tramp-smb" t)

(defvar tramp-smb-conf "/dev/null" "\
Path of the smb.conf file.
If it is nil, no smb.conf will be added to the `tramp-smb-program'
call, letting the SMB client use the default one.")

(custom-autoload 'tramp-smb-conf "tramp-smb" t)

(defconst tramp-smb-file-name-handler-alist '((add-name-to-file . tramp-smb-handle-add-name-to-file) (copy-directory . tramp-smb-handle-copy-directory) (copy-file . tramp-smb-handle-copy-file) (delete-directory . tramp-smb-handle-delete-directory) (delete-file . tramp-smb-handle-delete-file) (directory-file-name . tramp-handle-directory-file-name) (directory-files . tramp-smb-handle-directory-files) (directory-files-and-attributes . tramp-handle-directory-files-and-attributes) (dired-compress-file . ignore) (dired-uncache . tramp-handle-dired-uncache) (expand-file-name . tramp-smb-handle-expand-file-name) (file-accessible-directory-p . tramp-smb-handle-file-directory-p) (file-acl . tramp-smb-handle-file-acl) (file-attributes . tramp-smb-handle-file-attributes) (file-directory-p . tramp-smb-handle-file-directory-p) (file-file-equal-p . tramp-handle-file-equal-p) (file-executable-p . tramp-handle-file-exists-p) (file-exists-p . tramp-handle-file-exists-p) (file-in-directory-p . tramp-handle-file-in-directory-p) (file-local-copy . tramp-smb-handle-file-local-copy) (file-modes . tramp-handle-file-modes) (file-name-all-completions . tramp-smb-handle-file-name-all-completions) (file-name-as-directory . tramp-handle-file-name-as-directory) (file-name-case-insensitive-p . tramp-handle-file-name-case-insensitive-p) (file-name-completion . tramp-handle-file-name-completion) (file-name-directory . tramp-handle-file-name-directory) (file-name-nondirectory . tramp-handle-file-name-nondirectory) (file-newer-than-file-p . tramp-handle-file-newer-than-file-p) (file-notify-add-watch . tramp-handle-file-notify-add-watch) (file-notify-rm-watch . tramp-handle-file-notify-rm-watch) (file-notify-valid-p . tramp-handle-file-notify-valid-p) (file-ownership-preserved-p . ignore) (file-readable-p . tramp-handle-file-exists-p) (file-regular-p . tramp-handle-file-regular-p) (file-remote-p . tramp-handle-file-remote-p) (file-selinux-context . tramp-handle-file-selinux-context) (file-symlink-p . tramp-handle-file-symlink-p) (file-system-info . tramp-smb-handle-file-system-info) (file-truename . tramp-handle-file-truename) (file-writable-p . tramp-smb-handle-file-writable-p) (find-backup-file-name . tramp-handle-find-backup-file-name) (insert-directory . tramp-smb-handle-insert-directory) (insert-file-contents . tramp-handle-insert-file-contents) (load . tramp-handle-load) (make-auto-save-file-name . tramp-handle-make-auto-save-file-name) (make-directory . tramp-smb-handle-make-directory) (make-directory-internal . tramp-smb-handle-make-directory-internal) (make-nearby-temp-file . tramp-handle-make-nearby-temp-file) (make-symbolic-link . tramp-smb-handle-make-symbolic-link) (process-file . tramp-smb-handle-process-file) (rename-file . tramp-smb-handle-rename-file) (set-file-acl . tramp-smb-handle-set-file-acl) (set-file-modes . tramp-smb-handle-set-file-modes) (set-file-selinux-context . ignore) (set-file-times . ignore) (set-visited-file-modtime . tramp-handle-set-visited-file-modtime) (shell-command . tramp-handle-shell-command) (start-file-process . tramp-smb-handle-start-file-process) (substitute-in-file-name . tramp-smb-handle-substitute-in-file-name) (temporary-file-directory . tramp-handle-temporary-file-directory) (unhandled-file-name-directory . ignore) (vc-registered . ignore) (verify-visited-file-modtime . tramp-handle-verify-visited-file-modtime) (write-region . tramp-smb-handle-write-region)) "\
Alist of handler functions for Tramp SMB method.
Operations not mentioned here will be handled by the default Emacs primitives.")

(defvar tramp-smb-winexe-program "winexe" "\
Name of winexe client to run.
If it isn't found in the local $PATH, the absolute path of winexe
shall be given.  This is needed for remote processes.")

(custom-autoload 'tramp-smb-winexe-program "tramp-smb" t)

(defvar tramp-smb-winexe-shell-command "powershell.exe" "\
Shell to be used for processes on remote machines.
This must be Powershell V2 compatible.")

(custom-autoload 'tramp-smb-winexe-shell-command "tramp-smb" t)

(defvar tramp-smb-winexe-shell-command-switch "-file -" "\
Command switch used together with `tramp-smb-winexe-shell-command'.
This can be used to disable echo etc.")

(custom-autoload 'tramp-smb-winexe-shell-command-switch "tramp-smb" t)

(defsubst tramp-smb-file-name-p (filename) "\
Check if it's a filename for SMB servers." (string= (tramp-file-name-method (tramp-dissect-file-name filename)) tramp-smb-method))

(autoload 'tramp-smb-file-name-handler "tramp-smb" "\
Invoke the SMB related OPERATION.
First arg specifies the OPERATION, second arg is a list of arguments to
pass to the OPERATION.

\(fn OPERATION &rest ARGS)" nil nil)

(unless (memq system-type '(cygwin windows-nt)) (tramp-register-foreign-file-name-handler 'tramp-smb-file-name-p 'tramp-smb-file-name-handler))

;;;***

;;;### (autoloads nil "tramp-uu" "tramp-uu.el" (0 0 0 0))
;;; Generated autoloads from tramp-uu.el

(autoload 'tramp-uuencode-region "tramp-uu" "\
UU-encode the region between BEG and END.

\(fn BEG END)" nil nil)

;;;***

;;;### (autoloads nil "trampver" "trampver.el" (0 0 0 0))
;;; Generated autoloads from trampver.el

(defconst tramp-version "2.3.5.26.3" "\
This version of Tramp.")

(defconst tramp-bug-report-address "tramp-devel@gnu.org" "\
Email address to send bug reports to.")

;;;***

;;;### (autoloads nil nil ("ange-ftp.el" "browse-url.el" "dbus.el"
;;;;;;  "dig.el" "dns.el" "eudc-bob.el" "eudc-export.el" "eudc-hotlist.el"
;;;;;;  "eudc-vars.el" "eudc.el" "eudcb-bbdb.el" "eudcb-ldap.el"
;;;;;;  "eudcb-mab.el" "eww.el" "gnutls.el" "goto-addr.el" "hmac-def.el"
;;;;;;  "hmac-md5.el" "imap.el" "ldap.el" "mailcap.el" "mairix.el"
;;;;;;  "net-utils.el" "netrc.el" "network-stream.el" "newst-backend.el"
;;;;;;  "newst-plainview.el" "newst-reader.el" "newst-ticker.el"
;;;;;;  "newst-treeview.el" "newsticker.el" "nsm.el" "ntlm.el" "pop3.el"
;;;;;;  "puny.el" "quickurl.el" "rcirc.el" "rfc2104.el" "rlogin.el"
;;;;;;  "sasl-cram.el" "sasl-digest.el" "sasl-ntlm.el" "sasl-scram-rfc.el"
;;;;;;  "sasl.el" "secrets.el" "shr-color.el" "shr.el" "sieve-manage.el"
;;;;;;  "sieve-mode.el" "sieve.el" "snmp-mode.el" "soap-client.el"
;;;;;;  "soap-inspect.el" "socks.el" "starttls.el" "telnet.el" "tls.el"
;;;;;;  "tramp-compat.el" "webjump.el" "zeroconf.el") (0 0 0 0))

;;;***

(provide 'tramp-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; tramp-loaddefs.el ends here
