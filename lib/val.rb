# Keep track of key/value pairs in a .key-valerie file.
#
# USAGE
#
# Setting a token:
#
#   $ val foo bar
#
# Getting a token:
#
#   $ val foo
#
# will return "bar"
#
# Unsetting a token:
#
#   $ val foo --unset
#
# will delete the "bar"
#
# Listing all tokens:
#
#   $ val
#
# TODO Real options

class KeyValerie
  def initialize(args)
    init unless File.exist?(tokens)
    sym = case
    when args.empty?            then :list
    when args.delete('--unset') then :unset
    else args.length > 1 ? :set : :get
    end ; send(sym, *args)
  end

  def get(key)
    if token = store[key]
      puts token
    end
  end

  def set(key, val)
    store[key] = val and save(store)
    puts "set `#{key}` to #{val}"
  end

  def unset(key)
    store.delete(key) and save(store)
    puts "unset `#{key}` token"
  end

  def list
    puts "Key/Value Pairs:"
    store.each do |key, val|
      puts "- #{key}: #{val}"
    end
  end

  private

  def init
    File.open(tokens, 'w+') { |f| f << '' }
  end

  def save(new_store)
    File.open(tokens, 'w+') do |file|
      store.each do |key,val|
        file.puts key
        file.puts val
      end
    end
  end

  def store
    @store ||= Hash[*File.read(tokens).split(/\n/)] || {}
  end

  def tokens
    File.join(ENV['HOME'], '.key-valerie')
  end
end
