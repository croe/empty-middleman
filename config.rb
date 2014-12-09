###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  blog.name = "info"

  # This will add a prefix to all links, template references and source paths
  blog.prefix = "info"

  blog.permalink = "{category}/{year}/{month}/{day}/{id}.html"
  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}-{id}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".slim"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
end

after_configuration do
  sprockets.append_path "#{root}/bower_components"
  sprockets.append_path "#{root}/bower_components/fontawesome/fonts"
  sprockets.import_asset "fastclick"
  sprockets.import_asset "fontawesome"
  sprockets.import_asset "foundation/js/foundation.min.js"
  sprockets.import_asset "foundation/scss/foundation/_functions.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_accordion.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_alert-boxes.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_block-grid.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_breadcrumbs.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_button-groups.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_buttons.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_clearing.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_dropdown.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_dropdown-buttons.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_flex-video.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_forms.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_global.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_grid.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_icon-bar.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_inline-lists.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_joyride.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_keystrokes.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_labels.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_magellan.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_offcanvas.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_pagination.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_panels.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_pricing-tables.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_progress-bars.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_range-slider.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_reveal.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_side-nav.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_split-buttons.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_sub-nav.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_switches.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_tables.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_accordion.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_tabs.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_thumbs.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_toolbar.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_tooltips.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_top-bar.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_type.scss"
  sprockets.import_asset "foundation/scss/foundation/components/_visibility.scss"
  sprockets.import_asset "jquery"
  sprockets.import_asset "jquery.cookie/jquery.cookie.js"
  sprockets.import_asset "jquery-smooth-scroll"
  sprockets.import_asset "jquery.kerning"
  sprockets.import_asset "jquery-placeholder"
  sprockets.import_asset "modernizr/modernizr.js"
end

###
# Gem
###

gem "slim"