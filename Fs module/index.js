import { readFile ,writeFile } from "node:fs/promises";

try {
  const filePath = new URL("./index.html", import.meta.url); // give the path of index.html file
  var contents = await readFile(filePath, { encoding: "utf8" });
  console.log(contents);
} catch (err) {
  console.error(err.message);
}

const Data = {
  name: "daniyal",
  age: 21,
};

for (const [key, value] of Object.entries(Data)) {
    contents = contents.replace(`{${key}}`,value)
}

console.log(contents);

const newfilePath = new URL("./newIndex.html", import.meta.url);

await writeFile(newfilePath,contents) // write to the file if file not present it will create new file