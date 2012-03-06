guard 'bundler' do
  watch('Gemfile')
end

guard 'rspec', :version => 2, :cli => '--color --format documentation' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})        { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/models/(.+)\.rb$}) { |m| "spec/models/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')     { "spec" }
  watch(%r{^spec/support/.+\.rb$}) { "spec" }
  watch('config/config.yml')       { "spec" }
end
