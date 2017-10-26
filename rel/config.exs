use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :dev

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"fz<p{sNGI::@|1sTad7:XwO]_BX&SqM7X}<D;!D]ph29I.F$X4G_!u%4lG$<ZKOU"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"3Hsc)UuGjMB)>~xCI${?khzJJUl@lBK1Pr`Du?H6vn}0CQq5C_n[huZ)fOZa@{/1"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :amnesia_api do
  set version: current_version(:amnesia_api)
end

