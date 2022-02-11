import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modalBody" ]

  connect() {
  }

  showModal(){
    if(this.isModalClosed()){
      this.modalBodyTarget.classList.remove("hidden");
    }
  }

  hideModal(){
    if(this.isModalOpen) {
      this.modalBodyTarget.classList.add("hidden");
    }
    this.resetModal();
  }

  isModalClosed(){
    return this.modalBodyTarget.classList.contains("hidden")
  }

  isModalOpen(){
    return !this.isModalClosed();
  }

  resetModalFrame(){
    const modalFrame = document.getElementById("room-modal");
    if(modalFrame){
      modalFrame.setAttribute("src", undefined);
      while(modalFrame.firstChild){
        modalFrame.firstChild.remove();
      }
    }    
  }
}
