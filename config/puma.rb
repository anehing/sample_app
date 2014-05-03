rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///data/apps/appname/shared/tmp/puma/appname-puma.sock"
pidfile "/data/apps/appname/current/tmp/puma/pid"
state_path "/data/apps/appname/current/tmp/puma/state"

activate_control_app