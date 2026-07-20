const counter = document.getElementById("counter-number");

async function getCount() {
  try {
    const res = await fetch("https://ghovnq5774jgictnnm4ck2xg3e0jlvdg.lambda-url.eu-west-3.on.aws/");

    console.log("Status:", res.status);

    const text = await res.text();
    console.log("Response:", text);

    const data = JSON.parse(text);
    counter.textContent = data.count;
  } catch (e) {
    console.error(e);
  }
}

getCount();