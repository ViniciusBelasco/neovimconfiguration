function CompileConversion(filetype,opts)
  opts = opts or ' '
  filetype = filetype or vim.fn.expand("%:p:t:r")
  vim.cmd(
    "!cmd.exe /c 'C:\\arsenal_5\\comp\\build_qg\\configure.bat && hbmk2.exe G:\\programas_externos\\conversoes\\"
    .. filetype
    .. ".hbp ".. opts .. " && C:\\arsenal_5\\comp\\build_qg\\configure.bat /x86 && hbmk2.exe G:\\programas_externos\\conversoes\\"
    .. filetype
    .. ".hbp ".. opts .. " && joga "
    .. filetype
    .. " G'"
  )
end

function ThrowConvertion(filetype)
  filetype = filetype or vim.fn.expand("%:p:t:r")
  vim.cmd("!cmd.exe /c jogabin " .. filetype .. " G")
end

function Buildas(program)
  vim.cmd("!cmd.exe /c build -p " .. program)
end

vim.keymap.set("n", "<leader>comp", "<cmd>:lua CompileConversion()<cr>")
vim.keymap.set("n", "<leader>cr", "<cmd>:lua CompileConversion(nil,'-rebuild')<cr>")
vim.keymap.set("n", "<leader>ct", "<cmd>:lua ThrowConvertion()<cr>")
vim.keymap.set(
  "n",
  "<leader>lint",
  "<cmd>horizontal terminal harbour % -I/home/viniciusbelasco/harbour-core/include -I/mnt/c/fwh/include" ..
  " -I/home/viniciusbelasco/sgames/tgit/include -I/home/viniciusbelasco/sgames/tgit/new "..
  " -I/home/viniciusbelasco/sgames/tgit/fivewin -I/home/viniciusbelasco/sgames/tgit/src "..
  "-I/home/viniciusbelasco/sgames/tgit/programas_externos"..
  " -I/home/viniciusbelasco/sgames/tgit/programas_externos/conversoes/hbfunctions/include -w3 -n -s -DLINTER<CR>"
)
