import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="room-list"
export default class extends Controller {
  static targets = ["header", "listItem"]
  static classes = ["hidden"]
  observer = new MutationObserver((mutationsList, obs)=>{
    for (const mutation of mutationsList) {
      if (mutation.type === "childList") {
        this.toggleHeader();
      }
    }
  });

  connect() {
    this.observer.observe(document.getElementById("rooms"), {childList: true});
    this.toggleHeader();
  }

  toggleHeader(){
    this.listItemTargets.length > 0 ? this.hideHeader() : this.showHeader();
  }

  hideHeader(){
    this.headerTarget.classList.add(this.hiddenClass);
  }

  showHeader(){
    this.headerTarget.classList.remove(this.hiddenClass);
  }
}
