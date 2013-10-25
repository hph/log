if File.exists?('./config/database.yml')
  db = YAML.load_file('./config/database.yml')[ENV['STATUS'] || 'development']
  ActiveRecord::Base.establish_connection(
    adapter:  db['adapter'] == 'postgres' ? 'postgresql' : db['adapter'],
    host:     db['host'],
    username: db['username'],
    password: db['password'],
    database: db['database'],
    encoding: 'utf8'
  )
else
  puts 'Fatal error - no database configuration specified.'
  exit
end
