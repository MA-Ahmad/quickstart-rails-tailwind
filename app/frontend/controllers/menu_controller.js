import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button", "dropdown"];

  toggle() {
    // console.log(this.dropdownTarget);
    this.dropdownTarget.classList.toggle("hidden");
  }

  hide(event) {
    if (
      (event && this.dropdownTarget.contains(event.target)) ||
      this.buttonTarget.contains(event.target)
    ) {
      return;
    }
    if (!this.dropdownTarget.classList.contains("hidden"))
      this.dropdownTarget.classList.add("hidden");
  }
}
