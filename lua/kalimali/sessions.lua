local M = {}

local utils = require "kalimali.utils"

vim.g.session_dir = vim.fn.stdpath "config" .. "/sessions"

if vim.fn.isdirectory(vim.g.session_dir) == 0 then
    vim.fn.mkdir(vim.g.session_dir, "p")
end

local function get_session_name()
    if vim.g.current_session then
        return vim.g.current_session
    elseif vim.fn.trim(vim.fn.system "git rev-parse --is-inside-work-tree") == "true" then
        return vim.fn.trim(vim.fn.system "basename `git rev-parse --show-toplevel`")
    else
        return "Session.vim"
    end
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function restore_session(prompt_bufnr, _)
    actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local session_name = selection[1]:gsub("./", "")
        vim.g.current_session = session_name
        session_name = vim.g.session_dir .. "/" .. session_name
        local cmd = "silent! source " .. session_name
        vim.cmd(cmd)
		-- Hacky fix for exiting inert mode after restoring session
		vim.cmd("stopinsert")
        -- utils.info(session_name, "Session restored")
    end)
    return true
end

local function delete_session(prompt_bufnr, _)
    actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local session_name = selection[1]:gsub("./", "")
        session_name = vim.g.session_dir .. "/" .. session_name
        if vim.fn.delete(session_name) == 0 then
            print(session_name .. " Session deleted")
        end
    end)
    return true
end

local track_session = false

local function make_session(session_name)
    local current_session = session_name:match("^.+/(.+)$")
    if current_session == "nvim" or current_session == "Session.vim" then
        return
    end
    local cmd = "mks! " .. session_name
    local current_session = session_name:match("^.+/(.+)$")
    vim.g.current_session = current_session
    vim.cmd(cmd)
end

function M.save_session()
    local default_session_name = get_session_name()
    vim.ui.input({ prompt = "Input session name: ", default = default_session_name }, function(session_name)
        if session_name then
            session_name = vim.g.session_dir .. "/" .. session_name
            make_session(session_name)
            print(session_name .. " Session saved")
        end
    end)
end

function M.save_current_session()
    local default_session_name = get_session_name()
    local session_name = vim.g.session_dir .. "/" .. default_session_name
    make_session(session_name)
end

function M.list_session()
    local opts = {
        attach_mappings = restore_session,
        prompt_title = "Select session ",
        cwd = vim.g.session_dir,
    }
    require("telescope.builtin").find_files(opts)
end

function M.delete_session()
    local opts = {
        attach_mappings = delete_session,
        prompt_title = "Delete session ",
        cwd = vim.g.session_dir,
    }
    require("telescope.builtin").find_files(opts)
end

function M.toggle_session()
    if track_session then
        vim.api.nvim_del_augroup_by_name "SessionTracking" -- nvim 0.7 and above only
        track_session = false
        utils.info("Session tracking disabled", "Session")
    else
        local default_session_name = get_session_name()
        vim.ui.input({ prompt = "Input session name: ", default = default_session_name }, function(session_name)
            if session_name then
                session_name = vim.g.session_dir .. "/" .. session_name
                make_session(session_name) -- Save the session on toggle
                -- Create autocmd
                local grp = vim.api.nvim_create_augroup("SessionTracking", { clear = true })
                vim.api.nvim_create_autocmd("VimLeave", { -- nvim 0.7 and above only
                pattern = "*",
                callback = function()
                    make_session(session_name)
                end,
                group = grp,
            })
            track_session = true
            utils.info("Session tracking enabled", "Session")
        end
    end)
end
end

return M
