document.addEventListener("DOMContentLoaded", function() {
    // Event listener for fname input box
    document.getElementById("convert").addEventListener("click", function () {
        // Values containing each side of input
        const firstNameInput = document.getElementById("fname");
        const lastNameInput = document.getElementById("lname");
        const unitInput = document.getElementById("unit");
        const streetNameInput = document.getElementById("street");
        const cityNameInput = document.getElementById("city");
        const provNameInput = document.getElementById("prov");
        const postalCodeInput = document.getElementById("post");
        const phoneNumberInput = document.getElementById("phone");
        const textAreaJSON = document.getElementById("jsonarea");

        // If input text value is found
        if (firstNameInput.value || lastNameInput.value || streetNameInput.value || cityNameInput.value || provNameInput.value || postalCodeInput.value || phoneNumberInput.value) {
            // Convert it to JSON and display it
            const jsonObject = gatherTextInput();
            textAreaJSON.value = JSON.stringify(jsonObject, null, 2);
            firstNameInput.value = "";
            lastNameInput.value = "";
            unitInput.value = "";
            streetNameInput.value = "";
            cityNameInput.value = "";
            provNameInput.value = "";
            postalCodeInput.value = "";
            phoneNumberInput.value = "";
        // If JSON area value is found
        } else if (textAreaJSON.value) {
            // Parse it and put it back into the input box
            try {
                const parsedJSON = JSON.parse(textAreaJSON.value)
                // Access and display each element
                // Fallback provided to prevent undefined values
                firstNameInput.value = parsedJSON.fname || "";
                lastNameInput.value = parsedJSON.lname || "";
                unitInput.value = parsedJSON.unit || "";
                streetNameInput.value = parsedJSON.street || "";
                cityNameInput.value = parsedJSON.city || "";
                provNameInput.value = parsedJSON.prov || "";
                postalCodeInput.value = parsedJSON.post || "";
                phoneNumberInput.value = parsedJSON.phone || "";
                // Clear JSON area box
                textAreaJSON.value = "";
            } catch (error) {
                console.error("Invalid JSON format:", error);
            }
        }
    });
});

function gatherTextInput() {
    // Get all text inputs and return as a JSON object
    return {
        fname: document.getElementById("fname").value,
        lname: document.getElementById("lname").value,
        unit: parseInt(document.getElementById("unit").value),
        street: document.getElementById("street").value,
        city: document.getElementById("city").value,
        prov: document.getElementById("prov").value,
        post: document.getElementById("post").value,
        phone: document.getElementById("phone").value
    };
}