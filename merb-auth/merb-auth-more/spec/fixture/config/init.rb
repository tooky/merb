# Go to http://wiki.merbivore.com/pages/init-rb
 
# Specify a specific version of a dependency
# dependency "RedCloth", "> 3.0"
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = 'd4bf87657779bc37dcd7df73359e61d7b550e2ab'  # required for cookie session store
  # c[:session_id_key] = '_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end

dependency "merb-auth-core"
dependency "merb-auth-more"

# The runner app isn't loading all the paths correctly :(
Merb::BootLoader.after_app_loads do
  Dir[Merb.root / "merb" / "merb-auth" / "*.rb"].each{|f| require f}
end