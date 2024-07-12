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
      this.valueFieldTarget.removeAttribute('name')
      this.colorFieldTarget.style.display = 'block'
      this.colorFieldTarget.querySelector('input').setAttribute('name', 'setting[value]')
    } else {
      this.valueFieldTarget.style.display = 'block'
      this.valueFieldTarget.querySelector('textarea, input').setAttribute('name', 'setting[value]')
      this.colorFieldTarget.style.display = 'none'
      this.colorFieldTarget.querySelector('input').removeAttribute('name')
    }
  }
}
