# val

Easily store and retrieve key/value pairs in an encrypted `~/.key-valerie`
Useful for things like pesky API keys.

## USAGE

### Setting a token:

    $ val foo bar

### Getting a token..

    $ val foo

...will return "bar"

### Unsetting a token...

    $ val foo --unset

...will delete the "bar"

### Listing all tokens:

    $ val

That's it and that's all folks.

## Tab Completions

Install Dr. Nic's `tabtab` gem, then add this line to the bottom
of your `~/.tabtab.bash`:

    complete -o default -C 'tabtab --gem key-valerie/lib/completions.rb' val

Then you can tab complete the keys.
