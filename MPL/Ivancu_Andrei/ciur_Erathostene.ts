function ciurImperativ(n: number): number[] {
  const primes: boolean[] = new Array(n + 1).fill(true);
  primes[0] = primes[1] = false;

  for (let i = 2; i * i <= n; i++) {
    if (primes[i]) {
      for (let j = i * i; j <= n; j += i) {
        primes[j] = false;
      }
    }
  }

  const result: number[] = [];
  for (let i = 2; i <= n; i++) {
    if (primes[i]) {
      result.push(i);
    }
  }

  return result;
}

function ciurFunctional(n: number): number[] {
  const range = Array.from({ length: n + 1 }, (_, i) => i);
  return range.slice(2).reduce((acc, curr) => {
    if (acc.some((x) => x === curr)) {
      return acc.filter((x) => x === curr || x % curr !== 0);
    }
    return acc;
  }, range.slice(2));
}

const n = 30;

console.log("Imperativ:");
console.log(ciurImperativ(n));

console.log("Funcțional:");
console.log(ciurFunctional(n));

const valori = [1000, 10000, 100000];

for (const n of valori) {
  console.log(`\n--- n = ${n} ---`);

  console.time("Imperativ");
  ciurImperativ(n);
  console.timeEnd("Imperativ");

  console.time("Funcțional");
  ciurFunctional(n);
  console.timeEnd("Funcțional");
}
