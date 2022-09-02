import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collapse"
export default class extends Controller {
  static targets = ["button", "readmoreContainer"]



  connect() {
    console.log("hello")
  }

  collapse(){
    this.readmoreContainerTarget.classList.toggle("show")
  }

}
