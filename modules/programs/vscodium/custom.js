// function modifyTopProperty(element) {
//   let id = element.id;
//   let index = parseInt(id.split("_").pop());
//   let expectedTopValue = index * 30;

//   let style = window.getComputedStyle(element);
//   let topValue = parseInt(style.top.replace("px", ""));

//   // Only change the top value if it's not already at the expected value
//   if (topValue !== expectedTopValue) {
//     element.style.top = `${expectedTopValue}px`;
//     element.style.height = `30px`;
//     element.style.lineHeight = `30px`;
//   }
// }

// let observer = new MutationObserver((mutations) => {
//   mutations.forEach((mutation) => {
//     if (mutation.type === "childList" && mutation.addedNodes.length > 0) {
//       mutation.addedNodes.forEach((node) => {
//         if (
//           node.matches &&
//           node.matches(".explorer-folders-view .monaco-list .monaco-list-row")
//         ) {
//           modifyTopProperty(node);
//         }
//       });
//     }
//     if (mutation.type === "attributes" && mutation.attributeName === "style") {
//       if (
//         mutation.target.matches(
//           ".explorer-folders-view .monaco-list .monaco-list-row"
//         )
//       ) {
//         modifyTopProperty(mutation.target);
//       }
//     }
//   });
// });

// observer.observe(document.body, {
//   childList: true,
//   subtree: true,
//   attributes: true,
//   attributeFilter: ["style"],
// });
