import { Request, Response } from "express";

export const PingController = (req: Request, res: Response) => {
  return res.status(200).json({
    msg: "Ping controller up",
  });
};
