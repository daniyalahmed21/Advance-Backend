"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const server_config_1 = __importDefault(require("./config/server.config"));
const routes_1 = __importDefault(require("./routes"));
const sampleQueueProducer_1 = __importDefault(require("./producer/sampleQueueProducer"));
const sampleWorker_1 = __importDefault(require("./workers/sampleWorker"));
const app = (0, express_1.default)();
app.use(express_1.default.json());
app.use("/api", routes_1.default);
app.listen(server_config_1.default.PORT, () => {
    console.log(`Server running at http://localhost:${server_config_1.default.PORT}`);
    (0, sampleWorker_1.default)("SampleQueue");
    (0, sampleQueueProducer_1.default)("SampleJob", {
        name: "Daniyal Ahmed",
        company: "Meta",
        position: "SD1",
        location: "Remote",
    });
});
