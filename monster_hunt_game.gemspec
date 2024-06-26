require_relative 'lib/monster_hunt_game/version'

Gem::Specification.new do |spec|
  spec.name          = "monster_hunt_game"
  spec.version       = MonsterHuntGame::VERSION
  spec.authors       = ["batako"]
  spec.email         = ["232313+batako@users.noreply.github.com"]

  spec.summary       = "A simple monster hunting game for the console"
  spec.description   = "This gem allows you to play a text-based monster hunting game in the console."
  spec.homepage      = "https://github.com/batako/monster_hunt_game"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/batako/monster_hunt_game"
  spec.metadata["changelog_uri"] = "https://github.com/batako/monster_hunt_game/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
