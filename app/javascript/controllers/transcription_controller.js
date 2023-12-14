import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="transcription"
export default class extends Controller {
  static targets = ['player']

  connect() {
  }
  
  seek(e) {
    e.preventDefault();

    this.playerTarget.currentTime = e.params['seek']
  }
}
