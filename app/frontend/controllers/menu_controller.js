import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["toggleable"];

  toggle() {
    // console.log(this.toggleableTarget);
    this.toggleableTarget.classList.toggle("hidden");
  }
}
