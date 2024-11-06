return {
    "ahmedkhalf/project.nvim",
    config = function()
        require("project_nvim").setup({})
        require("project_nvim.project").init()
    end
}
