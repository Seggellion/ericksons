import { Controller } from "@hotwired/stimulus"
//import Sortable from "sortablejs";


export default class extends Controller {
  static targets = ["list"];
  static values = { menuId: Number }

  connect() {
    // Initialize anything here if needed
  }

  addPage(event) {
    const checkbox = event.target;

    if (checkbox.checked) {
      this.addMenuItem(checkbox.value, checkbox.dataset.title, checkbox.dataset.slug, 'page');
    }
  }

  addCategory(event) {
    const checkbox = event.target;
    if (checkbox.checked) {
      this.addMenuItem(checkbox.value, checkbox.dataset.name, checkbox.dataset.slug, 'category');
    }
  }

  async addMenuItem(id, title, slug) {

    const response = await fetch(`/admin/menus/${this.menuIdValue}/menu_items`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content,
      },
      body: JSON.stringify({
        menu_item: {
          title: title,
          url: slug,
          menu_id: this.menuIdValue
        },
      }),
    });

    if (response.redirected) {
      window.location.href = response.url;
    } else if (response.ok) {
      const menuItem = await response.json();
      this.listTarget.insertAdjacentHTML('beforeend', this.renderMenuItem(menuItem));
    } else {
      // Handle errors here
      alert('Failed to add menu item.');
    }
  }

  renderMenuItem(menuItem) {
    return `
      <li class="mb-4" data-id="${menuItem.id}" data-url="/admin/menu_items/${menuItem.id}/update_position">
        <div class="flex items-center justify-between">
          <span>${menuItem.title}</span>
          <div>
            <a href="/admin/menu_items/${menuItem.id}/edit" class="btn btn-secondary">Edit</a>
            <a href="/admin/menu_items/${menuItem.id}" data-method="delete" data-confirm="Are you sure?" class="btn btn-danger">Delete</a>
          </div>
        </div>
        ${menuItem.children.length > 0 ? `<ul>${menuItem.children.map(this.renderMenuItem).join('')}</ul>` : ''}
      </li>
    `;
  }
}
