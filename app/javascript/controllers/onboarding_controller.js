import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="onboarding"
export default class extends Controller {
  static targets = ["step"]

  connect() {
    this.animateStepIn()
    this.setupKeyboardNavigation()
  }

  animateStepIn() {
    if (this.hasStepTarget) {
      this.stepTarget.classList.add("step-animate-in")
    }
  }

  setupKeyboardNavigation() {
    this.handleKeyPress = this.handleKeyPress.bind(this)
    document.addEventListener("keydown", this.handleKeyPress)
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeyPress)
  }

  handleKeyPress(event) {
    // Navigate with arrow keys
    if (event.key === "ArrowRight") {
      const nextButton = this.element.querySelector(".btn-primary")
      if (nextButton) {
        event.preventDefault()
        nextButton.click()
      }
    } else if (event.key === "ArrowLeft") {
      const prevButton = this.element.querySelector(".btn-secondary")
      if (prevButton) {
        event.preventDefault()
        prevButton.click()
      }
    }
  }

  // Method to handle custom animations or interactions
  animateFeatureCards() {
    const cards = this.element.querySelectorAll(".feature-card")
    cards.forEach((card, index) => {
      setTimeout(() => {
        card.classList.add("visible")
      }, index * 100)
    })
  }
}
