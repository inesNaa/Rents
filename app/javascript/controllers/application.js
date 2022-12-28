import { Application } from "@hotwired/stimulus"
// import { Application } from 'stimulus'
// import { definitionsFromContext } from 'stimulus/webpack-helpers'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
