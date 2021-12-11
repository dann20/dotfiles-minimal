lua << EOF
--local get_hex = require("cokeline/utils").get_hex
--local space = {text = " "}
require("cokeline").setup(
	{
		mappings = {
			cycle_prev_next = true,
		},
		buffers = {
			-- A function to filter out unwanted buffers. It takes the `buffer` table
			-- (described above) as a parameter.
			-- For example, if you want to keep terminals out of your cokeline:
			--   filter = function(buffer) return buffer.type ~= 'terminal' end,
			filter_valid = function(buffer)
				return (isNonEmptyString(buffer.path) and isNonEmptyString(buffer.filename))
			end
		},
		default_hl = {
			focused = {
				bg = "none"
			},
			unfocused = {
				fg = get_hex("Comment", "fg"),
				bg = "none"
			}
		},
		components = {
			space,
			{
				text = function(buffer)
					return buffer.devicon.icon
				end,
				hl = {
					fg = function(buffer)
						return buffer.devicon.color
					end
				}
			},
			{
				text = function(buffer)
					return buffer.unique_prefix .. buffer.filename
				end,
				hl = {
					fg = function(buffer)
						if buffer.is_focused then
							return "#78dce8"
						end
						if buffer.is_modified then
							return "#e5c463"
						end
					end,
					style = function(buffer)
						if buffer.is_focused then
							return "underline"
						end
						return nil
					end
				}
			},
			{
				text = function(buffer)
					if buffer.is_readonly then
						return " 🔒"
					end
					return ""
				end
			},
			space
		}
	}
)
EOF