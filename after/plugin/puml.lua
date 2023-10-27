require("plantuml").setup(
    {
        renderer = {
            type = "image",
            options = {
                split_cmd = "split --vertical --keep-focus",
                prog = "open -a Preview"
            }
        }
    }
)
