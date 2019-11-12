delete $WowheadPower;
delete WH;
delete g_staticUrl;
delete g_itemScalingCallbacks;
delete i;
delete Icon;
delete wowHeadScript;
Array.from(
  document.querySelectorAll('script[src^="https://wow.zamimg.com"]')
).forEach(node => node.remove());
var head = document.getElementsByTagName("head")[0];
var wowHeadScript = document.createElement("script");
wowHeadScript.src = "https://wow.zamimg.com/widgets/power.js?t=" + Date.now();
head.appendChild(window.wowHeadScript);
