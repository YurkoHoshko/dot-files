export def zellij-hook-run [
  producer: string,            # Nushell snippet to produce the value
  template: string = "%s",     # printf-style template; %s replaced with value
] {
  let origin = $env.ZELLIJ_PANE_ID? | default ""
  if $origin == "" {
    print "zellij-hook: not inside zellij; nothing to do."
    return
  }

  let helper = '''
LOG=${LOG:-/tmp/zellij-hook.log}
ts(){ date +"%H:%M:%S.%3N"; }
log(){ printf "%s %s\n" "$(ts)" "$*" >>"$LOG"; }

    log "[zellij-hook] helper pane=$ZELLIJ_PANE_ID origin=$0 producer=\"$1\" template=\"$2\""
    value=$(nu -n -c "$1" | tr -d "\r" | tr "\n" " " | sed "s/[[:space:]]\\{1,\\}/ /g" | sed "s/^ //; s/ $//")
log "[zellij-hook] value=\"$value\""

if [ -z "$value" ]; then
  log "[zellij-hook] empty value; skipping"
  exit 0
fi

cmd=$(printf "$2" "$value")
log "[zellij-hook] sending: $cmd"

    # Assume Helix is the previous pane; send normal-mode open command.
    zellij action focus-previous-pane
    zellij action write 27
    zellij action write-chars "$cmd"
    zellij action write 13
    zellij action focus-next-pane   # return focus to helper pane
    zellij ac close-pane            # close helper pane only
'''

  zellij run --close-on-exit -- sh -c $helper $origin $producer $template
}
