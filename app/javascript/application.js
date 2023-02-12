import "@hotwired/turbo-rails"
import "./controllers"
import "./map.js"
import Lightbox from "bs5-lightbox"

document.addEventListener('turbo:load', function() {
    document.querySelectorAll('.photo-icon').forEach((el) => { el.addEventListener('click', Lightbox.initialize)
    })
})

