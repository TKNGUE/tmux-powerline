# This checks if the current branch is ahead of
# or behind the remote branch with which it is tracked

# Source lib to get the function get_tmux_pwd
source "${TMUX_POWERLINE_DIR_LIB}/tmux_adapter.sh"


run_segment() {
    tmux_path=$(get_tmux_cwd)
    cd "$tmux_path"
    stats=""
    if [ -n "${git_stats=$(__parse_git_stats)}" ]; then
        stats="$git_stats"
    elif [ -n "${svn_stats=$(__parse_svn_stats)}" ]; then
        stats="$svn_stats"
    elif [ -n "${hg_stats=$(__parse_hg_stats)}" ]; then
        stats="$hg_stats"
    fi

    if [ -n "$stats" ]; then
        echo "${stats}"
    fi
    return 0
}

__parse_git_stats() {
    type git >/dev/null 2>&1
    if [ "$?" -ne 0 ]; then
        return
    fi

    # check if git
    [[ -z $(git rev-parse --git-dir 2> /dev/null) ]] && return

    branch=$(git diff --shortstat | sed -E -e 's/, / /g' -e 's/([0-9]*) insertions?\(\+\)/+\1/' -e 's/([0-9]*) deletions?\(-\)/-\1/' -e 's/([0-9]+) files? changed/📚. \1/')
    echo $branch
}

__parse_hg_stats() {
    type hg >/dev/null 2>&1
    if [ "$?" -ne 0 ]; then
        return
    fi
    # not yet implemented
}

__parse_svn_stats() {
    type svn >/dev/null 2>&1
    if [ "$?" -ne 0 ]; then
        return
    fi
    # not yet implemented
}
