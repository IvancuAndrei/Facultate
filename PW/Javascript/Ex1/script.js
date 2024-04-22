document.getElementById("#first_select").addEventListener(
    "dblclick", function () {
        let e = document.getElementById("#first_select");
        const elem = e.options[e.selectedIndex];
        let newOption = new Option(elem.value, elem.text);
        elem.remove();
        document.getElementById("#second_select").add(newOption)
    }
)

document.getElementById("#second_select").addEventListener(
    "dblclick", function () {
        let e = document.getElementById("#second_select");
        const elem = e.options[e.selectedIndex];
        let newOption = new Option(elem.value, elem.text);
        elem.remove();
        document.getElementById("#first_select").add(newOption)
    }
)