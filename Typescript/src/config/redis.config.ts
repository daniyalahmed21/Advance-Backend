import Redis from "ioredis";
import config from "./server.config";

const redisConfig = {
  port: Number(config.REDIS_PORT),
  host: config.REDIS_HOST,
};

const redis = new Redis(redisConfig);

redis.on("connect", () => {
  console.log("Connected to Redis at", redisConfig.host, ":", redisConfig.port);
});

redis.on("error", (err) => {
  console.error("Redis error", err);
});

export default redis;
