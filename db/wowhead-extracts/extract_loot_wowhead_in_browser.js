copy(
  JSON.stringify(
    Array.from(
      $(
        "#tab-drops tr .q4.listview-cleartext, #tab-contains tr .q4.listview-cleartext"
      )
    ).map(element => {
      const classElement = element.parentElement.getElementsByClassName(
        "small2"
      );
      const [, id] = element.href.match(/wowhead\.com\/item=([0-9]+)\//);

      return {
        id,
        text: element.innerText,
        class:
          (classElement && classElement[0] && classElement[0].innerText) || ""
      };
    }),
    null,
    2
  )
);
