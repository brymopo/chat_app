import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="room-form"
export default class extends Controller {
  static targets = [ "name", "form", "error" ]

/*   connect() {
    this.formTarget.addEventListener("turbo:submit-end", this.handleSubmit.bind(this));
  }

  disconnect(){
    this.formTarget.removeEventListener("turbo:submit-end", this.handleSubmit);
  }

  handleSubmit(){
    this.nameTarget.value = "";
    try {
      this.errorTarget.remove();
    } catch (error) {
      return;
    }
  } */
}
