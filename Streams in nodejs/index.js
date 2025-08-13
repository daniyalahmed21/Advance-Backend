/**
The goal of this example is to:
Read data from a file (input.txt).
Transform the data by converting it to uppercase.
Write the uppercase data to a new file (output.txt).
**/

const fs = require("fs");
const { Transform } = require("stream");

// --- Step 1: Create a Readable Stream ---
// This stream will read data from input.txt in chunks.
const readStream = fs.createReadStream("input.txt");

// --- Step 2: Create a Transform Stream ---
// This stream will transform the data by making it uppercase.
class UppercaseTransform extends Transform {
  _transform(chunk, encoding, callback) {
    // Convert the chunk to a string, make it uppercase, and push it out.
    this.push(chunk.toString().toUpperCase());
    // Signal that the transformation is complete for this chunk.
    callback();
  }
}
const transformStream = new UppercaseTransform();

// --- Step 3: Create a Writable Stream ---
// This stream will write the final data to output.txt.
const writeStream = fs.createWriteStream("output.txt");

// --- Step 4: Pipe the Streams Together ---
// This connects the streams in a pipeline.
// readStream -> transformStream -> writeStream
readStream.pipe(transformStream).pipe(writeStream);

// Optional: Log when the process is finished
writeStream.on("finish", () => {
  console.log("File transformation complete!");
});
