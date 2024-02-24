import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "totalPrice", "vinylPrice"];

  connect() {
    console.log("connect");
    this.calculate(); // Calculate total price initially
  }

  calculate() {
    console.log("here");
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);
    const pricePerDay = parseFloat(this.vinylPriceTarget.dataset.price);

    const totalDays = Math.ceil((endDate - startDate) / (1000 * 60 * 60 * 24));
    const totalPrice = pricePerDay * totalDays;

    this.totalPriceTarget.textContent = `Total Price: ${totalPrice.toFixed(2)}CHF`;
  }

  startDateChanged() {
    console.log("Start date changed");
    this.calculate();
  }

  endDateChanged() {
    console.log("End date changed");
    this.calculate();
  }
}
