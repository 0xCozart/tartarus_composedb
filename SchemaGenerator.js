import { createGraphQLSchema, printGraphQLSchema } from "@composedb/runtime";

import { definition } from "./runtimes/runtime.js";
import fs from "fs";

const schema = printGraphQLSchema(definition);

fs.writeFile("./schema.graphql", schema, (err) => {
  console.error(err);
});
