import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="readmore"
export default class extends Controller {
  static targets =  ["button", "expand"];

  connect() {
    console.log("hellomoto");

  }

  triggerread() {
    console.log("i have been clicked");
    this.expandTarget.classList.toggle("show")
  }
}
