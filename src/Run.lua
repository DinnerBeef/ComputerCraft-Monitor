-- List of all files in the program
programs = {}
programs["Main.lua"] = 1
programs["Players.lua"] = 1

for table, File in pairs(programs) do
    shell.run("delete " .. table)
    print('github get ' .. table .. " " .. table)
    shell.run('github get ' .. table .. " " .. table)
end
shell.run("Main")