import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="booking-form"

export default class extends Controller {
  static targets = ["startDate", "endDate", "pricePerDay", "totalPrice"];

  calculateTotalPrice() {
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);
    const pricePerDay = parseFloat(this.pricePerDayTarget.textContent);

    // Check if pricePerDay is a valid number
    if (!isNaN(pricePerDay) && startDate && endDate) {
      const days = (endDate - startDate) / (1000 * 60 * 60 * 24); // Calculate number of days

      if (!isNaN(days) && days >= 0) {
        const totalPrice = pricePerDay * days;
        this.totalPriceTarget.textContent = `${totalPrice.toFixed(2)} CHF`; // Display total price
        return;
      }
    }

    this.totalPriceTarget.textContent = "0 CHF"; // Display default value if dates are invalid
  }
}
