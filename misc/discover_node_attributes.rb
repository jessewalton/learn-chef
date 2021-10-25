require "active_support/core_ext/hash/except"

# add custom attributes
#node.default['foo'] = "foo"
#node.default['bar']['baz'] = "barbaz"

# copy node and remove non-user-defined attributes
nodeCopy = node.default.clone
nodeCopy.except!(:network)
nodeCopy.except!(:audit)

# convert to json
output="#{Chef::JSONCompat.to_json_pretty(nodeCopy.to_hash)}"

# write json to file
file "#{ENV['HOME']}/attributes.txt" do
  content output
end
