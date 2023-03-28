require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
	  "markdown", 
	  "c", 
	  "c_sharp", 
	  "cmake", 
	  "cpp", 
	  "rust", 
	  "lua", 
	  "vim", 
	  "help", 
	  "query", 
	  "javascript", 
	  "typescript", 
	  "go", 
	  "java", 
	  "css", 
	  "html",
	  "diff",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
