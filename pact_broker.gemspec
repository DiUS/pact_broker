# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pact_broker/version'


Gem::Specification.new do |gem|

  gem.name          = "pact_broker"
  gem.version       = PactBroker::VERSION
  gem.authors       = ["Bethany Skurrie", "Sergei Matheson", "Warner Godfrey"]
  gem.email         = ["bskurrie@dius.com.au", "serge.matheson@rea-group.com", "warner@warnergodfrey.com"]
  gem.description   = %q{A server that stores and returns pact files generated by the pact gem. It enables head/prod cross testing of the consumer and provider projects.}
  gem.summary       = %q{See description}
  gem.homepage      = "https://github.com/pact-foundation/pact_broker"

  gem.required_ruby_version = '>= 2.2.0'

  gem.files         = begin
                        if Dir.exist?(".git")
                          `git ls-files`.split($/)
                        else
                          root_path      = File.dirname(__FILE__)
                          all_files      = Dir.chdir(root_path) { Dir.glob("**/{*,.*}") }
                          all_files.reject! { |file| [".", ".."].include?(File.basename(file)) || File.directory?(file)}
                          gitignore_path = File.join(root_path, ".gitignore")
                          gitignore      = File.readlines(gitignore_path)
                          gitignore.map!    { |line| line.chomp.strip }
                          gitignore.reject! { |line| line.empty? || line =~ /^(#|!)/ }

                          all_files.reject do |file|
                            gitignore.any? do |ignore|
                              file.start_with?(ignore) ||
                                File.fnmatch(ignore, file, File::FNM_PATHNAME) ||
                                File.fnmatch(ignore, File.basename(file), File::FNM_PATHNAME)
                            end
                          end
                        end
                      end
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.license       = 'MIT'

  #gem.add_runtime_dependency 'pact'
  gem.add_runtime_dependency 'httparty', '~> 0.14'
  gem.add_runtime_dependency 'json', '~> 2.3'
  gem.add_runtime_dependency 'roar', '~> 1.1'
  gem.add_runtime_dependency 'reform', '~> 2.3.3'
  gem.add_runtime_dependency 'dry-validation', '~> 0.10.5'
  gem.add_runtime_dependency 'sequel', '~> 5.28'
  gem.add_runtime_dependency 'webmachine', '1.5.0'
  gem.add_runtime_dependency 'semver2', '~> 3.4.2'
  gem.add_runtime_dependency 'rack', '>= 2.2.3', '~> 2.2'
  gem.add_runtime_dependency 'redcarpet', '>= 3.5.1', '~>3.5'
  gem.add_runtime_dependency 'pact-support' , '~> 1.16', '>= 1.16.4'
  gem.add_runtime_dependency 'padrino-core', '>= 0.14.3', '~> 0.14'
  gem.add_runtime_dependency 'sinatra', '>= 2.0.8.1', '< 3.0'
  gem.add_runtime_dependency 'haml', '~>5.0'
  gem.add_runtime_dependency 'sucker_punch', '~>2.0'
  gem.add_runtime_dependency 'rack-protection', '>= 2.0.8.1', '< 3.0'
  gem.add_runtime_dependency 'dry-types', '~> 0.10.3' # https://travis-ci.org/pact-foundation/pact_broker/jobs/249448621
  gem.add_runtime_dependency 'dry-logic', '0.4.2' # Later version cases ArgumentError: wrong number of arguments
  gem.add_runtime_dependency 'table_print', '~> 1.5'
  gem.add_runtime_dependency 'semantic_logger', '~> 4.3'
  gem.add_runtime_dependency 'sanitize', '>= 5.2.1', '~> 5.2'
end
