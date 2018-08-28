# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :bitly, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:bitly, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

config :bitly, access_token: System.get_env("BITLY_ACCESS_TOKEN")
# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#import_config "#{Mix.env}.exs"


# "groups" => [
#   %{
#     "bsds" => [],
#     "created" => "2017-08-18T21:28:16+0000",
#     "guid" => "Bh8ilzfe2X0",
#     "is_active" => true,
#     "modified" => "2017-08-18T21:28:16+0000",
#     "name" => "taedori",
#     "organization_guid" => "Oh8ilvjvR4E",
#     "references" => %{
#       "organization" => "https://api-ssl.bitly.com/v4/organizations/Oh8ilvjvR4E"
#     },
#     "role" => "org-admin"
#   }
