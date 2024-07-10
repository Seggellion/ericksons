import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="settings-form"
export default class extends Controller {
  static targets = ["settingType", "valueField", "colorField"]

  connect() {
    console.log('output');
    this.toggleFields()
  }

  toggleFields() {
    const settingType = this.settingTypeTarget.value
    if (settingType === 'color') {
      this.valueFieldTarget.style.display = 'none'
      this.colorFieldTarget.style.display = 'block'
    } else {
      this.valueFieldTarget.style.display = 'block'
      this.colorFieldTarget.style.display = 'none'
    }
  }
}
