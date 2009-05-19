# Keep track of key/value pairs in a .key-val file.
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
require 'yaml'
begin
  require 'crypt/blowfish'
rescue LoadError
  puts "You must install the `crypt` gem."
end

class KeyValerie
  def run(args)
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

  def each
    store.each { |key,val| yield(key,val) }
  end

  def keys
    store.keys
  end

  private

  def crypter
    @crypter ||= Crypt::Blowfish.new('val-crypt-key')
  end

  def init
    File.open(tokens, 'w+') { |f| f << '' }
  end

  def save(new_store)
    File.open(tokens, 'w+') do |file|
      file << crypter.encrypt_string(store.to_yaml)
    end
  end

  def store
    @store ||= begin
      text = File.read(tokens)
      text.empty? ? {} : YAML.load(crypter.decrypt_string(text))
    end
  end

  def tokens
    File.join(ENV['HOME'], '.key-val')
  end
end
