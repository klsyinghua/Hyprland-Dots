return {
  {
    "nosduco/remote-sshfs.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- 依赖 Telescope 用于文件搜索
    },
    config = function()
      require("remote-sshfs").setup({
        connections = {
          ssh_configs = { -- 指定 SSH 配置文件路径
            vim.fn.expand("$HOME") .. "/.ssh/config",
            "/etc/ssh/ssh_config",
            -- 可添加更多自定义 SSH 配置文件路径
            -- vim.split(vim.fn.globpath(vim.fn.expand("$HOME") .. "/.ssh/configs", "*"), "\n"),
          },
          sshfs_args = { -- 传递给 sshfs 的额外参数
            "-o reconnect", -- 自动重连
            "-o ConnectTimeout=5", -- 连接超时 5 秒
            "-o compression=yes", -- 启用压缩以提高性能
          },
        },
        mounts = {
          base_dir = vim.fn.expand("$HOME") .. "/.sshfs/", -- 挂载点基础目录
          unmount_on_exit = true, -- Neovim 退出时自动卸载
        },
        handlers = {
          on_connect = {
            change_dir = true, -- 连接后自动切换工作目录到挂载点
          },
          on_disconnect = {
            clean_mount_folders = false, -- 断开连接时不删除挂载点文件夹
          },
          on_edit = {}, -- 暂未实现
        },
        ui = {
          select_prompts = false, -- 暂未实现
          confirm = {
            connect = true, -- 连接前提示确认
            change_dir = false, -- 连接后不提示是否切换目录
          },
        },
        log = {
          enable = false, -- 禁用日志（可设置为 true 进行调试）
          truncate = false, -- 不截断日志
          types = { -- 启用特定日志类型
            all = false,
            util = false,
            handler = false,
            sshfs = false,
          },
        },
      })

      -- 自定义键映射（可选）
      local keymap = vim.keymap.set
      keymap("n", "<leader>rc", "<cmd>RemoteSSHFSConnect<CR>", { desc = "Connect to remote host" })
      keymap("n", "<leader>rd", "<cmd>RemoteSSHFSDisconnect<CR>", { desc = "Disconnect from remote host" })
      keymap("n", "<leader>re", "<cmd>RemoteSSHFSEdit<CR>", { desc = "Edit SSH config" })
      keymap("n", "<leader>rf", "<cmd>RemoteSSHFSFindFiles<CR>", { desc = "Find files on remote host" })
      keymap("n", "<leader>rg", "<cmd>RemoteSSHFSLiveGrep<CR>", { desc = "Live grep on remote host" })
    end,
  },
}
