import { Elysia } from "elysia";

export const app = new Elysia().get("/", () => "Hello Elysia");

app.get("/healthz", () => {
    return "Ok Naja";
});
