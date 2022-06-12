import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['container']

  connect() {
    this.toggleClass = this.data.get('class') || 'hidden'
    this.containerTarget.classList.remove(this.toggleClass)
    this.lockScroll()
  }

  successClose(event) {
    if(event.detail.success) {
      this.close(event)
    }
  }

  close(event) {
    event.preventDefault()

    this.containerTarget.classList.add(this.toggleClass)
    this.unLockScroll()
  }

  lockScroll() {
    const scrollbarWidth =
      window.innerWidth - document.documentElement.clientWidth;
    document.body.style.paddingRight = `${scrollbarWidth}px`;

    this.scrollPosition = window.pageYOffset || document.body.scrollTop;

    document.body.classList.add("fixed", "inset-x-0", "overflow-hidden");

    document.body.style.top = `-${this.scrollPosition}px`;
  }

  unLockScroll() {
    document.body.style.paddingRight = null;

    document.body.classList.remove("fixed", "inset-x-0", "overflow-hidden");

    document.documentElement.scrollTop = this.scrollPosition

    document.body.style.top = null;
  }
}
