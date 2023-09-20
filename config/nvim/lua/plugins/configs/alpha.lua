return {
    "goolord/alpha-nvim",
    config = function()
        require("alpha").setup(require("plugins.configs.alpha"))
    end,
}