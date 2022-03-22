import typescript from '@rollup/plugin-typescript';
import dts from 'rollup-plugin-dts';

import pkg from "./package.json";

export default [
  {
    input: "src/index.ts",
    output:
      {
        file: "./dist/refi-manager.js",
        format: "esm",
        exports: "named",
        sourcemap: true,
      },

    external: [
      ...Object.keys(pkg.dependencies || {}),
    ],
    plugins: [
      typescript({
        tsconfig: "./tsconfig.json",
      }),
    ],
  },
  {
    input: 'dist/types/index.d.ts',
    output: {
      file: 'dist/index.d.ts',
    },
    plugins: [
      dts()
    ],
  }
]
