const API_URL = "REPLACE_WITH_API_GATEWAY_URL";

async function callApi() {

    const res = await fetch(API_URL);
    const data = await res.json();

    document.getElementById("result").innerText =
        JSON.stringify(data, null, 2);
}
