return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")

		local selectNextItem = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			end
			return fallback
		end)

		local selectPreviousItem = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			end
			return fallback
		end)

		cmp.setup({
      completion = {
        autocomplete = false,
      },
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = selectNextItem,
				["<C-k>"] = selectPreviousItem,
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}
