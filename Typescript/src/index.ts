import express, { Express } from "express";
import serverConfig from "./config/server.config";
import apiRouter from "./routes";
import sampleQueueProducer from "./producer/sampleQueueProducer";
import SampleWorker from "./workers/sampleWorker";
const app: Express = express();
app.use(express.json());
app.use("/api", apiRouter);

app.listen(serverConfig.PORT, () => {
  console.log(`Server running at http://localhost:${serverConfig.PORT}`);
  SampleWorker("SampleQueue");
  sampleQueueProducer("SampleJob", {
    name: "Daniyal Ahmed",
    company: "Meta",
    position: "SD1",
    location: "Remote",
  });
});
