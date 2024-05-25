return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Keymaps
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })

		-- Adapters
		dap.adapters.lldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
			name = "lldb",
		}

		-- Configurations
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				env = function()
					local variables = {}
					for k, v in pairs(vim.fn.environ()) do
						table.insert(variables, string.format("%s=%s", k, v))
					end
					return variables
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}

		dap.configurations.c = dap.configurations.cpp

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				env = function()
					local variables = {}
					for k, v in pairs(vim.fn.environ()) do
						table.insert(variables, string.format("%s=%s", k, v))
					end
					return variables
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				initCommands = function()
					local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

					local script_import = 'command script import "'
						.. rustc_sysroot
						.. '/lib/rustlib/etc/lldb_lookup.py"'
					local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

					local commands = {}
					local file = io.open(commands_file, "r")
					if file then
						for line in file:lines() do
							table.insert(commands, line)
						end
					end
					table.insert(commands, 1, script_import)

					return commands
				end,
			},
		}
	end,
}
