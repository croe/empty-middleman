lock '3.3.5'




set :application, 'ucho-ten'
set :repo_url, 'git@bitbucket.org:2YY/my-app.git'
set :branch, 'master'
set :format, :pretty
set :log_level, :debug
set :keep_releases, 2




set :ssh_options, {
  auth_methods: %w(publickey)
}



namespace :deploy do
  desc "build middleman sources"
  task :middleman_build do
  	on roles(:web) do
      execute "cd '#{release_path}'; bundle exec middleman build"
    end
  end
  before 'deploy:updated', 'deploy:middleman_build'
end
