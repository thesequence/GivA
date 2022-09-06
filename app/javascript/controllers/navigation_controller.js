import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  connect() {
   console.log("Hello From Navigation")
  }

  activate(e){
    e.currentTarget.classList.add('back-active')
  }
}
