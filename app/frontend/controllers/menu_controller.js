import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "profileButton",
    "profileDropdown",
    "mainButton",
    "mainDropdown",
  ];

  toggle(event) {
    if (event && this.profileButtonTarget.contains(event.target)) {
      this.profileDropdownTarget.classList.toggle("hidden");
      if (!this.mainDropdownTarget.classList.contains("hidden"))
        this.mainDropdownTarget.classList.add("hidden");
    } else if (event && this.mainButtonTarget.contains(event.target)) {
      this.mainDropdownTarget.classList.toggle("hidden");
      if (!this.profileDropdownTarget.classList.contains("hidden"))
        this.profileDropdownTarget.classList.add("hidden");
    }
  }

  hide(event) {
    if (
      event &&
      (this.profileDropdownTarget.contains(event.target) ||
        this.profileButtonTarget.contains(event.target) ||
        this.mainDropdownTarget.contains(event.target) ||
        this.mainButtonTarget.contains(event.target))
    ) {
      return;
    }
    if (!this.profileDropdownTarget.classList.contains("hidden"))
      this.profileDropdownTarget.classList.add("hidden");
    if (!this.mainDropdownTarget.classList.contains("hidden"))
      this.mainDropdownTarget.classList.add("hidden");
  }
}
