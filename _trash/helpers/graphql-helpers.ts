export function getAll(input: any, key: string = 'name', level: number = 1) {
  if (Array.isArray(input)) {
    console.log(`array found`, input);
    const list = [];
    for (let i = 0; i < input.length; i++) {
      const currentInput = input[i];
      list.concat(getAll(currentInput, key, level));
    }
    return list;
  }
  if (typeof input === 'object') {
    const keys = Object.keys(input);
    if (keys.length === 1) {
      // object
      console.log(`only one key ${keys[0]}`);
      return getAll(input[keys[0]], key, level);
    }
    if (keys.includes('node')) {
      // object
      return input.node;
    }
    // if (keys.includes('edges')) {
    //   // object
    //   return getAll(input.edges, key, level);
    // }
    // if (keys.includes('nodes')) {
    //   // array
    //   return getAll(input.nodes, key, level);
    // }
    const list = [];

    keys.map(key => {
      if (typeof input[key] === 'object') {
        list.concat(getAll(input.edges, key, level));
      }
      return list;
    });
  }

  return [];
}
