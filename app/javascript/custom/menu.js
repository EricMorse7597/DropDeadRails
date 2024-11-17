function addToggleListener(_selectedId, _menuId, _toggleClass) {
    let selectedElement = document.querySelector(`#${_selectedId}`);
    selectedElement.addEventListener("click", function (event) {
        event.preventDefault();
        let menu = document.querySelector(`#${_menuId}`);
        menu.classList.toggle(_toggleClass);
    })
}

document.addEventListener("turbo:load", function () {
    addToggleListener("hamburger", "navbar-menu", "collapse");
    addToggleListener("account", "dropdown-menu", "active");
});
