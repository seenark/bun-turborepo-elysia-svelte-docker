import { app } from "elysia-app";

// const app = new Elysia().get('/', () => 'Hello Elysia').listen(3000);
app.listen(3333);

const logo = `
┏━━┓┏━━┓┏━━━┓┏━┓┏━┓
┗┫┣┛┗┫┣┛┃┏━┓┃┃┃┗┛┃┃
━┃┃━━┃┃━┃┗━┛┃┃┏┓┏┓┃
━┃┃━━┃┃━┃┏━━┛┃┃┃┃┃┃
┏┫┣┓┏┫┣┓┃┃━━━┃┃┃┃┃┃
┗━━┛┗━━┛┗┛━━━┗┛┗┛┗┛
━━━━━━━━━━━━━━━━━━━
━━━━━━━━━━━━━━━━━━━
`;
console.log(logo);
console.log(`🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`);
