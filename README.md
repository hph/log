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

For Status to work, you must first install PostgreSQL and Ruby 2.0.0 [1].
Then you can simply run the following commands:

    git clone https://github.com/hph/status.git
    bundle install
    createdb status

You must also edit `config/database.yml` according to your needs.

[1] You could use SQLite or MySQL but you will have to install the gems yourself.
The same goes for the Ruby version, if you want to use an older one, you can
change the specified version in `Gemfile`.

Roadmap
-------

The command-line interface to `status.rb` is nonexistent. Users should be able
to specify tags and permissions, delete messages and search for old messags.
Users should be able to search for messages from other users via the
command-line interface. The web interface should allow logins for restricted
messages.
