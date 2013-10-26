Status
======

Collaborate with others by posting short messages via a comamnd-line interface
to the web!

Usage
-----

Open two terminals. Run `./app.rb` in one and `./status.rb <some message>` in
the other. Now visit [http://localhost:4567](http://localhost:4567). You should
see the message you just posted.

Installation
------------

For Status to work, you must first install PostgreSQL [1] and Ruby 2.0.0.
Then you can simply run the following commands:

    git clone https://github.com/hph/status.git && cd status
    bundle install
    createdb status
    rake db:schema:load

Now you will have to create a directory called `config` and inside it, a file
called `database.yml`. It should look somewhat like this:

    default:
      adapter:  'postgresql'
      host:     'localhost'
      username: 'your_db_username'
      password: 'your_db_password'
      database: 'status'

This defines a database connection for the `default` environment. If you have
defined another environment and you wish to use it instead, you must set the
environment variable `STATUS_ENV` to the preferred environment [2].

If you've installed the program on a server and want to post to it from your
local machine, you must set the `STATUS_SERVER` environment variable to the
address of the remote server (running `app.rb`) [3].

Installation Notes
------------------

1. You could use SQLite or MySQL but you will have to install the gems yourself.
The same goes for the Ruby version, if you want to use an older one, you can
change the specified version in `Gemfile`.

2. Add a statement to your shell configuration file, e.g., `~/.zshrc`:
`export STATUS_ENV=example`

3. Add a statement to your shell configuration file, e.g., `~/.zshrc`:
`export STATUS_SERVER=http://example.com`

Roadmap
-------

The command-line interface to `status.rb` is nonexistent. Users should be able
to specify tags and permissions, delete messages and search for old messags.
Users should be able to search for messages from other users via the
command-line interface. The web interface should allow logins for restricted
messages.
