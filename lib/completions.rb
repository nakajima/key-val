require File.join(File.dirname(__FILE__), *%w[val])

TabTab::Definition.register('val') do |c|
  KeyValerie.new.each do |key,val|
    c.command key, "Reveal value for #{key}"
  end
end