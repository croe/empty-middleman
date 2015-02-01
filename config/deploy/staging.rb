set :branch, 'develop'
set :deploy_to, "/usr/share/nginx/html/testup/my-app/"
set :bower_flags, '--allow-root'
set :bundle_rols, :web
set :bundle_jobs, 2




server 'www.example.com', user: 'root', roles: %w{web}
