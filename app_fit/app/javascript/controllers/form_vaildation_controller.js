import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["field"];

  connect() {
    this.element.addEventListener("submit", e => {
      if (!this.element.checkValidity()) {
        e.preventDefault();
        this.showErrors();
      }
    });

    this.fieldTargets.forEach(field => {
      field.addEventListener("input", () => this.validateField(field));
    });
  }

  showErrors() {
    this.fieldTargets.forEach(field => this.validateField(field));
  }

  validateField(field) {
    const group = field.closest(".mb-3");
    let feedback = group.querySelector(".invalid-feedback");
    if (!feedback) {
      feedback = document.createElement("div");
      feedback.className = "invalid-feedback";
      group.appendChild(feedback);
    }
    if (field.validity.valid) {
      field.classList.remove("is-invalid");
      field.classList.add("is-valid");
      feedback.textContent = "";
    } else {
      field.classList.add("is-invalid");
      field.classList.remove("is-valid");
      feedback.textContent = field.validationMessage;
    }
  }
}