local jdtls = require("jdtls")
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

local home = os.getenv("HOME")
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"

local root_dir = require("jdtls.setup").find_root({
  "gradlew",
  "mvnw",
  "build.gradle",
  "build.gradle.kts",
  "pom.xml",
})

if not root_dir then
  return
end

local workspace_dir = home .. "/.local/share/jdtls-workspace/" ..
  vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = {
    jdtls_path .. "/bin/jdtls",
    "--jvm-arg=-Xms1g",
    "--jvm-arg=-Xmx4g",
  },

  root_dir = root_dir,
  workspace_folder = workspace_dir,

  capabilities = cmp_caps,

  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = "/usr/lib/jvm/java-25-openjdk",
          },
        },
      },
      completion = {
        favoriteStaticMembers = {
          "java.util.Objects.requireNonNull",
          "org.junit.jupiter.api.Assertions.*",
        },
      },
      saveActions = {
        organizeImports = true,
      },
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
    },
  },
}

jdtls.start_or_attach(config)

