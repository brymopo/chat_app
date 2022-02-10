import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

// Connects to data-controller="room-list"
export default class extends Controller {
  static targets = ["header", "listItem", "roomLink"]
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
    this.roomLinkTargets.forEach( targetLink => {
      targetLink.addEventListener("click", this.fetchRoom);
    })
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

  fetchRoom(e){
    e.preventDefault();
    fetch(e.target.getAttribute("href"), {
      headers: { Accept: "text/vnd.turbo-stream.html" }
    })
    .then( response => response.text())
    .then( template => Turbo.renderStreamMessage(template) )
  }
}
