# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{key-val}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Nakajima"]
  s.date = %q{2009-05-09}
  s.default_executable = %q{val}
  s.email = %q{patnakajima@gmail.com}
  s.executables = ["val"]
  s.files = ["bin/val", "lib/val.rb", "lib/completions.rb"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Easily get or set key/value pairs from ~/.key-valerie}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
