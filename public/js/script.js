loadTheme();
const changeThemeBtn = document.querySelector("#change-theme");

// Toggle Dark mode

function toggleDarkMode() {

    document.body.classList.toggle("dark");

}

// load light or Dark mode
function loadTheme() {

    const darkMode = localStorage.getItem("dark")

    if(darkMode) {
        toggleDarkMode();
    }

}



changeThemeBtn.addEventListener("change", function () {

    toggleDarkMode();

    // save or remove Dark mode
    localStorage.removeItem("dark");

    if(document.body.classList.contains("dark")){

        localStorage.setItem("dark", 1);

    }
}
);


