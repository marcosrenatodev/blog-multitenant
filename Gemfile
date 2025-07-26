source "https://rubygems.org"

ruby "3.3.8"

# ───── Core ─────
gem "rails", "~> 7.1.3"
gem "puma", ">= 5.0"
gem "pg",   "~> 1.5"            # versão mais recente da 1.x
gem "sprockets-rails"

# ───── Front-end (Hotwire + bundlers) ─────
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"

# ───── JSON / API helpers ─────
gem "jbuilder"

# ───── Multitenancy & Auth ─────
gem "devise"
gem "pundit"
gem "friendly_id"
gem "acts_as_tenant", "~> 0.6"  # última versão compatível Rails 7.1

# ───── SEO ─────
gem "meta-tags"
gem "sitemap_generator"

# ───── Background / Jobs / Cache ─────
gem "sidekiq"
gem "redis", ">= 4.0.1"

# ───── Utilidades gerais ─────
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[windows jruby]

# gem "image_processing", "~> 1.2" # habilite se for usar variantes ActiveStorage

# ─────────────────────────────────────────
group :development, :test do
  gem "annotate"
  gem "letter_opener_web"
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "web-console"
  gem "foreman", require: false        # Procfile / bin/dev
  # gem "rack-mini-profiler"           # performance badge
  # gem "spring"                       # acelera bin/rails em máquinas locais
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
