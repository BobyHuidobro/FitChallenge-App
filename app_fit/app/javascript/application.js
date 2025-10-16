// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

import * as bootstrap from "bootstrap"

// Hacer bootstrap global para que funcione con data-bs-toggle
window.bootstrap = bootstrap