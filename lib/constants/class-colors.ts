import { wowClasses } from "./classes";

const classColors = wowClasses
  .filter(wc => wc.id !== 0)
  .reduce((stack, next) => {
    stack[next.name] = next.color;
    return stack;
  }, {});

const alternativeColor = {
  ...classColors,
  ["Prêtre Heal"]: "rgb(255, 255, 255)",
  ["Prêtre Ombre"]: "rgb(255, 255, 255)"
};

export function getClassColor(classe: string, alternative: boolean = false) {
  // tslint:disable-next-line:no-console
  // console.log(classe);
  if (alternative) {
    return alternativeColor[classe];
  } else {
    return classColors[classe];
  }
}
