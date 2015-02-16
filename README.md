# geheim

geheim (German for "secret") is a very simple password manager which follows
the Unix principles to use existing tools if they are available instead of
doing everything your own.

## Installation

No installation is necessary, but if you want, you can copy bin/geheim to, e.g.
/usr/local/bin to make it available to all users.

The user's password database is stored in ~/.geheim.db, see doc/storage.md for
more details.

## Setup the test database

To play around with, or to erase its contents completely and create your own
structure for your password data, you can use the test database.

Take a look at test/storage for what will get it into the database, and build
it with

    make -C test all

If you use "install" instead of "all" in the above command, the generated
database will be copied to it's default location.

You can specify an alternate location for the database using the environment
variable $GEHEIM\_DATA.

## Usage

    # List the current nodes in the password file
    geheim list
    
    # Get the content of a node
    geheim get /email/john@doe.name
    
    # Add a node
    geheim add /email/john.doe@example.com <<EOF
    Password: SuperSecretPassword
    EOF

