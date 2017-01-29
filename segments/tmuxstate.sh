# Prints the current weather in Celsius, Fahrenheits or lord Kelvins. The forecast is cached and updated with a period of $update_period.

# The update period in seconds.
# update_period=600

# TMUX_POWERLINE_SEG_WEATHER_DATA_PROVIDER_DEFAULT="yahoo"
# TMUX_POWERLINE_SEG_WEATHER_UNIT_DEFAULT="c"
# TMUX_POWERLINE_SEG_WEATHER_UPDATE_PERIOD_DEFAULT="600"
# if shell_is_bsd; then
# 	TMUX_POWERLINE_SEG_WEATHER_GREP_DEFAULT="/usr/local/bin/grep"
# else
# 	TMUX_POWERLINE_SEG_WEATHER_GREP_DEFAULT="grep"
# fi


run_segment() {
    enable_sync=`tmux show-options -w | grep 'sync.* on'`
    if [[ $enable_sync ]]; then
        echo 'Sync ⟲ '
    else
        echo ''
    fi
}



