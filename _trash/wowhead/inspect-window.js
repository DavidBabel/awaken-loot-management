x = {};
var iframe = document.createElement("iframe");
iframe.onload = function() {
  var standardGlobals = Object.keys(iframe.contentWindow);
  for (var b in window) {
    const prop = window[b];
    if (
      window.hasOwnProperty(b) &&
      prop &&
      !prop.toString().includes("native code") &&
      !standardGlobals.includes(b) &&
      !["Web3", "web3", "ethereum", "next", "regeneratorRuntime"].includes(b) &&
      !b.startsWith("__") &&
      !b.startsWith("dll") &&
      !b.startsWith("dll") &&
      !b.startsWith("webpack")
    ) {
      x[b] = prop;
    }
  }
  console.log(x);
};
iframe.src = "about:blank";
document.body.appendChild(iframe);
