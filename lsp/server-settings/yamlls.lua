return {
  settings = {
    yaml = {
      schemas = {
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/package.json"] = "package.yml",
        ["https://raw.githubusercontent.com/sabinmarcu/tscmono/staging/packages/config/schemas/root.json"] = "/.tscmonorc.yml",
        ["https://raw.githubusercontent.com/sabinmarcu/tscmono/staging/packages/config/schemas/workspace.json"] = ".tscmonorc.yml",
        ["https://moonrepo.dev/schemas/global-project.json"] = ".moon/project.yml",
        ["https://moonrepo.dev/schemas/toolchain.json"] = ".moon/toolchain.yml",
        ["https://moonrepo.dev/schemas/workspace.json"] = ".moon/workspace.yml",
      },
    },
  },
}
