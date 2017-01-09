role :app, 'encontreescolas.rolesoftware.com'
role :web, 'encontreescolas.rolesoftware.com'
role :db,  'encontreescolas.rolesoftware.com'

set :branch, 'master'
set :deploy_to, '/home/encontreescolas/testeagendakids/staging'
set :rails_env, 'staging'
server 'encontreescolas.rolesoftware.com', user: 'encontreescolas', roles: %w{app db web}