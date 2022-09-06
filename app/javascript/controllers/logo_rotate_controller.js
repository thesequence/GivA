import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["logo"]

  rotate(){
    this.logoTarget.classList.add('after-rotate')
  }
}
